// @desc      Update designer info
// @route     PUT /api/v1/designer
// @access    admin
exports.updateDesigner = (req, res) => {
  res.json({ msg: 'updateDesigner' });
};

// @desc      Get designer info
// @route     GET /api/v1/designer
// @access    public
exports.getDesigner = (req, res) => {
  res.json({ msg: 'getDesigner' });
};

// @desc      Create blog
// @route     PUT /api/v1/designer/blogs
// @access    admin
exports.createBlog = (req, res) => {
  res.json({ msg: 'createBlog' });
};

// @desc      Get blogs
// @route     GET /api/v1/designer/blogs
// @access    public
exports.getBlogs = (req, res) => {
  res.json({ msg: 'getBlogs' });
};

// @desc      Remove blog
// @route     PUT /api/v1/designer/blogs/:id
// @access    admin
exports.removeBlog = (req, res) => {
  res.json({ msg: 'removeBlog ' + req.params.id });
};
