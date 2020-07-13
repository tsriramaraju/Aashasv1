const mongoose = require('mongoose');

const OTPSchema = new mongoose.Schema({
  otp: {
    type: Number,
  },
  date: {
    type: Date,
    default: Date.now(),
  },
  mobile: { type: Number },
});

module.exports = mongoose.model('otp', OTPSchema);
