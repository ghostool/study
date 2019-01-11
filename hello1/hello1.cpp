#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/types.h>
#include "eosio.token.hpp"
#include <eosiolib/print.hpp>

using namespace eosio;

class hello1 : public contract {
  public:
      using contract::contract;

      [[eosio::action]]
      void dream( name who, asset value, std::string memo ) {
         //require_auth( _self );
         print("1st");
         auto balance = eosio::token::get_balance("eosio.token"_n, _self, symbol("EOS",4).code());
         action(
            permission_level{get_self(),"active"_n},
            "eosio.token"_n, 
            "transfer"_n,
            std::make_tuple(_self, who, value, memo)
         ).send();
         action(
            permission_level{get_self(),"active"_n},
             get_self(), 
             "reality"_n,
            std::make_tuple(balance)
         ).send();
      }

      [[eosio::action]]
      void reality( asset data ) {
         //require_auth( _self );
         auto newBalance = eosio::token::get_balance("eosio.token"_n, _self, symbol("EOS",4).code());
         print(_self,"have ",newBalance);
         eosio_assert( newBalance.amount > data.amount,"bad");
      }
};

EOSIO_DISPATCH( hello1, (dream)(reality))
