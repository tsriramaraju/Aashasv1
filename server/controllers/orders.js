// @desc      Get all orders
// @route     GET /api/v1/orders
// @access    admin
exports.getOrders = (req, res) => {
  res.json({ msg: 'getOrders' });
};

// @desc      Get my orders
// @route     GET /api/v1/orders/get
// @access    user
exports.getMyOrders = (req, res) => {
  res.json({ msg: 'getMyOrders' });
};

// @desc      Get order status
// @route     GET /api/v1/orders/:id/:mobile
// @access    public
exports.getOrderStatus = (req, res) => {
  res.json({ msg: 'getOrderStatus ' + req.params.id + req.params.mobile });
};

// @desc      Place order
// @route     POST /api/v1/orders
// @access    user
exports.placeOrder = (req, res) => {
  res.json({ msg: 'placeOrder' });
};

// @desc      Update order status
// @route     PUT /api/v1/orders/:id
// @access    admin
exports.updateOrderStatus = (req, res) => {
  res.json({ msg: 'updateOrderStatus ' + req.params.id });
};

// @desc      Calculate shipping
// @route     POST /api/v1/orders/shipping
// @access    public
exports.calcualateShipping = (req, res) => {
  res.json({ msg: 'calcualateShipping' });
};
