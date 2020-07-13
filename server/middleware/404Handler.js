const unblundHandler = (req, res, next) => {
  res.status(404).json([
    {
      msg: 'Requested route not found',
    },
  ]);
};

module.exports = unblundHandler;
