const express = require('express');
const {
  requestCustom,
  getCustom,
  respondCustom,
  deleteCustom,
} = require('../../../controllers/customProducts');
const { isAuth } = require('../../../middleware/isAuth');
const { isAdmin } = require('../../../middleware/isAdmin');

const Router = express.Router();

//Request custom products *user* and Get custom products *user*
Router.route('/').post(isAuth, requestCustom).get(isAuth, getCustom);

//Respond custom products *admin* and Delete custom products *admin*
Router.route('/:id').put(isAdmin, respondCustom).delete(isAdmin, deleteCustom);

module.exports = Router;
