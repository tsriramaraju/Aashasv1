const express = require('express');
const Router = express.Router();

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
} = require('../../../controllers/users');
const { isAuth } = require('../../../middleware/isAuth');

//Register user
Router.route('/register').post(registerUser);

//Login User with email
Router.route('/login-email').post(loginEmail);

//Login User with mobile
Router.route('/login-mobile').post(loginMobile);

//Forgot password
Router.route('/forgot-password').post(forgotPassword);

//Reset password
Router.route('/reset-password').post(resetPassword);

//Update user *user*
Router.route('/update').post(isAuth, updateUser);

//Add address *user*
Router.route('/address').post(isAuth, addAddress);

//remove address *user*
Router.route('/address/:id').delete(isAuth, removeAddress);

//Delete user *user*
Router.route('/').delete(isAuth, removeUser);

module.exports = Router;
