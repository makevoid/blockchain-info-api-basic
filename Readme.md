### Smallest setup for browserify (js frontend bundling) and coffeescript 
##### (.coffee files are compiled via coffeeify)

Browserify Website:
http://browserify.org

Npm module page:
https://www.npmjs.com/package/browserify

Plugins/Forks:
https://www.npmjs.com/search?q=browserify

#### Installation

```sh
npm install browserify -g
```

with coffeescript support:

```sh
npm install browserify coffeeify -g
```


#### Usage

```sh
browserify -t coffeeify index.js -o bundle.js
```

