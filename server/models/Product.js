const mongoose = require('mongoose');
const ProductSchema = new mongoose.Schema({
  title: { type: String, unique: true },
  description: { type: String },
  size: [{ type: String }],
  price: { type: Number },
  color: [{ type: String }],

  category: {
    main: { type: String },
    sub: [{ type: String }],
  },
  images: [{ type: String }],
  discount: { type: Number },
  inOffer: { type: Boolean, default: false },
  isNewProduct: { type: Boolean, default: false },
  desginerCollection: { type: Boolean, default: false },
  trending: { type: Boolean, default: false },
  isFavourite: { type: Boolean, default: false },
});

module.exports = mongoose.model('product', ProductSchema);
