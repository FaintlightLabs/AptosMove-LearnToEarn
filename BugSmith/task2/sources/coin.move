module 0xe9b69b57cc7b1d2a9601f873c48b1297d863867db42d846fa6f9d6f754d966c7::coin_bugsmith {
    use std::signer;
    use aptos_framework::coin;
    use aptos_framework::string;

    struct CoinBugSmith has store {}

    struct MintCapStore has key {
        mint_cap: coin::MintCapability<CoinBugSmith>,
        burn_cap: coin::BurnCapability<CoinBugSmith>,
    }

    fun init_module(account: &signer) {
        let (burn_cap, freeze_cap, mint_cap) = coin::initialize<CoinBugSmith>(
            account,
            string::utf8(b"Coin_BugSmith"),
            string::utf8(b"BSCOIN"),
            8,
            true
        );

        move_to<MintCapStore>(account, MintCapStore { mint_cap, burn_cap });
        coin::destroy_freeze_cap(freeze_cap);
    }
    // txn: https://explorer.aptoslabs.com/txn/0x2d23c25eaa9f322113e7b071c72a05fd98905cd6b5af830ba189a4f46e6a0b9c?network=testnet
    public entry fun faucet(account: &signer) acquires MintCapStore {
        let user_addr = signer::address_of(account);

        if (!coin::is_account_registered<CoinBugSmith>(user_addr)) {
            coin::register<CoinBugSmith>(account);
        };

        let deployer_addr = @0xe9b69b57cc7b1d2a9601f873c48b1297d863867db42d846fa6f9d6f754d966c7;
        

        let mint_cap_store = borrow_global_mut<MintCapStore>(deployer_addr);
        let cap: &mut coin::MintCapability<CoinBugSmith> = &mut mint_cap_store.mint_cap;
        
        let minted_coins = coin::mint(100000000000, cap);
        
        coin::deposit<CoinBugSmith>(user_addr, minted_coins);
    }

}
