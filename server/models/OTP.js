const mongoose = require('mongoose');

const OTPSchema = new mongoose.Schema({
  otp: {
    type: Number,
  },
  date: {
    type: Date,
    unique: true,
    default: Date.now(),
    expires: 3500,
  },
  mobile: { type: Number },
});

module.exports = mongoose.model('otp', OTPSchema);
