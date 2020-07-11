const express = require('express');
const {
  addCart,
  getCart,
  clearCart,
  removeCartItem,
} = require('../../../controllers/cart');
const { isAuth } = require('../../../middleware/isAuth');

const Router = express.Router();

//Add to cart *user* and Get cart products *user* and Clear cart *user*
Router.route('/')
  .post(isAuth, addCart)
  .get(isAuth, getCart)
  .delete(isAuth, clearCart);

//Remove cart item*user*
Router.route('/:id').delete(isAuth, removeCartItem);

module.exports = Router;
