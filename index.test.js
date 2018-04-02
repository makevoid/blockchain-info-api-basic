const api = require('.')

const address  = "12ZA9QSu4GkADVQ2xvDWfT72rJq6ujKBHT"
const oneMilli = 100000 // one millibit (mBTC)

describe('blockchain-info-api', () => {

  test('balance', async () => {
    const balance = await api.balance(address)
    expect(balance).toBe(oneMilli)
  })

  test('utxos', async () => {
    const utxos = await api.utxos(address)
    const utxo  = utxos[0]
    const txHash = "790a44359cbb919fda0c7d8ed585228f5415042735878340f18ec49a8d128e61"
    expect(txHash).toBe(txHash)
  })

  // This needs to be mocked
  xtest('pushTx', async () => {
    const rawTx = "123"
    const resp = await api.pushTx(rawTx)
    expect(resp).toBe("ok")
  })

})
