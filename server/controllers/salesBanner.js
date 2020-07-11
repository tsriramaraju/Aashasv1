// @desc      create sales banner
// @route     POST /api/v1/sales-banner
// @access    admin
exports.createBanner = (req, res) => {
  res.json({ msg: 'createBanner' });
};

// @desc      Get sales banner
// @route     GET /api/v1/sales-banner
// @access    public
exports.getBanners = (req, res) => {
  res.json({ msg: 'getBanners' });
};

// @desc      Remove sales banner
// @route     REMOVE /api/v1/sales-banner/:id
// @access    admin
exports.removeBanner = (req, res) => {
  res.json({ msg: 'removeBanner ' + req.params.id });
};
