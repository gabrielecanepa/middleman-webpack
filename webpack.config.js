const path = require('path');

module.exports = {
  mode: 'development',
  entry: {
    main: './source/javascripts/main.js'
  },
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  }
};
