// @desc      create product
// @route     POST /api/v1/products
// @access    admin
exports.createProduct = (req, res) => {
  res.json({ msg: 'createProduct' });
};

// @desc      Get products
// @route     GET /api/v1/products
// @access    public
exports.getProducts = (req, res) => {
  res.json({ msg: 'getProducts' });
};

// @desc      Update product
// @route     PUT /api/v1/products/:id
// @access    admin
exports.updateProduct = (req, res) => {
  res.json({ msg: 'updateProduct ' + req.params.id });
};

// @desc      Delete product
// @route     DELETE /api/v1/products/:id
// @access    admin
exports.deleteProduct = (req, res) => {
  res.json({ msg: 'deleteProduct ' + req.params.id });
};

// @desc      Get trendy products
// @route     GET /api/v1/products/trend
// @access    public
exports.getTrendyProducts = (req, res) => {
  res.json({ msg: 'getTrendyProducts' });
};

// @desc      Get designer products
// @route     GET /api/v1/products/designer
// @access    public
exports.getDesignerProducts = (req, res) => {
  res.json({ msg: 'getDesignerProducts' });
};

// @desc      Add offer to all products
// @route     PUT /api/v1/products/offer-create
// @access    admin
exports.addOfferToAll = (req, res) => {
  res.json({ msg: 'addOfferToAll' });
};

// @desc     Remove offer from all products
// @route     PUT /api/v1/products/offer-remove
// @access    admin
exports.removeOfferFromAll = (req, res) => {
  res.json({ msg: 'removeOfferFromAll' });
};

// @desc      Add offer to category
// @route     PUT /api/v1/products/offer-create-specific
// @access    admin
exports.addOfferToSpecific = (req, res) => {
  res.json({ msg: 'addOfferToSpecific' });
};

// @desc      Remove offer from category
// @route     PUT /api/v1/products/offer-remove-specific
// @access    admin
exports.removeOfferFromSpecific = (req, res) => {
  res.json({ msg: 'removeOfferFromSpecific' });
};
