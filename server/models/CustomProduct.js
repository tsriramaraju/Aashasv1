const mongoose = require('mongoose');

const CustomProdSchema = new mongoose.Schema({
  title: { type: String, unique: true },
  description: { type: String },
  size: [{ type: String }],
  price: { type: Number },
  color: [{ type: String }],
  category: {
    main: { type: String },
    sub: [{ type: String }],
  },
  refImages: [{ type: String }],
  finalImages: [{ type: String }],
});

module.exports = mongoose.model('customProduct', CustomProdSchema);
