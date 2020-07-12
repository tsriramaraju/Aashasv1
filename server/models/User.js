const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  mobile: { type: Number, required: true, unique: true },
  image: { type: String },
  loginType: { type: String, enum: ['email', 'facebook'], default: 'email' },
  address: [
    {
      name: { type: String },
      house: { type: String },
      location: { type: String },
      street: { type: String },
      pin: { type: Number },
      city: { type: String },
      state: { type: String },
    },
  ],
  orders: [{ id: { type: mongoose.Schema.Types.ObjectId, ref: 'order' } }],
  cart: [{ type: mongoose.Schema.Types.ObjectId, ref: 'cart' }],
  favourite: [{ type: mongoose.Schema.Types.ObjectId, ref: 'favourite' }],
  customProducts: [
    { id: { type: mongoose.Schema.Types.ObjectId, ref: 'customProduct' } },
  ],
  date: {
    type: Date,
    default: Date.now(),
  },
});

module.exports = mongoose.model('user', UserSchema);
