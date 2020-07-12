const express = require('express');
const { check } = require('express-validator');
const {
  createProduct,
  getProducts,
  updateProduct,
  deleteProduct,
  getTrendyProducts,
  getDesignerProducts,
  addOfferToAll,
  removeOfferFromAll,
  removeOfferFromSpecific,
  addOfferToSpecific,
} = require('../../../controllers/products');
const { isAdmin } = require('../../../middleware/isAdmin');
const Router = express.Router();

//Create  product *admin* and get products
Router.route('/').post(isAdmin, createProduct).get(getProducts);

//Get trendy products
Router.route('/trend').get(getTrendyProducts);

//Get designer products
Router.route('/designer').get(getDesignerProducts);

//Add offer to all products *admin*
Router.route('/offer-create').put(isAdmin, addOfferToAll);

//Remove offer from all products *admin*
Router.route('/offer-remove').put(isAdmin, removeOfferFromAll);

//Add offer to category *admin*
Router.route('/offer-create-specific').put(isAdmin, addOfferToSpecific);

//Remove offer from category *admin*
Router.route('/offer-remove-specific').put(isAdmin, removeOfferFromSpecific);

//Update  product *admin* and Delete products *admin*
Router.route('/:id').put(isAdmin, updateProduct).delete(isAdmin, deleteProduct);

module.exports = Router;
