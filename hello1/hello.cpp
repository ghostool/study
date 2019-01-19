#include <utility>
#include <vector>
#include <string>
#include <eosiolib/eosio.hpp>
#include <eosiolib/time.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/contract.hpp>
#include <eosiolib/types.hpp>
#include <eosiolib/transaction.hpp>
#include <eosiolib/crypto.h>
#include <eosiolib/print.h>
#include <boost/algorithm/string.hpp>
#include "eosio.token.hpp"

using namespace eosio;

class hello : public eosio::contract {
  public:
      using contract::contract;

      [[eosio::action]]
      void dream( account_name who, eosio::asset value, std::string memo ) {
         require_auth( _self );
         auto eos_token = eosio::token(N(eosio.token));
         auto balance = eos_token.get_balance(_self, symbol_type(S(4,EOS)).name);
         action(
            permission_level{ _self, N(active) },
            N(eosio.token), N(transfer),
            std::make_tuple(_self, who, value, memo)
         ).send();
<<<<<<< HEAD
         /*
         action(
=======
        /* 
        action(
>>>>>>> 784560b2e738053a79027d7d4d02090b71706b5b
            permission_level{ _self, N(active) },
            _self, N(reality),
            std::make_tuple(balance)
         ).send();
         */
      }

      [[eosio::action]]
      void reality( asset data ) {
         require_auth( _self );
         auto eos_token = eosio::token(N(eosio.token));
         auto newBalance = eos_token.get_balance(_self, symbol_type(S(4,EOS)).name);
         eosio_assert( newBalance.amount > data.amount,"bad");
      }
};

EOSIO_DISPATCH( hello, (dream)(reality))
