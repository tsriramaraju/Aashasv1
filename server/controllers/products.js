const Product = require('../models/Product');
const { validationResult } = require('express-validator');

// @desc      create product
// @route     POST /api/v1/products
// @access    admin
exports.createProduct = async (req, res, next) => {
  const {
    title,
    price,
    description,
    size,
    color,
    category,
    sub,
    images,
    discount,
    inOffer,
    isNewProduct,
    desginerCollection,
    trending,
  } = req.body;
  try {
    const sizeArray = size.split(' ');
    const colorArray = color.split(' ');
    const subArray = sub.split(' ');
    const imagesArray = images.split(' ');

    const product = new Product({
      title,
      price,
      description,
      size: sizeArray,
      color: colorArray,
      'category.main': category,
      'category.sub': subArray,
      images: imagesArray,
      discount,
      inOffer,
      isNewProduct,
      desginerCollection,
      trending,
    });

    await product.save();

    res.json([
      {
        success: true,
        msg: 'Product suceffuly added',
      },
    ]);
  } catch (err) {
    next(err);
  }
};

// @desc      Get products
// @route     GET /api/v1/products
// @access    public
exports.getProducts = async (req, res, next) => {
  try {
    const result = await Product.find();
    res.json(result);
  } catch (err) {
    next(err);
  }
};

// @desc      Update product
// @route     PUT /api/v1/products/:id
// @access    admin
exports.updateProduct = async (req, res, next) => {
  const id = req.params.id;
  const {
    title,
    price,
    description,
    size,
    color,
    category,
    sub,
    images,
    discount,
    inOffer,
    isNewProduct,
    desginerCollection,
    trending,
  } = req.body;
  try {
    const product = { category: {} };
    if (title) product.title = title;
    if (price) product.price = price;
    if (description) product.description = description;
    if (size) product.size = size.split(' ');
    if (color) product.color = color.split(' ');
    if (images) product.images = images.split(' ');
    if (sub) product.category.sub = sub.split(' ');
    if (category) product.category.main = category;
    if (discount) product.discount = discount;
    if (inOffer) product.inOffer = inOffer;
    if (isNewProduct) product.isNewProduct = isNewProduct;
    if (desginerCollection) product.desginerCollection = desginerCollection;
    if (trending) product.trending = trending;

    await Product.findByIdAndUpdate(id, product, {
      new: true,
      runValidators: true,
    });

    res.json([
      {
        success: true,
        msg: 'Product suceffuly Updated',
      },
    ]);
  } catch (err) {
    next(err);
  }
};

// @desc      Delete product
// @route     DELETE /api/v1/products/:id
// @access    admin
exports.deleteProduct = async (req, res, next) => {
  try {
    const id = req.params.id;
    await Product.findByIdAndDelete(id);
    //delte products from cart
    //delte products from favourites
    res.json([
      {
        success: 'success',
        msg: 'Product removed successfully',
      },
    ]);
  } catch (err) {
    next(err);
  }
};

// @desc      Get trendy products
// @route     GET /api/v1/products/trend
// @access    public
exports.getTrendyProducts = async (req, res, next) => {
  try {
    const result = await Product.find({ trending: true });
    res.json(result);
  } catch (err) {
    next(err);
  }
};

// @desc      Get designer products
// @route     GET /api/v1/products/designer
// @access    public
exports.getDesignerProducts = async (req, res, next) => {
  try {
    const result = await Product.find({ desginerCollection: true });
    res.json(result);
  } catch (err) {
    next(err);
  }
};

// @desc      Add offer to all products
// @route     PUT /api/v1/products/offer-create
// @access    admin
exports.addOfferToAll = async (req, res, next) => {
  try {
    await Product.updateMany({ price: { $gte: 5 } }, req.body);
    res.json([
      {
        success: 'success',
        msg: 'Offer added to all products successfully',
      },
    ]);
  } catch (err) {
    next(err);
  }
};

// @desc     Remove offer from all products
// @route     PUT /api/v1/products/offer-remove
// @access    admin
exports.removeOfferFromAll = async (req, res, next) => {
  try {
    await Product.updateMany({ price: { $gte: 5 } }, req.body);
    res.json([
      {
        success: 'success',
        msg: 'Offer added removed from all products successfully',
      },
    ]);
  } catch (err) {
    next(err);
  }
};

// @desc      Add offer to category
// @route     PUT /api/v1/products/offer-create-specific
// @access    admin
exports.addOfferToSpecific = async (req, res, next) => {
  const { isOffer, sub, category, discount } = req.body;
  try {
    await Product.updateMany(
      {
        $or: [
          { 'category.main': category },
          { 'category.sub': { $elemMatch: { $in: sub } } },
        ],
      },
      { isOffer, discount }
    );
    res.json([
      {
        success: 'success',
        msg: 'Offer added to all spedific products successfully',
      },
    ]);
  } catch (err) {
    next(err);
  }
};

// @desc      Remove offer from category
// @route     PUT /api/v1/products/offer-remove-specific
// @access    admin
exports.removeOfferFromSpecific = async (req, res, next) => {
  const { isOffer, sub, category, discount } = req.body;
  try {
    await Product.updateMany(
      {
        $or: [
          { 'category.main': category },
          { 'category.sub': { $elemMatch: { $in: sub } } },
        ],
      },
      { isOffer, discount }
    );
    res.json([
      {
        success: 'success',
        msg: 'Offer removed from all spedific products successfully',
      },
    ]);
  } catch (err) {
    next(err);
  }
};
