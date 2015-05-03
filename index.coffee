# To require this library in your js projects:
#
# BchainApi = require 'blockchain-api-basic'

# A good library to start a wallet with:
#
# bitcore   = require 'bitcore'

# libraries used (dependencies)
#
get       = require 'get-next'


# Blockchain API class
#   (the only external api used, can be easily swapped with blockr.io or other block explorers)
#
# - unspent (gets the list of the unspent outputs, utxo)
# - balance (gets the address balance)
# - pushtx  (pushes the transaction to other nodes)

# class BchainApi # TODO: coffee class + @methods (class methods)ti

BchainApi =

  unspent: (address, handler) ->
    @_getUnspentJson address, handler
    true

  _unspentUrl: (address) ->
    "/unspent?active=#{address}&format=json&cors=true"

  _getUnspentJson: (address, handler) ->
    get(@_unspentOpts(address)).next ((data, res) =>
      handler JSON.parse(data)
    )

  _unspentOpts: (address) ->
    # TODO: refactor all Opts with merge/extend
    {
      host: @_blockchainHost()
      path: @_unspentUrl(address)
      type: 'all'
      port: 443
      withCredentials: false
    }

  balance: (address, handler) ->
    @_getBalanceJson address, handler
    true

  _getBalanceJson: (address, handler) ->
    get(@_balanceOpts(address)).next((data, res) =>
      data = JSON.parse data
      handler data
    )

  _balanceOpts: (address) ->
    {
      host: @_blockchainHost()
      path: @_balanceUrl(address)
      type: 'all'
      port: 443
      withCredentials: false
    }

  _balanceUrl: (address) ->
    "/q/addressbalance/#{address}?format=json"

  # common host
  _blockchainHost: ->
    'blockchain.info'

  # pushtx
  pushtx: (transaction) ->
    tx_hash = transaction.serialize()
    # TODO: implement pushtx


  # pushTx: function(tx_hash, handler) {
  #   this._postTxJson(
  #     tx_hash,
  #     handler
  #   )
  # },
  #
  # _postTxJson: function(tx_hash, handle) {
  #   console.log("pushing transaction:", tx_hash)
  #   var consl = console
  #   // var host  = "localhost:3001" // TODO: prod version needs to go on wallet_cors.mkvd.net
  #   // var url   = 'http://' + host + this._pushTxUrl()
  #
  #   var url   = 'https://' + this._blockchainHost() + this._pushTxUrl()
  #
  #
  #   $.post(url, { tx: tx_hash }, function(data) {
  #     console.log(data.responseText)
  #   }).fail(function(jqxhr, textStatus, error) {
  #     console.error(
  #       jqxhr.responseText, error
  #     )
  #   })
  #
  #   // return;
  #   //
  #   // // { tx: tx_hash },
  #   // // var url = "https://btc.blockr.io/api/v1/tx/push"
  #   // // { hex: tx_hash },
  #   // post(
  #   //   url,
  #   //   { tx: tx_hash },
  #   //   function(err, data){   //callback
  #   //     if (err) {
  #   //       console.error(err)
  #   //     }
  #   //     handle(data);
  #   //   }
  #   // )
  # },
  #
  # _pushTxUrl: function(address) {
  #   // return "/address/"+address+"?format=json"
  #   return "/pushtx?cors=true" // format=json&
  # },
  #
  # // https://blockchain.info/pushtx
  # // { tx: "{}" }


# # this code gets the balance of an address and logs it to the console
#
# BchainApi.balance("197GxXSqqSAkhLXyy9XrtEySvssuDcQGMY", (bal) ->
#   console.log "balance:", bal
# )

# this code gets the unspent outputs of the given address
#
# BchainApi.unspent("197GxXSqqSAkhLXyy9XrtEySvssuDcQGMY", (utxos) ->
#  console.log("UTXOs:", utxos) # => Object { unspent_outputs: Array[1] }
# )


module.exports = BchainApi

# window.BchainApi = BchainApi
# this exports the lib(s) as global objects, it can be useful to be able to call them in your browser
