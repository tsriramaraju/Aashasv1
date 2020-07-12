const mongoose = require('mongoose');

const FavouriteSchema = new mongoose.Schema({
  prodId: { type: mongoose.Schema.Types.ObjectId, ref: 'product' },
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'user' },

  date: { type: Date, default: Date.now() },
});

module.exports = mongoose.model('favourite', FavouriteSchema);
