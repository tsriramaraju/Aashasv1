const express = require('express');
const colors = require('colors');

const connectDB = require('./config/mongoDB');

//Routes
const usersRoute = require('./Routes/api/v1/users');
const otpRoute = require('./Routes/api/v1/otp');
const productsRoute = require('./Routes/api/v1/products');
const customProductsRoute = require('./Routes/api/v1/customProducts');
const cartRoute = require('./Routes/api/v1/cart');
const favouritesRoute = require('./Routes/api/v1/favourites');
const bannerRoute = require('./Routes/api/v1/salesBanner');
const ordersRoute = require('./Routes/api/v1/orders');
const desingerRoute = require('./Routes/api/v1/designer');

//Middleware
const errorHandler = require('./middleware/errorHandling');
const unboundHandler = require('./middleware/404Handler');
colors.setTheme({
  silly: 'rainbow',
  input: 'grey',
  verbose: 'cyan',
  prompt: 'grey',
  info: 'green',
  data: 'grey',
  help: 'cyan',
  warn: 'yellow',
  debug: 'blue',
  error: 'red',
});

const app = express();

const port = process.env.PORT;

app.use(express.json());

//Routes
app.use('/api/v1/users', usersRoute);
app.use('/api/v1/otp', otpRoute);
app.use('/api/v1/products', productsRoute);
app.use('/api/v1/custom-products', customProductsRoute);
app.use('/api/v1/cart', cartRoute);
app.use('/api/v1/favourites', favouritesRoute);
app.use('/api/v1/sales-banner', bannerRoute);
app.use('/api/v1/orders', ordersRoute);
app.use('/api/v1/designer', desingerRoute);
app.use(unboundHandler);
app.use(errorHandler);

console.clear();
connectDB()
  .then(() => {
    app.listen(port || 8000, () =>
      console.log(`server listening on ${port}`.info)
    );
  })
  .catch((err) => console.log(`Error in starting server${err}`.error));
