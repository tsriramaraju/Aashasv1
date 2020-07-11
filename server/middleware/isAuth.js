exports.isAuth = (req, res, next) => {
  // res.json({ msg: 'authenticated' });
  console.log('authenticated');
  next();
};
