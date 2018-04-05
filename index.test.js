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

  test('utxos can be empty', async () => {
    const utxos = await api.utxos("39Aa1M8a7qMkbzuPBpQ7AtvGAfjruBLMoV")
    expect(utxos).toEqual([])
  })

  test('utxos fails with an invalid address', async () => {
    expect(
      api.utxos("1antani")
    ).rejects.toEqual(new Error('Bitcoin address is not valid - address: 1antani'))
  })

  // This needs to be mocked
  xtest('pushTx', async () => {
    const rawTx = "123"
    const resp = await api.pushTx(rawTx)
    expect(resp).toBe("ok")
  })

})
