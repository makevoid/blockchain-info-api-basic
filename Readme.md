## Source Code

It's all about this file:

https://github.com/makevoid/blockchain-api/blob/master/index.coffee

### 3 methods

- **balance(address, callback)**

(retreives the balance of a given address)

- **unspent(address, callback)**

(retrieves all the unspent output for a given address)

- **pushTx(tx_hash, callback)**

(pushesh the transaction to the blockchain)

( todo export it from https://github.com/makevoid/simplest_wallet_bootstrap and improve it by using multiple broadcasting channels, blockr.io, blockcypher and whatnot )


### Libraries used and useful links

##### Bitcore
http://bitcore.io

##### Get-Next
!npm get-next

#### Packaging

Browserify and Coffeeify


Browserify Website:
http://browserify.org

Npm module page:
https://www.npmjs.com/package/browserify

Plugins/Forks:
https://www.npmjs.com/search?q=browserify

#### Running it

Download the project, cd into the dir, launch a web server like:

```sh
python -m SimpleHTTPServer 3000
```

open your browser ( http://localhost:3000 )




#### Required libraries to develop on it:

```sh
npm install browserify coffeeify -g
npm install

```

### Main task to bundle the coffee


```sh
browserify -t coffeeify index.js -o bundle.js
```

or

```sh
sh bundle.sh
```


### TODO

make sure inline is a good option for coffeeify - https://github.com/jnordberg/coffeeify/blob/master/index.js#L51
