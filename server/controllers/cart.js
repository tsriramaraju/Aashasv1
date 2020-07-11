// @desc      Add to cart
// @route     POST /api/v1/cart
// @access    user
exports.addCart = (req, res) => {
  res.json({ msg: 'addCart' });
};

// @desc      Get cart items
// @route     GET /api/v1/cart
// @access    user
exports.getCart = (req, res) => {
  res.json({ msg: 'getCart' });
};

// @desc      Clear cart
// @route     DELETE /api/v1/cart
// @access    user
exports.clearCart = (req, res) => {
  res.json({ msg: 'clearCart' });
};

// @desc      Add to cart
// @route     Delete /api/v1/cart/:id
// @access    user
exports.removeCartItem = (req, res) => {
  res.json({ msg: 'removeCartItem ' + req.params.id });
};
