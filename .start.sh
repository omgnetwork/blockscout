
# blockscout/start.sh
# export HOME=/Users/sahil
# export ETHEREUM_JSONRPC_HTTP_URL=http://localhost:8545
# export ETHEREUM_JSONRPC_VARIANT=geth
# export COIN=ETH
# export DATABASE_URL=postgresql://postgres:password@localhost:5432/postgres

export COIN=ETH
export NETWORK=Boba
export SUBNETWORK=Rinkeby
export DATABASE_URL=postgresql://postgres:postgres@localhost:5432/blockexplorer?ssl=false
export MIX_ENV=prod
export ETHEREUM_JSONRPC_VARIANT=geth
export LOGO=/images/boba_logo.svg
export SUPPORTED_CHAINS='[{"title":"Boba Mainnet","url":"https://blockexplorer.boba.network","hide_in_dropdown?": false},{"title":"Boba Rinkeby","url":"https://blockexplorer.rinkeby.boba.network","test_net?":true},{"title":"Boba Rinkeby Integration","url":"https://blockexplorer.rinkeby-integration.boba.network","test_net?":true,"hide_in_dropdown?": true}]'
export ETHEREUM_JSONRPC_HTTP_URL=http://localhost:8545
export ETHEREUM_L1_JSONRPC_HTTP_URL=https://rinkeby.infura.io/v3/KEY
export BLOCKSCOUT_VERSION=1.0.0