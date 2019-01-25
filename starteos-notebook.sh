cleos wallet unlock
PW5Ka31xY1nG97A83pvzCUQ98oYqNDvwaXSnjNp2xTFNE91QgWHGA

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

cleos create account eosio eosio.token EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V
cleos create account eosio alice EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V
cleos create account eosio bob EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V
cleos create account eosio eosbetcasino EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V
cleos set account permission alice active --add-code
cleos set account permission bob active --add-code
cleos set account permission eosbetcasino active --add-code
cleos set contract eosio.token ./study1/eosio.token --abi eosio.token.abi -p eosio.token@active


cleos push action eosio.token create '[ "eosio", "1000000000.0000 EOS"]' -p eosio.token@active
cleos push action eosio.token issue '[ "alice", "1000.0000 EOS", "memo" ]' -p eosio@active
cleos push action eosio.token issue '[ "bob", "2000.0000 EOS", "memo" ]' -p eosio@active
cleos push action eosio.token issue '[ "eosbetcasino", "1000.0000 EOS", "memo" ]' -p eosio@active

cleos set contract eosbetcasino ./study1/EOSBetDice
cleos push action eosbetcasino initcontract '["EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V"]' -p eosbetcasino@active
cleos transfer alice eosbetcasino "1 EOS" "96"
cleos get table eosbetcasino eosbetcasino activebets
cleos push action eosbetcasino resolvebet '["11032539410485486696","SIG_K1_K1FWRDNsuHW54XfQ5vtbyFT4F55FSVdXEjRAYPJqGzKrxWMMWqyvNMjL4o3yHXebFMMzj34nNNPEQ1Ety7rmk2bfVBRjpW"]' -p alice@active
cleos get

