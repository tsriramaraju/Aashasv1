const errorHandler = (err, req, res, next) => {
  console.log(`${err}`.error);
  res.status(500).send('<h2>Oops something broke</h2>');
};

module.exports = errorHandler;
