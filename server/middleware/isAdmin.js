exports.isAdmin = (req, res, next) => {
  // res.json({ msg: 'admin' });
  console.log('is Admin');
  next();
};
