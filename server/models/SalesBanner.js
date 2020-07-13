const mongoose = require('mongoose');
const SalesBannerSchema = new mongoose.Schema({
  title: { type: String, unique: true, required: true },
  discount: { type: Number, unique: true, required: true },
  expiry: Date,
});

module.exports = mongoose.model('salesBanner', SalesBannerSchema);
