const express = require('express');
const {
  createBanner,
  getBanners,
  removeBanner,
} = require('../../../controllers/salesBanner');
const { isAdmin } = require('../../../middleware/isAdmin');
const Router = express.Router();

//Create sales banner *admin* and Get banner
Router.route('/').post(isAdmin, createBanner).get(getBanners);

//remove sales banner *admin*
Router.route('/:id').delete(isAdmin, removeBanner);

module.exports = Router;
