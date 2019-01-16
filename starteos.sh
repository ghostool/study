cleos wallet unlock
PW5KLSSLTevWsUtB2XMDMzfYnRvj8qSAs9EHYURHJCpFYkPkLkLvG

nodeos -e -p eosio \
--plugin eosio::producer_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::http_plugin \
--plugin eosio::history_plugin \
--plugin eosio::history_api_plugin \
--data-dir CONTRACTS_DIR/eosio/data \
--config-dir CONTRACTS_DIR/eosio/config \
--access-control-allow-origin='*' \
--contracts-console \
--http-validate-host=false \
--verbose-http-errors \
--filter-on='*' >> nodeos.log 2>&1 &

cleos create account eosio eosio.token EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cleos create account eosio alice EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cleos create account eosio bob EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cleos create account eosio eosbetcasino EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cleos set account permission alice active --add-code
cleos set account permission bob active --add-code
cleos set account permission eosbetcasino active --add-code
cleos set contract eosio.token ./eosio.token --abi eosio.token.abi -p eosio.token@active

cleos push action eosio.token create '[ "eosio", "1000000000.0000 EOS"]' -p eosio.token@active
cleos push action eosio.token issue '[ "alice", "1000.0000 EOS", "memo" ]' -p eosio@active
cleos push action eosio.token issue '[ "bob", "1000.0000 EOS", "memo" ]' -p eosio@active
cleos push action eosio.token issue '[ "eosbetcasino", "1000.0000 EOS", "memo" ]' -p eosio@active
