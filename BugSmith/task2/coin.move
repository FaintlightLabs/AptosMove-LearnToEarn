
module coin_bugsmith::coin_bugsmith {
    use std::signer;
    use aptos_framework::coin;
    use aptos_framework::account;

    struct CoinBugSmith has store {}

    struct MintCapStore has key {
        mint_cap: coin::MintCapability<CoinBugSmith>
    }

    public entry fun init_module(account: &signer) {
        let (burn_cap, mint_cap) = coin::initialize(
            account,
            string::utf8(b"CoinBugSmith"),
            string::utf8(b"CINKX"),
            8,
            true
        );

        move_to(account, MintCapStore { mint_cap });
        coin::destroy_burn_cap(burn_cap);
    }
    //txn:
    public entry fun faucet(account: &signer) acquires MintCapStore {
        let user_addr = signer::address_of(account);
        if (!coin::is_account_registered<CoinBugSmith>(user_addr)) {
            coin::register(account);
        }

        let deployer_addr = @coin_bugsmith; 
        let mint_cap = &borrow_global<MintCapStore>(deployer_addr).mint_cap;
        let coins = coin::mint(10000000000, mint_cap); 
        coin::deposit(user_addr, coins);
    }
}