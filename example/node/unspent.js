const utxos = require('blockchain-api-basic').utxos

const address = "197GxXSqqSAkhLXyy9XrtEySvssuDcQGMY"

;(async () => {
  const outputs = await utxos(address)
  console.log("UTXOs:", outputs)
})()
