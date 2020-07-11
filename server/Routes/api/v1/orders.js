const express = require('express');
const {
  getOrders,
  getMyOrders,
  getOrderStatus,
  placeOrder,
  updateOrderStatus,
  calcualateShipping,
} = require('../../../controllers/orders');
const { isAuth } = require('../../../middleware/isAuth');
const { isAdmin } = require('../../../middleware/isAdmin');
const Router = express.Router();

//Get all orders *admin* & Place order *user*
Router.route('/').get(isAdmin, getOrders).post(isAuth, placeOrder);

//Get my orders *user*
Router.route('/get').get(isAuth, getMyOrders);

//Get order status
Router.route('/:id/:mobile').get(getOrderStatus);

//Update order status *admin*
Router.route('/:id').put(isAdmin, updateOrderStatus);

//Calculate shipping
Router.route('/calculate-shipping').post(calcualateShipping);

module.exports = Router;
