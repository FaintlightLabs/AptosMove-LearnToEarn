module coin_token::coin_token {
  use std::string;
  use std::signer;
  use aptos_framework::coin::{Self, MintCapability, BurnCapability};

  const COIN_DECIMALS: u8 = 8;

  struct CoinToken has key, store {}

  struct CoinCapabilities<phantom CoinToken> has key, store {
    mint_cap: MintCapability<CoinToken>,
    burn_cap: BurnCapability<CoinToken>,
  }
  // 0x577bb55cbbb7b09710da55acff3812663539f951298a42ebccdf4657b927197a
  // https://explorer.aptoslabs.com/txn/0x7c2a00d724cbf03fb6f4be3a81a3b0830e616ef193a63b004acb383c61845b3d?network=testnet
  fun init_module(admin: &signer) {
    let (burn_cap, freeze_cap, mint_cap) = coin::initialize<CoinToken>(
        admin,
        string::utf8(b"Coin_a-super-cat"),
        string::utf8(b"Billion$"),
        COIN_DECIMALS,
        true
    );
    move_to(admin, CoinCapabilities<CoinToken> {
      mint_cap,
      burn_cap,
    });

    coin::destroy_burn_cap(burn_cap);
    coin::destroy_freeze_cap(freeze_cap);
  }

  public entry fun mint(admin: &signer, amount: u64) acquires CoinCapabilities {
      let account_addr = signer::address_of(admin);

      if (!coin::is_account_registered<CoinToken>(account_addr)) {
          coin::register<CoinToken>(admin);
      };

      let capabilities = borrow_global<CoinCapabilities<CoinToken>>(account_addr);

      let coins = coin::mint(amount, &capabilities.mint_cap);
      coin::deposit(account_addr, coins);
  }
}