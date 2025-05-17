module hello_world::hello_world {
    use std::string::{String, utf8};

    struct HelloWorld has key {
        message: String
    }

    // 0xfa38c167da8daece0141bac61dc3ca9f7e54a4148f000c7643b146c1318ffb73
    // https://explorer.aptoslabs.com/txn/0x36bf82c5003c9471a13f6fb4c94c325989cc3e4ff9cb7643629507213ab888bd?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld { message: utf8(b"Hello, stualan!") });
    }
}
