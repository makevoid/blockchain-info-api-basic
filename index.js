require('es6-promise').polyfill()
require('isomorphic-fetch')
require('isomorphic-form-data')


// Blockchain.info simple API for clientside bitcoin apps/wallets
//
// - unspent (gets the list of the unspent outputs, utxo)
// - balance (gets the address balance)
// - pushtx  (pushes the transaction to other nodes)


const get = async (url) => {
  let data = await fetch(url)
  data = await data.json()
  return data
}

const getNum = async (url) => {
  let data = await fetch(url)
  data = await data.text()
  return Number(data)
}

const post = async (url, params) => {
  const attribs = {
    method: "POST",
    body:   new FormData(params),
  }
  let data = await fetch(url, attribs)
  data = await data.text()
  return data
}

// get UTXOs

const unspentTxOutputs = async (address) => {
  const url  = _unspentUrl(address)
  const data = await get(url)
  return data.unspent_outputs
}

const _unspentUrl = (address) => {
  return `${_blockchainHost()}/unspent?active=${address}&format=json&cors=true`
}


// get address Balance

const balance = async (address) => {
  const url = _balanceUrl(address)
  const data = await getNum(url)
  return data
}

const _balanceUrl = (address) => {
  return `${_blockchainHost()}/q/addressbalance/${address}?format=json`
}

// API host
const _blockchainHost = () => {
  return 'https://blockchain.info'
}

// push raw transaction
const pushTx = async (rawTX) => {
  const url = _pushTx()
  const data = { tx: rawTX }
  const resp = await post(url, data)
  return resp
}

const _pushTx = () => {
  return `${_blockchainHost()}/pushtx`
}

module.exports = {
  balance:  balance,
  utxos:    unspentTxOutputs,
  pushTx:   pushTx,
}
