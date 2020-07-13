// @desc      create sales banner
// @route     POST /api/v1/sales-banner

const SalesBanner = require('../models/SalesBanner');

// @access    admin
exports.createBanner = async (req, res, next) => {
  try {
    const sales = new SalesBanner(req.body);
    await sales.save();
    res.json([{ success: 'success', sales, msg: 'Banner added succefully' }]);
  } catch (err) {
    next(err);
  }
};

// @desc      Get sales banner
// @route     GET /api/v1/sales-banner
// @access    public
exports.getBanners = async (req, res, next) => {
  try {
    const sales = await SalesBanner.find();

    res.json(sales);
  } catch (err) {
    next(err);
  }
};

// @desc      Remove sales banner
// @route     REMOVE /api/v1/sales-banner/:id
// @access    admin
exports.removeBanner = async (req, res, next) => {
  try {
    await SalesBanner.findByIdAndDelete(req.params.id);

    res.json([{ success: 'success', msg: 'Banner deleted succefully' }]);
  } catch (err) {
    next(err);
  }
};
