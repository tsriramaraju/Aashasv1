const mongoose = require('mongoose');

const connectDB = async () => {
  const uri = process.env.MONGO_URI;
  try {
    await mongoose.connect(uri, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log(`Database connected...`.info);
  } catch (err) {
    console.log(`error in connection Database\n${err}`.error);
    process.exit(1);
  }
};

module.exports = connectDB;
