const CustomProd = require('../models/CustomProduct');
const CustomProduct = require('../models/CustomProduct');
const User = require('../models/User');
const Cart = require('../models/Cart');
const Favourites = require('../models/Favourites');

// @desc      Request custom-product
// @route     POST /api/v1/custom-products
// @access    user
exports.requestCustom = async (req, res, next) => {
  const user = req.user;
  try {
    const customProd = new CustomProduct(req.body);
    await customProd.save();
    user.customProducts.push(customProd.id);
    await User.findByIdAndUpdate(req.user.id, user);
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

// @desc      Get custom-products
// @route     GET /api/v1/custom-products
// @access    user
exports.getCustom = async (req, res, next) => {
  try {
    const products = await User.findById(req.user.id)
      .select('customProducts')
      .populate('customProducts');
    res.json(products.customProducts);
  } catch (err) {
    next(err);
  }
};

// @desc      Respond custom-products
// @route     PUT /api/v1/custom-products/:id
// @access    admin
exports.respondCustom = async (req, res, next) => {
  const id = req.params.id;
  const {
    title,
    price,
    description,
    size,
    color,
    category,
    sub,
    refImages,
    finalImages,
  } = req.body;
  try {
    const product = { category: {} };
    if (title) product.title = title;
    if (price) product.price = price;
    if (description) product.description = description;
    if (size) product.size = size.split(' ');
    if (color) product.color = color.split(' ');
    if (finalImages) product.refImages = refImages.split(' ');
    if (refImages) product.finalImages = finalImages.split(' ');
    if (sub) product.category.sub = sub.split(' ');
    if (category) product.category.main = category;

    await CustomProduct.findByIdAndUpdate(id, product, {
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

// @desc      Delete custom-products
// @route     DELETE /api/v1/custom-products/:id
// @access    admin
exports.deleteCustom = async (req, res, next) => {
  try {
    const id = req.params.id;
    await CustomProduct.findByIdAndDelete(id);
    //delte products from cart
    await Cart.deleteMany({ prodId: id });

    //delte products from favourites
    await Favourites.deleteMany({ prodId: id });

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
