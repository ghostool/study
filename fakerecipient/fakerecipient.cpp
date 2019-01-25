#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/types.h>
#include <eosiolib/transaction.hpp>

using namespace eosio;

class fakerecipient : public contract {
  public:
      using contract::contract;
      void transfer( ) {
        require_recipient("eosbetcasino"_n);
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
EOSIO_ABI_EX( fakerecipient, 	(transfer))