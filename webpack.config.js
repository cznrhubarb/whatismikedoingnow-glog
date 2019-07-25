const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const fs = require('fs');
const isDevelopment = process.env.NODE_ENV === 'development';

module.exports = (env, options) => ({
  optimization: {
    minimizer: [
      new UglifyJsPlugin({ cache: true, parallel: true, sourceMap: false }),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
  entry: {
    './assets/js/app.js': glob.sync('./vendor/**/*.js').concat(['./assets/js/app.js'])
  },
  output: {
    filename: 'app.js',
    path: path.resolve(__dirname, 'priv/static/js')
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          // This is what I expected the default behavior to be, but somewhere in the process
          //  of putting this up in source control and pulling it down on a different machine
          //  borked it. This seems to work though.
          options: { 
            ...JSON.parse(fs.readFileSync(path.resolve(__dirname, '.babelrc'))) 
          }
        }
      },
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader']
      },
      {
        test: /\.module\.s(a|c)ss$/,
        loader: [
          isDevelopment ? 'style-loader' : MiniCssExtractPlugin,
          {
            loader: 'css-loader',
            options: {
              modules: true,
              localIdentName: '[name]__[local]__[hash:base64:5]',
              camelCase: true,
              sourceMap: isDevelopment
            }
          },
          {
            loader: 'sass-loader',
            options: {
              sourceMap: isDevelopment
            }
          }
        ]
      },
      {
        test: /\.s(a|c)ss$/,
        exclude: /\.module.(s(a|c)ss)$/,
        loader: [
          isDevelopment ? 'style-loader' : MiniCssExtractPlugin,
          'css-loader',
          {
            loader: 'sass-loader',
            options: {
              sourceMap: isDevelopment
            }
          }
        ]
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({ 
      filename: isDevelopment ? '[name].css' : '[name].[hash].css',
      chunkFilename: isDevelopment ? '[id].css' : '[id].[hash].css'
     }),
    new CopyWebpackPlugin([{ from: 'assets/static/', to: '../' }])
  ],
  resolve: {
    extensions: ['.js', '.jsx', '.json', '.scss']
  },
  devtool: 'eval-source-map'
});
