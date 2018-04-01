# you need to run this command first:
#
#     npm install
#
# then you can use:
#
#     sh build.sh

npx browserify index.js --standalone BchainApi -o bundle.js
