module DrYellow_coin::coin {

    use std::signer::{address_of};
    use std::string::utf8;
    use aptos_framework::coin;
    use aptos_framework::coin::{initialize, MintCapability, destroy_freeze_cap, destroy_burn_cap};


    struct DrYellow has key, store {}

    struct MY_Coin has key, store {
        mint: MintCapability<DrYellow>,
    }

    const ASSET_SYMBOL: vector<u8> = b"DRYELLOW";

    const DECIMALS: u8 = 8;
    const MINT_NUM:u64=10000000000000;

    //  https://explorer.aptoslabs.com/txn/0xa2b9e455537aacee6841fc8bad23786c5d8a6906ddcf56f6ab36f667507d2a02?network=testnet
    // 0x078963b90d1dcf7078c899f8ee3397f61eb106a4e8bc62049e600cda57770bf0
    fun init_module(admin: &signer) {
        let (_burn, _freeze, mint) =
            initialize<DrYellow>(admin,
                utf8(b"Coin_DrYellow"),
                utf8(b"DY"), DECIMALS,
                false);
        move_to(admin, MY_Coin { mint });
        destroy_freeze_cap(_freeze);
        destroy_burn_cap(_burn);
    }

    public entry fun faucet(user: &signer) acquires MY_Coin {
        if (!coin::is_account_registered<DrYellow>(address_of(user))) {
            coin::register<DrYellow>(user);
        };
        let borrow = borrow_global<MY_Coin>(@DrYellow_coin);
        coin::deposit(address_of(user), coin::mint(MINT_NUM, &borrow.mint));
    }
}
