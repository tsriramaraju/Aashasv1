const User = require('../models/User');
const OTP = require('../models/OTP');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { validationResult } = require('express-validator');
const accountSid = process.env.TWILIO_SID;
const authToken = process.env.TWILIO_TOKEN;
const client = require('twilio')(accountSid, authToken);

// @desc      Register  user
// @route     POST /api/v1/users/register
// @access    public
exports.registerUser = async (req, res, next) => {
  const errors = validationResult(req).errors;
  if (errors.length > 0) return res.status(400).json(errors);
  const { name, email, password, mobile, otp } = req.body;
  if (req.body.isAdmin) return res.status(400).json({ msg: 'gotcha idiot' });
  try {
    const salt = 10;
    const hash = await bcrypt.hash(password, salt);
    const user = new User({ name, email, password: hash, mobile });
    //verify OTP
    const getOtp = await OTP.findOne({ otp: otp });
    if (!getOtp) return res.status(400).json([{ msg: 'Invalid OTP' }]);
    1;
    const diff = parseInt((Date.now() - getOtp.date) / 1000);
    if (diff > 180) return res.status(400).json([{ msg: 'OTP Expired', diff }]);
    //save User
    await user.save();
    const secret = process.env.JWT_SECRET;
    const token = jwt.sign({ payload: { id: user.id } }, secret, {
      expiresIn: 350000,
    });
    res.json({ token, msg: 'User successfuly registered' });
  } catch (error) {
    next(error);
  }
};

// @desc      Email login
// @route     POST /api/v1/users/login-email
// @access    public
exports.loginEmail = async (req, res, next) => {
  const errors = validationResult(req).errors;
  if (errors.length > 0) return res.status(400).json(errors);
  const { email, password } = req.body;
  try {
    //Check User

    const user = await User.findOne({ email });
    if (!user) return res.status(400).json([{ msg: 'No user found...' }]);
    //check password
    const match = await bcrypt.compare(password, user.password);
    if (!match) return res.status(400).json([{ msg: 'Invalid password...' }]);
    //create JWT Token
    const secret = process.env.JWT_SECRET;
    const token = jwt.sign({ payload: { id: user.id } }, secret, {
      expiresIn: 350000,
    });
    //send response
    res.json({ token, msg: 'Login success' });
  } catch (error) {
    next(error);
  }
};

// @desc      Mobile login
// @route     POST /api/v1/users/login-mobile
// @access    public
exports.loginMobile = async (req, res, next) => {
  const errors = validationResult(req).errors;
  if (errors.length > 0) return res.status(400).json(errors);
  const { mobile } = req.body;
  try {
    //Check User
    const user = await User.findOne({ mobile });
    if (!user) return res.status(400).json([{ msg: 'No user found...' }]);
    //verify OTP

    const getOtp = await OTP.findOne({ otp: req.body.otp });
    if (!getOtp) return res.status(400).json([{ msg: 'Invalid OTP' }]);

    const diff = parseInt((Date.now() - getOtp.date) / 1000);
    if (diff > 180) return res.status(400).json([{ msg: 'OTP Expired', diff }]);

    //create JWT Token
    const secret = process.env.JWT_SECRET;
    const token = jwt.sign({ payload: { id: user.id } }, secret, {
      expiresIn: 35000,
    });
    //send response
    res.json({ token, msg: getOtp, diff });
  } catch (error) {
    next(error);
  }
};

// @desc      forgot password
// @route     POST /api/v1/users/forgot-password
// @access    public
exports.getUser = (req, res) => {
  const user = req.user;
  res.json(user);
};

// @desc      forgot password
// @route     POST /api/v1/users/forgot-password
// @access    public
exports.forgotPassword = async (req, res, next) => {
  try {
    const otp = new OTP({
      otp: Math.floor(1000 + Math.random() * 8000),
      mobile: +req.body.mobile,
      date: Date.now(),
    });
    await otp.save();
    await client.messages.create({
      body: `Your authentication OTP ${otp.otp}`,
      to: '+91 91210 03535',
      from: '+13343842141',
    });
    res.json({ msg: 'generated OTP', otp: otp.otp });
  } catch (err) {
    next(err);
  }
};

// @desc      reset password
// @route     POST /api/v1/users/reset-password
// @access    public
exports.resetPassword = async (req, res, next) => {
  try {
    const getOtp = await OTP.findOne({ otp: req.body.otp });

    if (!getOtp) return res.status(400).json([{ msg: 'Invalid OTP' }]);
    const diff = parseInt((Date.now() - getOtp.date) / 1000);
    if (diff > 180) return res.status(400).json([{ msg: 'OTP Expired', diff }]);
    if (getOtp.mobile !== req.body.mobile)
      return res.status(400).json([{ msg: 'No data found' }]);
    const hash = await bcrypt.hash(req.body.password, 10);
    const user = await User.findOneAndUpdate(
      { mobile: req.body.mobile },
      { password: hash }
    );
    res.json({ msg: 'password Updated', user });
  } catch (err) {
    next(err);
  }
};

// @desc      update user details
// @route     POST /api/v1/users/update
// @access    user
exports.updateUser = async (req, res, next) => {
  const errors = validationResult(req).errors;
  if (errors.length > 0) return res.status(400).json(errors);
  if (req.body.isAdmin) return res.status(400).json({ msg: 'gotcha idiot' });
  try {
    const user = req.user;
    await User.findByIdAndUpdate(user.id, req.body, {
      new: true,
      runValidators: true,
    });
    res.json({ msg: 'User successfuly updated' });
  } catch (error) {
    next(error);
  }
};
// @desc      add address
// @route     POST /api/v1/users/address
// @access    user
exports.addAddress = async (req, res, next) => {
  // const errors = validationResult(req).errors;
  // if (errors.length > 0) return res.status(400).json(errors);

  try {
    const user = req.user;
    const address = [...req.user.address];
    address.push(req.body);
    console.log(address);
    await User.findByIdAndUpdate(
      user.id,
      { address: address },
      {
        new: true,
        runValidators: true,
      }
    );
    res.json({ msg: 'Added Address' });
  } catch (error) {
    next(error);
  }
};

// @desc      remove address
// @route     DELETE /api/v1/users/address/:id
// @access    user
exports.removeAddress = async (req, res, next) => {
  const id = req.params.id;
  const user = req.user;
  const address = [...user.address];
  const updatedAddress = address.filter((add) => add._id.toString() !== id);
  try {
    await User.findByIdAndUpdate(
      user.id,
      { address: updatedAddress },
      {
        new: true,
        runValidators: true,
      }
    );
    res.json({ msg: ' Address Removed' });
  } catch (error) {
    next(error);
  }
};

// @desc      remove user
// @route     DELETE /api/v1/users/
// @access    user
exports.removeUser = async (req, res, next) => {
  try {
    const user = req.user;
    await User.findByIdAndDelete(user._id);
    res.json({ msg: ' User Deleted' });
  } catch (err) {
    next(err);
  }
};
