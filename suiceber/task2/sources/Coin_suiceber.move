
module Coin_suiceber::CoinFaucet {
    use std::string;
    use std::signer;
    use aptos_framework::coin;

    struct Coin_suiceber has store {}

    struct Capabilities has key {
        mint_cap: coin::MintCapability<Coin_suiceber>,
    }
    // 0xc40073e6eac4067a42b82921b101acc3f8aa96db83170fcfa8fab122773d17cf
    // https://explorer.aptoslabs.com/txn/0xd53a7a09dd86b0618ab55f76a74d3cf1591fcd7281debb2568d37e7a4778a9c1?network=testnet

    fun init_module(deployer: &signer) {
        let (burn_cap, freeze_cap, mint_cap) = coin::initialize<Coin_suiceber>(
            deployer,
            string::utf8(b"Coin_suiceber"),
            string::utf8(b"CSC"),
            8,
            true
        );

        coin::destroy_burn_cap(burn_cap);
        coin::destroy_freeze_cap(freeze_cap);
        move_to(deployer, Capabilities { mint_cap });
    }

    public entry fun register(user: &signer) {
        coin::register<Coin_suiceber>(user);
    }

    public entry fun faucet(user: &signer) acquires Capabilities {
        let user_addr = signer::address_of(user);

        if (!coin::is_account_registered<Coin_suiceber>(user_addr)) {
            register(user);
        };

        let capabilities = borrow_global<Capabilities>(@Coin_suiceber);
        let coins = coin::mint<Coin_suiceber>(100_000_000, &capabilities.mint_cap);
        coin::deposit<Coin_suiceber>(user_addr, coins);
    }
}
