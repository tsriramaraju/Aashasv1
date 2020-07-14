const express = require('express');
const Router = express.Router();
const { check } = require('express-validator');
const {
  registerUser,
  loginEmail,
  loginMobile,
  forgotPassword,
  resetPassword,
  updateUser,
  addAddress,
  removeAddress,
  removeUser,
  getUser,
  checkEmail,
  checkMobile,
} = require('../../../controllers/users');
const { isAuth } = require('../../../middleware/isAuth');

const nameValidation = check('name')
  .isString()
  .withMessage('User name must be String')
  .not()
  .isEmpty()
  .withMessage('User name is required')
  .isLength({ min: 3 })
  .withMessage('User name must be min 3 characters long')
  .trim();

const emailValidation = check('email')
  .isEmail()
  .withMessage('Please enter valid Email format')
  .not()
  .isEmpty()
  .withMessage('Email is required')
  .normalizeEmail()
  .isLength({ min: 3 })
  .withMessage('Email must be min 6 characters long');

const passwordValidation = check('password')
  .not()
  .isEmpty()
  .withMessage('Password is required')
  .isLength({ min: 6 })
  .withMessage('Password must be min 6 characters long')
  .trim();

const mobileValidation = check('mobile')
  .isNumeric()
  .withMessage('Please enter only number')
  .not()
  .isEmpty()
  .withMessage('Mobile no. is required')
  .isLength({ min: 10, max: 10 })
  .withMessage('Please enter valid mobile number')
  .trim();
const otpValidation = check('otp')
  .isNumeric()
  .withMessage('Please enter only number')
  .not()
  .isEmpty()
  .withMessage('OTP. is required')
  .isLength({ min: 4, max: 4 })
  .withMessage('Please enter valid OTP')
  .trim();

// const adrNameValidations;
// const adrHouseValidations;
// const adrLocationValidations;
// const adrStreetValidations;

//Register user
Router.route('/register').post(
  [
    nameValidation,
    emailValidation,
    passwordValidation,
    mobileValidation,
    otpValidation,
  ],
  registerUser
);

//Login User with email
Router.route('/login-email').post(
  [emailValidation, passwordValidation],
  loginEmail
);

//check email
Router.route('/check-email').post([emailValidation], checkEmail);

//check mobile
Router.route('/check-mobile').post([mobileValidation], checkMobile);

//Login User with mobile
Router.route('/login-mobile').post(
  [mobileValidation, otpValidation],
  loginMobile
);

//Get user details
Router.route('/').get(isAuth, getUser);

//Forgot password
Router.route('/forgot-password').post(forgotPassword);

//Reset password
Router.route('/reset-password').post(resetPassword);

//Update user *user*
Router.route('/update').post(
  isAuth,
  [nameValidation, emailValidation, mobileValidation],
  updateUser
);

//Add address *user*
Router.route('/address').post(isAuth, addAddress);

//remove address *user*
Router.route('/address/:id').delete(isAuth, removeAddress);

//Delete user *user*
Router.route('/').delete(isAuth, removeUser);

module.exports = Router;
