const mongoose = require('mongoose');
const OrderSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'user' },
  payment: {
    status: { type: String },
    method: String,
  },
  selectedSize: [{ type: String }],
  mobile: Number,
  items: [
    {
      title: { type: String, unique: true },
      description: { type: String },
      size: [{ type: String }],
      price: { type: Number },
      color: [{ type: String }],

      category: {
        main: { type: String },
        sub: [{ type: String }],
      },
      images: [{ type: String }],
      discount: { type: Number },
      inOffer: { type: Boolean, default: false },
    },
  ],
  note: String,
  status: String,
  estDelivery: Date,
  address: {
    name: { type: String },
    house: { type: String },
    location: { type: String },
    street: { type: String },
    pin: { type: Number },
    city: { type: String },
    state: { type: String },
  },
  orderedDate: Date,
  deliveryDate: Date,
  price: {
    productTotal: Number,
    discountPrice: Number,
    totalAfterDiscount: Number,
    tax: Number,
    shippingCharges: Number,
    totalAmount: Number,
  },
});

module.exports = mongoose.model('order', OrderSchema);

// {
//   "payment": {
//       "status": "done",
//       "method": "card"
//   },
//   "items": [
//       {
//           "title": "",
//           "description": "",
//           "size": [],
//           "price": "",
//           "color": [],
//           "category": {
//               "main": "",
//               "sub": []
//           },
//           "images": [],
//           "discount": "",
//           "inOffer": ""
//       }
//   ],
//   "note": "",
//   "status": "",
//   "estDelivery": "",
//   "address": {
//       "name": "",
//       "house": "",
//       "location": "",
//       "street": "",
//       "pin": "",
//       "city": "",
//       "state": ""
//   },
//   "orderedDate": "",
//   "deliveryDate": "",
//   "price": {
//       "productTotal": "",
//       "discountPrice": "",
//       "totalAfterDiscount": "",
//       "tax": "",
//       "shippingCharges": "",
//       "totalAmount": ""
//   }
// }
