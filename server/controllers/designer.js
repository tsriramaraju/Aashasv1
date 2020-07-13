const Designer = require('../models/Designer');

// @desc      Update designer info
// @route     PUT /api/v1/designer
// @access    admin
exports.updateDesigner = async (req, res, next) => {
  try {
    // const des = new Designer();
    // await des.save();
    await Designer.findByIdAndUpdate('5f0c065914654c3a3cc7acae', req.body, {
      new: true,
      runValidators: true,
    });
    res.json({ msg: 'Designer successfuly updated' });
  } catch (error) {
    next(error);
  }
};

// @desc      Get designer info
// @route     GET /api/v1/designer
// @access    public
exports.getDesigner = async (req, res, next) => {
  try {
    const designer = await Designer.findById('5f0c065914654c3a3cc7acae');
    res.json(designer);
  } catch (error) {
    next(error);
  }
};

// @desc      Create blog
// @route     PUT /api/v1/designer/blogs
// @access    admin
exports.createBlog = async (req, res, next) => {
  try {
    const blogs = await Designer.findById('5f0c065914654c3a3cc7acae').select(
      'blogs'
    );
    blogs.blogs.push(req.body);
    await Designer.findByIdAndUpdate(
      '5f0c065914654c3a3cc7acae',
      { blogs: blogs.blogs },
      {
        new: true,
        runValidators: true,
      }
    );

    res.json({ msg: 'Blog created' });
  } catch (error) {
    next(error);
  }
};

// @desc      Get blogs
// @route     GET /api/v1/designer/blogs
// @access    public
exports.getBlogs = async (req, res, next) => {
  try {
    const blogs = await Designer.findById('5f0c065914654c3a3cc7acae').select(
      'blogs'
    );
    res.json(blogs.blogs);
  } catch (err) {
    next(err);
  }
};

// @desc      Remove blog
// @route     PUT /api/v1/designer/blogs/:id
// @access    admin
exports.removeBlog = async (req, res, next) => {
  try {
    const blogs = await Designer.findById('5f0c065914654c3a3cc7acae').select(
      'blogs'
    );
    const arrBlog = blogs.blogs.filter(
      (blog) => blog._id.toString() !== req.params.id.toString()
    );

    await Designer.findByIdAndUpdate(
      '5f0c065914654c3a3cc7acae',
      { blogs: arrBlog },
      {
        new: true,
        runValidators: true,
      }
    );

    res.json({ msg: 'Blog deleted' });
  } catch (error) {
    next(error);
  }
};
