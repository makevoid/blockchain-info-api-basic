const getBalance = require('blockchain-api-basic').balance

const address = "197GxXSqqSAkhLXyy9XrtEySvssuDcQGMY"

;(async () => {
  const balance = await getBalance(address)
  console.log("balance:", balance)
})()
