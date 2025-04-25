
// txn: 0x9edb44def9163d3c94dcadcfa7211c2a6f8bae54ed5d20c0f1b45f4e410e832b
// https://explorer.aptoslabs.com/txn/0x9edb44def9163d3c94dcadcfa7211c2a6f8bae54ed5d20c0f1b45f4e410e832b?network=testnet
module KlrCoin::coin {
    use std::signer;
    use aptos_framework::managed_coin::{Self, mint, burn, register};

    struct Coin_klren0312 {}

    fun init_module(sender: &signer) {
        managed_coin::initialize<Coin_klren0312>(
            sender,
            b"Coin_klren0312",
            b"KLR",
            9,
            false,
        );
    }

    // txn: 0x826f0c61ebf039983bdf79e6e6bc57fd773b52e29daa25f90f1872d17f20fb00
    public entry fun registerCoinType(sender: &signer) {
        register<Coin_klren0312>(sender);
    }

    // txn: 0x2fd5fa67a4a4375a5c0f86221540f7beafbe34ff8ca93039166febd15572033b
    public entry fun mint_coin(
        sender: &signer
    ) {
        let address = signer::address_of(sender);
    
        mint<Coin_klren0312>(
            sender,
            address,
            200_000_000_000,
        );
    }

    // txn: 0x954d79c65fa84b1524addafff6ef00aa547600c042daed52e9311951f2dd0efd
    public entry fun burn_coin(
        sender: &signer,
        amount: u64
    ) {
        burn<Coin_klren0312>(
            sender,
            amount
        );
    }

}