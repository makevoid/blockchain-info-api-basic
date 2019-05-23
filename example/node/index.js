const { balance } = require('blockchain-api-basic')

const address = "197GxXSqqSAkhLXyy9XrtEySvssuDcQGMY"

;(async () => {
  const bal = await balance(address)
  console.log("balance:", bal)
})()
