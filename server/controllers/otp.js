// @desc      Generate otp
// @route     POST /api/v1/otp/generate
// @access    public
exports.generateOTP = (req, res) => {
  res.json({ msg: 'generateOTP' });
};

// @desc      Verify otp
// @route     POST /api/v1/otp/verify
// @access    public
exports.verifyOTP = (req, res) => {
  res.json({ msg: 'verifyOTP' });
};
