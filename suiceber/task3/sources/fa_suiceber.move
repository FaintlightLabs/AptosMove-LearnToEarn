module suiceber::fa_suiceber {
    use std::string;
    use std::signer;
    use aptos_framework::coin;

    struct FA has key {}

    struct MintCapStore has key {
        mint_cap: coin::MintCapability<FA>,
    }
    // 0xc40073e6eac4067a42b82921b101acc3f8aa96db83170fcfa8fab122773d17cf
    // https://explorer.aptoslabs.com/txn/0xc4fbf3eeda2ade78518e2ac1a7c2294ec13985239b00980f62fe62c721f18d3d?network=testnet
    fun init_module(owner: &signer) {
        let name = string::utf8(b"FA_suiceber");
        let symbol = string::utf8(b"FCB");

        let (burn_cap, freeze_cap, mint_cap) = coin::initialize<FA>(
            owner,
            name,
            symbol,
            8,
            false
        );

        move_to<MintCapStore>(owner, MintCapStore { mint_cap });

        coin::destroy_burn_cap(burn_cap);
        coin::destroy_freeze_cap(freeze_cap);
    }

    public entry fun faucet(deployer: &signer, user: &signer) acquires MintCapStore {
        let deployer_addr = signer::address_of(deployer);
        let user_addr = signer::address_of(user);


        let cap_store = move_from<MintCapStore>(deployer_addr);
        let cap_ref = &mut cap_store.mint_cap;

        let amount: u64 = 1_000 * 100_000_000;
        let coins = coin::mint<FA>(amount, cap_ref);

        coin::register<FA>(user);
        coin::deposit<FA>(user_addr, coins);

        move_to<MintCapStore>(deployer, cap_store);
    }
}

