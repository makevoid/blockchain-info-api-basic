// Generated by CoffeeScript 1.9.2
(function() {
  var BchainApi, get;

  get = require('get-next');

  BchainApi = {
    unspent: function(address, handler) {
      this._getUnspentJson(address, handler);
      return true;
    },
    _unspentUrl: function(address) {
      return "/unspent?active=" + address + "&format=json&cors=true";
    },
    _getUnspentJson: function(address, handler) {
      return get(this._unspentOpts(address)).next(((function(_this) {
        return function(data, res) {
          return handler(JSON.parse(data));
        };
      })(this)));
    },
    _unspentOpts: function(address) {
      return {
        host: this._blockchainHost(),
        path: this._unspentUrl(address),
        type: 'all',
        port: 443,
        withCredentials: false
      };
    },
    balance: function(address, handler) {
      this._getBalanceJson(address, handler);
      return true;
    },
    _getBalanceJson: function(address, handler) {
      return get(this._balanceOpts(address)).next((function(_this) {
        return function(data, res) {
          data = JSON.parse(data);
          return handler(data);
        };
      })(this));
    },
    _balanceOpts: function(address) {
      return {
        host: this._blockchainHost(),
        path: this._balanceUrl(address),
        type: 'all',
        port: 443,
        withCredentials: false
      };
    },
    _balanceUrl: function(address) {
      return "/q/addressbalance/" + address + "?format=json";
    },
    _blockchainHost: function() {
      return 'blockchain.info';
    },
    pushtx: function(transaction) {
      var tx_hash;
      return tx_hash = transaction.serialize();
    }
  };

  module.exports = BchainApi;

}).call(this);
