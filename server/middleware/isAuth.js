const jwt = require('jsonwebtoken');
const ErrorResponse = require('../utils/errorResponse');
const User = require('../models/User');
exports.isAuth = async (req, res, next) => {
  let token;

  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    // Set token from Bearer token in header
    token = req.headers.authorization.split(' ')[1];
    // Set token from cookie
  }

  // Make sure token exists
  if (!token) {
    return next(new ErrorResponse('Not authorized to access this route', 401));
  }

  try {
    // Verify token
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const user = await await User.findById(decoded.payload.id)
      .select('-password')
      .populate('cart favourite');
    if (user.isAdmin)
      return next(
        new ErrorResponse('Not authorized to access this route', 401)
      );
    req.user = user;
    next();
  } catch (err) {
    next(err);
    // return next(new ErrorResponse('Not authorized to access this route', 401));
  }
};
