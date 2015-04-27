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
