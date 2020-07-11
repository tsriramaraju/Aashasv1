// @desc      Register  user
// @route     POST /api/v1/users/register
// @access    public
exports.registerUser = (req, res) => {
  res.json({ msg: 'registerUser' });
};

// @desc      Email login
// @route     POST /api/v1/users/login-email
// @access    public
exports.loginEmail = (req, res) => {
  res.json({ msg: 'loginEmail' });
};

// @desc      Mobile login
// @route     POST /api/v1/users/login-mobile
// @access    public
exports.loginMobile = (req, res) => {
  res.json({ msg: 'loginMobile' });
};

// @desc      forgot password
// @route     POST /api/v1/users/forgot-password
// @access    public
exports.forgotPassword = (req, res) => {
  res.json({ msg: 'forgotPassword' });
};

// @desc      reset password
// @route     POST /api/v1/users/reset-password
// @access    public
exports.resetPassword = (req, res) => {
  res.json({ msg: 'resetPassword' });
};

// @desc      update user details
// @route     POST /api/v1/users/update
// @access    user
exports.updateUser = (req, res) => {
  res.json({ msg: 'updateUser' });
};

// @desc      add address
// @route     POST /api/v1/users/address
// @access    user
exports.addAddress = (req, res) => {
  res.json({ msg: 'addAddress' });
};

// @desc      remove address
// @route     DELETE /api/v1/users/address/:id
// @access    user
exports.removeAddress = (req, res) => {
  res.json({ msg: 'removeAddress' + req.params.id });
};

// @desc      remove user
// @route     DELETE /api/v1/users/
// @access    user
exports.removeUser = (req, res) => {
  res.json({ msg: 'removeUser' });
};
