const Order = require('../models/Order');
const User = require('../models/User');
const axios = require('axios');
const request = require('request');
// @desc      Get all orders
// @route     GET /api/v1/orders
// @access    admin
exports.getOrders = async (req, res, next) => {
  try {
    const result = await Order.find();
    res.json(result);
  } catch (error) {
    next(error);
  }
};

// @desc      Get my orders
// @route     GET /api/v1/orders/get
// @access    user
exports.getMyOrders = async (req, res, next) => {
  try {
    const result = await Order.find({ userId: req.user._id });
    res.json(result);
  } catch (error) {
    next(error);
  }
};

// @desc      Get order status
// @route     GET /api/v1/orders/:id/:mobile
// @access    public
exports.getOrderStatus = async (req, res, next) => {
  try {
    const result = await Order.find({
      _id: req.params.id,
      mobile: req.params.mobile,
    }).select('status');
    res.json(result);
  } catch (error) {
    next(error);
  }
};

// @desc      Place order
// @route     POST /api/v1/orders
// @access    user
exports.placeOrder = async (req, res, next) => {
  const user = req.user;
  try {
    const result = await User.findById(user._id)
      .select('cart')
      .populate({
        path: 'cart',
        model: 'cart',
        populate: {
          path: 'prodId',
          model: 'product',
        },
      });
    console.log(req.body.items);
    const selectedSize = [];
    result.cart.forEach((cart) => {
      items.push(cart.prodId);
      selectedSize.push(cart.size);
    });

    req.body.userId = user._id;
    req.body.selectedSize = selectedSize;

    const order = new Order(req.body);
    const orderResult = await order.save();
    user.orders.push(order.id);
    await User.findByIdAndUpdate(user._id, { orders: user.orders });
    res.json(orderResult);
  } catch (err) {
    next(err);
  }
};

// @desc      Update order status
// @route     PUT /api/v1/orders/:id
// @access    admin
exports.updateOrderStatus = async (req, res, next) => {
  try {
    const result = await Order.findByIdAndUpdate(req.params.id, req.body);
    res.json(result);
  } catch (err) {
    next(err);
  }
};

// @desc      Calculate shipping
// @route     POST /api/v1/orders/shipping
// @access    public
exports.calcualateShipping = async (req, res, next) => {
  var options = {
    method: 'POST',
    url: 'https://sandbox-api.postmen.com/v3/rates',
    headers: {
      'content-type': 'application/json',
      'postmen-api-key': 'c92bbb3b-e433-4408-9fd9-ddd6aa4f79ab',
    },
    body:
      '{"async":false,"shipper_accounts":[{"id":"6f43fe77-b056-45c3-bce4-9fec4040da0c"}],"is_document":false,"shipment":{"ship_from":{"contact_name":"Elmira Zulauf","company_name":"Kemmer-Gerhold","street1":"662 Flatley Manors","country":"HKG","type":"business"},"ship_to":{"contact_name":"Dr. Moises Corwin","phone":"1-140-225-6410","email":"Giovanna42@yahoo.com","street1":"28292 Daugherty Orchard","city":"Beverly Hills","postal_code":"530013","state":"AP","country":"IN","type":"residential"},"parcels":[{"description":"Food XS","box_type":"custom","weight":{"value":2,"unit":"kg"},"dimension":{"width":20,"height":40,"depth":40,"unit":"cm"},"items":[{"description":"Food Bar","origin_country":"IND","quantity":2,"price":{"amount":3,"currency":"INR"},"weight":{"value":0.6,"unit":"kg"},"sku":"imac2014"}]}]}}',
  };

  request(options, function (error, response, body) {
    if (error) throw new Error(error);
    const data = JSON.parse(response.body);
    // res.json(data);
    res.json(data.data.rates[0].total_charge.amount);
  });
};
