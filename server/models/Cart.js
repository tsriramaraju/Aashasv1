const mongoose = require('mongoose');

const CartSchema = new mongoose.Schema({
  prodId: { type: mongoose.Schema.Types.ObjectId, ref: 'product' },
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'user' },
  size: String,
  date: { type: Date, default: Date.now() },
});

module.exports = mongoose.model('cart', CartSchema);
