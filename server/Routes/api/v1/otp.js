const express = require('express');
const { generateOTP, verifyOTP } = require('../../../controllers/otp');
const Router = express.Router();

//Generate OTP
Router.route('/generate').post(generateOTP);

//Verify OTP
Router.route('/verify').post(verifyOTP);

module.exports = Router;
