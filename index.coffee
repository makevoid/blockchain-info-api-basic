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

  _blockchainHost: ->
    'blockchain.info'

  # pushtx
  pushtx: (transaction) ->
    tx_hash = transaction.serialize()
    # TODO: implement pushtx


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


window.BchainApi = BchainApi
window.bitcore   = bitcore
# this exports the libs as global objects, it can be useful to be able to call them in your browser
