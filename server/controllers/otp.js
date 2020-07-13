const OTP = require('../models/OTP');
const { validationResult } = require('express-validator');
// @desc      Generate otp
// @route     GET /api/v1/otp/generate
// @access    public
exports.generateOTP = async (req, res, next) => {
  const errors = validationResult(req).errors;
  if (errors.length > 0) return res.status(400).json(errors);
  try {
    const otp = new OTP({
      otp: Math.floor(1000 + Math.random() * 8000),
      mobile: req.body.mobile,
      date: Date.now(),
    });
    await otp.save();
    res.json({ msg: 'generated OTP', otp: otp.otp });
  } catch (err) {
    next(err);
  }
};

// @desc      Verify otp
// @route     POST /api/v1/otp/verify
// @access    public
exports.verifyOTP = async (req, res, next) => {
  const errors = validationResult(req).errors;
  if (errors.length > 0) return res.status(400).json(errors);
  try {
    const getOtp = await OTP.findOne({ otp: req.body.otp });

    if (!getOtp) return res.status(400).json([{ msg: 'Invalid OTP' }]);
    const diff = parseInt((Date.now() - getOtp.date) / 1000);
    if (diff > 180) return res.status(400).json([{ msg: 'OTP Expired', diff }]);
    if (getOtp.mobile !== req.body.mobile)
      return res.status(400).json([{ msg: 'No data found' }]);
    res.json({ msg: 'Opt validated', diff });
  } catch (err) {
    next(err);
  }
};
