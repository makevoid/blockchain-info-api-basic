Simple API around Blockchain.info to: **get address balance, get UTXOs, and push transactions.**

### Install

    npm i --save blockchain-info-api-basic

### Usage

Require the api:

```js
const bcApi   = require('blockchain-info-api-basic')
const balance = bcApi.balance
const utxos   = bcApi.utxos
const pushTx  = bcApi.pushTx
```

- **balance(address)**

Retreives the balance of a given address

```js
;(async () => {
  const bal = await balance(address)
  console.log("balance:", bal)
  // => balance: 9754600 (satoshis)
})()
```

- **utxos(address)**

Retrieves all the unspent transaction outputs for a given address:

```js
const outputs = await utxos(address)
console.log("UTXOs:", outputs)
// => UTXOs: [ { tx_hash: ... }, {...} ]
```

(note I'm omitting async from this example)

- **pushTx(tx_hash)**

```js
const rawTX = "...." // your raw tx - for example you can create a transaction by using bitcoinjslib or bitcore and then serialize the transaction to get the raw tx in hex format
const response = await pushtx(rawTX)
console.log("push tx response:", response)
```

---

Enjoy!

@makevoid
