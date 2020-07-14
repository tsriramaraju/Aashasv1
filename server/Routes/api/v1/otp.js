const express = require('express');
const { generateOTP, verifyOTP } = require('../../../controllers/otp');
const Router = express.Router();
const { check } = require('express-validator');
const otpValidation = check('otp')
  .isNumeric()
  .withMessage('Please enter only number')
  .not()
  .isEmpty()
  .withMessage('OTP. is required')
  .isLength({ min: 4, max: 4 })
  .withMessage('Please enter valid OTP')
  .trim();

const mobileValidation = check('mobile')
  .isNumeric()
  .withMessage('Please enter only number')
  .isLength({ min: 10, max: 10 })
  .withMessage('Please enter valid mobile number')
  .trim();
//Generate OTP
Router.route('/generate').post(generateOTP);

// verify OTP
Router.route('/').post(otpValidation, verifyOTP);
module.exports = Router;
