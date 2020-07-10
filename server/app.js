const express = require('express');
const colors = require('colors');

const connectDB = require('./config/mongoDB');

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

app.use((req, res) => {
  res.send('<h2>Welcome to the Rest api server</h2>');
});
console.clear();
connectDB()
  .then(() => {
    app.listen(port || 8000, () =>
      console.log(`server listening on ${port}`.info)
    );
  })
  .catch((err) => console.log(`Error in starting server${err}`.error));
