const Favourite = require('../models/Favourites');
const User = require('../models/User');
// @desc      Toggle favourites
// @route     POST /api/v1/favourites
// @access    user
exports.toggleFav = async (req, res, next) => {
  try {
    const user = req.user;
    const id = req.body.prodId;
    const favourite = new Favourite({
      userId: user._id,
      prodId: id,
    });
    //check for existing fav arr
    // console.log(user);
    const userFavArr = user.favourite.filter(
      (fav) => fav.prodId.toString() === id.toString()
    );
    console.log(userFavArr);
    if (userFavArr.length > 0) {
      const userUpdFavArr = user.favourite.filter(
        (fav) => fav.prodId.toString() !== id.toString()
      );
      await User.findByIdAndUpdate(
        req.user._id,
        { favourite: userUpdFavArr },
        { new: true, runValidators: true }
      );

      await Favourite.findByIdAndDelete(favourite.id);
      return res.json([{ status: 'success', msg: 'Favourite  removed' }]);
    }

    //add fav

    const result = await favourite.save();

    // update in user data
    const userfavourites = user.favourite.filter(
      (ufav) => ufav.id.toString() !== result._id
    );

    userfavourites.push(favourite.id);

    const update = await User.findByIdAndUpdate(
      user._id,
      { favourite: [...userfavourites] },
      { new: true, runValidators: true }
    );
    // console.log(user);
    res.json([{ sucess: 'sucess', msg: 'Favourites added suceffully' }]);
  } catch (err) {
    next(err);
  }
};

// @desc      Get favourites
// @route     GET /api/v1/favourites
// @access    user
exports.getFav = async (req, res, next) => {
  try {
    const result = await User.findById(req.user._id)
      .select('favourite')
      .populate({
        path: 'favourite',
        model: 'favourite',
        populate: {
          path: 'prodId',
          model: 'product',
        },
      });

    res.json(result);
  } catch (error) {
    next(error);
  }
};
