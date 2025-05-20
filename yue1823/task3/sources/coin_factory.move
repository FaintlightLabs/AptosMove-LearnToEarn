module coin_factory::create_coin {

    use std::option::none;
    use std::signer::address_of;
    use std::string::utf8;
    use aptos_framework::fungible_asset;
    use aptos_framework::fungible_asset::{Metadata, MintRef, BurnRef, TransferRef, generate_mint_ref, generate_burn_ref};
    use aptos_framework::object::{Object, create_named_object, object_from_constructor_ref};
    use aptos_framework::primary_fungible_store;
    use coin_factory::package_manager::{get_signer, ensure_admin, get_resources_account_addrress};
    #[test_only]
    use aptos_std::debug;
    #[test_only]
    use coin_factory::package_manager::call_init_module;

    const COIN_SEED :vector<u8> = b"hello";
    const NAME :vector <u8> = b"Coin_yue1823" ;

    ///not admin
    const E_not_admin:u64 =1;
    ///transaction -> 0x6577ca10c4bd9913ee172fac65f6ccccf8a204897ce233c2adcfbcbd68206858
    struct COIN_CONTROL has key,store{
        obj:Object<Metadata>,
        mint:MintRef,
        burn:BurnRef,
        tran:TransferRef,
    }
    public entry fun mint(caller:&signer,mint_amount:u64) acquires COIN_CONTROL {
        ensure_admin(address_of(caller));
        let borrow = borrow_global<COIN_CONTROL>(get_resources_account_addrress());
        let fa = fungible_asset::mint(&borrow.mint,mint_amount);
        primary_fungible_store::deposit(address_of(caller),fa);
    }

    fun init_module(_caller:&signer){
        let coin_factory_signer = &get_signer();
        let conf =& create_named_object(coin_factory_signer,COIN_SEED);
        primary_fungible_store::create_primary_store_enabled_fungible_asset(conf,none<u128>(),utf8(NAME),utf8(b"Hello"),8,utf8(b"Hello"),utf8(b"Hello"));
        move_to(coin_factory_signer,COIN_CONTROL{
            obj:object_from_constructor_ref<Metadata>(conf),
            mint:generate_mint_ref(conf),
            burn:generate_burn_ref(conf),
            tran:fungible_asset::generate_transfer_ref(conf)
        });
    }

    #[view]
    public fun get_token_metadata():Object<Metadata> acquires COIN_CONTROL {
        let borrow = borrow_global<COIN_CONTROL>(get_resources_account_addrress());
        borrow.obj
    }

    #[test(caller=@coin_factory)]
    fun test(caller:&signer) acquires COIN_CONTROL {
        call_init_module(caller);
        init_module(caller);
        debug::print(&utf8(b"Token balance "));
        debug::print(&primary_fungible_store::balance(address_of(caller),get_token_metadata()));
        mint(caller,100000000000);
        debug::print(&utf8(b"Token balance "));
        debug::print(&primary_fungible_store::balance(address_of(caller),get_token_metadata()));
    }



}
