unique = require('uniq')
# unique = require('./node_modules/uniq')

data = [1, 2, 2, 3, 4, 5, 5, 5, 6]

output = unique(data)

console.log(output)
document.querySelector("#output").innerHTML = output
