module hello_world::faucet {
    use std::signer;
    use std::string;
    use aptos_framework::coin::{Self, MintCapability, BurnCapability, FreezeCapability, register, mint, deposit};

    struct Coin_baicaiyihao {}
    struct Coin_baicaiyihao_cap has key {
        mint_cap: MintCapability<Coin_baicaiyihao>,
        burn_cap: BurnCapability<Coin_baicaiyihao>,
        freeze_cap: FreezeCapability<Coin_baicaiyihao>,
    }
    
    // 0x27c1217ed9a57af680c4b0e821e4309b90c12c11d1848564dc68dda32ce5630c
    // https://explorer.aptoslabs.com/txn/0xb56f9e1bbcfb707a47ccaf3ac1ede0223d00c34e31d534da25d01fc28240623f?network=testnet
    fun init_module(account: &signer) {
        let (burn_cap, freeze_cap, mint_cap) = coin::initialize<Coin_baicaiyihao>(
            account,
            string::utf8(b"Coin_baicaiyihao"),
            string::utf8(b"bcyh"),
            8,
            true,
        );
        
        move_to(account, Coin_baicaiyihao_cap {
            mint_cap: mint_cap,
            burn_cap: burn_cap,
            freeze_cap: freeze_cap,
        });
    }

    public entry fun faucet(account: &signer) acquires Coin_baicaiyihao_cap {
        let cap = borrow_global<Coin_baicaiyihao_cap>(@hello_world);

        if (!coin::is_account_registered<Coin_baicaiyihao>(signer::address_of(account))) {
            register<Coin_baicaiyihao>(account);
        };
        
        let coin = mint(100_000_000, &cap.mint_cap);
        
        deposit(signer::address_of(account), coin);

    }
}