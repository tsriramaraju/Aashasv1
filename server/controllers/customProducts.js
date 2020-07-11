// @desc      Request custom-product
// @route     POST /api/v1/custom-products
// @access    user
exports.requestCustom = (req, res) => {
  res.json({ msg: 'requestCustom' });
};

// @desc      Get custom-products
// @route     GET /api/v1/custom-products
// @access    user
exports.getCustom = (req, res) => {
  res.json({ msg: 'getCustom' });
};

// @desc      Respond custom-products
// @route     PUT /api/v1/custom-products/:id
// @access    admin
exports.respondCustom = (req, res) => {
  res.json({ msg: 'respondCustom ' + req.params.id });
};

// @desc      Delete custom-products
// @route     DELETE /api/v1/custom-products/:id
// @access    admin
exports.deleteCustom = (req, res) => {
  res.json({ msg: 'deleteCustom ' + req.params.id });
};
