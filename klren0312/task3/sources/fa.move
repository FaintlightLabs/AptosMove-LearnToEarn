// txn: 0x238248f7797e26282658b063bda98b0d35a5e64e9cdf8f6c0e3c4f528909304f
// link:  https://explorer.aptoslabs.com/txn/0x238248f7797e26282658b063bda98b0d35a5e64e9cdf8f6c0e3c4f528909304f?network=testnet
module MyAddr::fa {
    use std::error;
    use std::option;
    use std::signer;
    use std::string::utf8;
    use aptos_framework::fungible_asset;
    use aptos_framework::fungible_asset::{MintRef, TransferRef, BurnRef, Metadata};
    use aptos_framework::object::{Self, Object};
    use aptos_framework::primary_fungible_store;

    const ENOT_OWNER: u64 = 1;

    const ASSET_SYMBOL: vector<u8> = b"BLS";

    struct FungibleAssetAdmin has key {
        mint_ref: MintRef,
        transfer_ref: TransferRef,
        burn_ref: BurnRef,
    }


    fun init_module(admin: &signer) {
        let constructor_ref = &object::create_named_object(admin, ASSET_SYMBOL);

        primary_fungible_store::create_primary_store_enabled_fungible_asset(
            constructor_ref,
            option::none(),
            utf8(b"BLS_klren0312"),
            utf8(ASSET_SYMBOL),
            8,
            utf8(b"https://v2.tauri.org.cn/_astro/logo.DCjQDXhk.svg"),
            utf8(b"https://github.com/FaintlightLabs/AptosMove-LearnToEarn")
        );

        let mint_ref = fungible_asset::generate_mint_ref(constructor_ref);
        let burn_ref = fungible_asset::generate_burn_ref(constructor_ref);
        let transfer_ref = fungible_asset::generate_transfer_ref(constructor_ref);
        let metadata_object_signer = object::generate_signer(constructor_ref);

        move_to(
            &metadata_object_signer,
            FungibleAssetAdmin {
                mint_ref,
                burn_ref,
                transfer_ref,
            }
        )

    }

    public fun get_metadata(): Object<Metadata> {
        let asset_address = object::create_object_address(&@MyAddr, ASSET_SYMBOL);
        object::address_to_object<Metadata>(asset_address)
    }

    // txn: 0x1017d9dbe91d7bc67dd904c0a89b5875c82b325aed1f2aaa001330db2ed445a1
    // link: https://explorer.aptoslabs.com/txn/0x1017d9dbe91d7bc67dd904c0a89b5875c82b325aed1f2aaa001330db2ed445a1?network=testnet
    public entry fun mint(admin: &signer, to: address, amount: u64) acquires FungibleAssetAdmin {
        let asset = get_metadata();
        assert!(object::is_owner(asset, signer::address_of(admin)), error::permission_denied(ENOT_OWNER));
        let managed_fungible_asset =  borrow_global<FungibleAssetAdmin>(object::object_address(&asset));
        let to_wallet = primary_fungible_store::ensure_primary_store_exists(to, asset);
        let fa = fungible_asset::mint(&managed_fungible_asset.mint_ref, amount);
        fungible_asset::deposit_with_ref(&managed_fungible_asset.transfer_ref, to_wallet, fa);
    }
}