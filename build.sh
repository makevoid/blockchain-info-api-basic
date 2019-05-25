# you need to run this command first:
#
#     npm install
#
# then you can use:
#
#     ./build.sh

set -xe

npx browserify index.js --standalone BchainApi -o bundle.js
