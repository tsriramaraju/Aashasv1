const express = require('express');
const { toggleFav, getFav } = require('../../../controllers/favourites');
const { isAuth } = require('../../../middleware/isAuth');

const Router = express.Router();

//Toggle Favourites *user* and Get Favourites *user*
Router.route('/').post(isAuth, toggleFav).get(isAuth, getFav);

module.exports = Router;
