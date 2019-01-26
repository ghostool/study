#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>

using namespace eosio;

class hello : public contract
{
    public:
      using contract::contract;

      [[eosio::action]] 
      void hi(name user) {
            require_auth(user);
            print("Hello, ", name{user});
      }
      [[eosio::action]] 
      void transfer()
      {
            print("Hello, transfered");
      }
};

#define EOSIO_ABI_EX( TYPE, MEMBERS ) \
extern "C" { \
   void apply( uint64_t receiver, uint64_t code, uint64_t action ) { \
      if( code == receiver || code == name("eosio.token").value){ \
         switch( action ) { \
            EOSIO_DISPATCH_HELPER( TYPE, MEMBERS ) \
         } \
      } \
   } \
}

EOSIO_ABI_EX(hello, (hi)(transfer))
