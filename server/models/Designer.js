const mongoose = require('mongoose');
const DesignerSchema = new mongoose.Schema({
  name: { type: String, required: true, default: 'Anitha Kommareddy' },
  email: {
    type: String,
    required: true,
    unique: true,
    default: 'anitha@gmail.com',
  },
  password: { type: String, required: true, default: '123456' },
  mobile: { type: Number, required: true, unique: true, default: '123456789' },
  image: {
    type: String,
    default:
      'https://cdn.clipart.email/1c0dc2d792b273f08d5d43d370a8e347_batman-head-sketch-by-mike-zeck-in-malvin-vs-the-batman-_863-1224.jpeg',
  },
  bio: {
    type: String,
    default:
      'This is awesome This is awesome This is awesome This is awesome This is awesome This is awesome This is awesome ',
  },
  blogs: [
    {
      title: { type: String, unique: true },
      image: String,
      content: String,
      slug: String,
    },
  ],
});

module.exports = mongoose.model('designer', DesignerSchema);
