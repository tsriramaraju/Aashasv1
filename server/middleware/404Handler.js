const unblundHandler = (req, res, next) => {
  res.status(404).redirect([
    {
      msg: 'Requested route not found',
    },
  ]);
};

module.exports = unblundHandler;
