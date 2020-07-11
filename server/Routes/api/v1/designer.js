const express = require('express');
const {
  updateDesigner,
  getDesigner,
  createBlog,
  getBlogs,
  removeBlog,
} = require('../../../controllers/designer');
const { isAdmin } = require('../../../middleware/isAdmin');
const Router = express.Router();

//Update designer info *admin* and Get designer info
Router.route('/').put(isAdmin, updateDesigner).get(getDesigner);

//Create blogs *admin* and Get blogs
Router.route('/blogs').post(isAdmin, createBlog).get(getBlogs);

//Remove blog *admin*
Router.route('/blogs/:id').delete(isAdmin, removeBlog);

module.exports = Router;
