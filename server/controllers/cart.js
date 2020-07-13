const Cart = require('../models/Cart');
const User = require('../models/User');
const { populate } = require('../models/User');
// @desc      Add to cart
// @route     POST /api/v1/cart
// @access    user
exports.addCart = async (req, res, next) => {
  const user = req.user;
  try {
    //check if product added or not
    const usercartcheck = user.cart.filter(
      (carts) => carts.prodId.toString() === req.body.prodId.toString()
    );
    console.log(usercartcheck);
    if (usercartcheck.length > 0)
      return res.status(400).json('msg:product exists');

    const cart = new Cart({
      userId: user._id,
      prodId: req.body.prodId,
      size: req.body.size,
    });
    const result = await cart.save();

    // update in user data
    const usercart = user.cart.filter(
      (carts) => carts.id.toString() !== result._id
    );

    usercart.push(cart.id);

    const update = await User.findByIdAndUpdate(
      user._id,
      { cart: [...usercart] },
      { new: true, runValidators: true }
    );
    console.log(user);
    res.json([{ sucess: 'sucess', msg: 'Cart added suceffully' }]);
  } catch (error) {
    next(error);
  }
};

// @desc      Get cart items
// @route     GET /api/v1/cart
// @access    user
exports.getCart = async (req, res, next) => {
  try {
    const result = await User.findById(req.user._id)
      .select('cart')
      .populate({
        path: 'cart',
        model: 'cart',
        populate: {
          path: 'prodId',
          model: 'product',
        },
      });

    res.json(result.cart);
  } catch (error) {
    next(error);
  }
};

// @desc      Clear cart
// @route     DELETE /api/v1/cart
// @access    user
exports.clearCart = async (req, res, next) => {
  try {
    await User.findByIdAndUpdate(
      req.user._id,
      { cart: [] },
      { new: true, runValidators: true }
    );
    await Cart.deleteMany({ userId: req.user._id });
    res.json([{ status: 'success', msg: 'Cart cleared' }]);
  } catch (error) {
    next(error);
  }
};

// @desc      Add to cart
// @route     Delete /api/v1/cart/:id
// @access    user
exports.removeCartItem = async (req, res, next) => {
  const user = req.user;
  const id = req.params.id;
  try {
    const usercartcheck = user.cart.filter(
      (carts) => carts._id.toString() !== id.toString()
    );
    await User.findByIdAndUpdate(
      req.user._id,
      { cart: usercartcheck },
      { new: true, runValidators: true }
    );

    await Cart.findByIdAndDelete(id);
    res.json([{ status: 'success', msg: 'Cart removed' }]);
  } catch (error) {
    next(error);
  }
};
