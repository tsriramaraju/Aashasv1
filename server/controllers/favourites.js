// @desc      Toggle favourites
// @route     POST /api/v1/favourites
// @access    user
exports.toggleFav = (req, res) => {
  res.json({ msg: 'toggleFav' });
};

// @desc      Get favourites
// @route     GET /api/v1/favourites
// @access    user
exports.getFav = (req, res) => {
  res.json({ msg: 'getFav' });
};
