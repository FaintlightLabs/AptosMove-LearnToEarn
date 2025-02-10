module hello_world::hello_world {
    use std::string::{String, utf8};

    struct HelloWorld has key {
        message: String
    }

    // 0xd323ef554eb31900f4a4f552918f6eb65eeaebc74d91e6ab984aae2cee55317c
    // https://explorer.aptoslabs.com/txn/0x4740f05b0fbf5b5dc298f48ddbc3ae42f753726fb025b45293dd870ae5dc65b4?network=devnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld { message: utf8(b"Hello, stualan!") });
    }
}
