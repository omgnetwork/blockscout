
# blockscout/start.sh
# export HOME=/Users/sahil
# export ETHEREUM_JSONRPC_HTTP_URL=http://localhost:8545
# export ETHEREUM_JSONRPC_VARIANT=geth
# export COIN=ETH
# export DATABASE_URL=postgresql://postgres:password@localhost:5432/postgres

export COIN=ETH
export NETWORK=Boba
export SUBNETWORK=Rinkeby
export DATABASE_URL=postgresql://postgres:postgres@127.0.0.1:5432/explorer_dev
export MIX_ENV=dev
export ETHEREUM_JSONRPC_VARIANT=geth
export LOGO=/images/boba_logo.svg
export SUPPORTED_CHAINS='[{"title":"Boba Mainnet","url":"https://blockexplorer.boba.network","hide_in_dropdown?": false},{"title":"Boba Rinkeby","url":"https://blockexplorer.rinkeby.boba.network","test_net?":true},{"title":"Boba Rinkeby Integration","url":"https://blockexplorer.rinkeby-integration.boba.network","test_net?":true,"hide_in_dropdown?": true}]'
export ETHEREUM_JSONRPC_HTTP_URL=http://localhost:8545
# export ETHEREUM_JSONRPC_WS_URL=ws://localhost:8545
export ETHEREUM_JSONRPC_WS_URL=ws://mainnet.infura.io/8lTvJTKmHPCHazkneJsY/ws
export BLOCKSCOUT_VERSION=1.0.0