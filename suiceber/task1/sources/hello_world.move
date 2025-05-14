module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // 0xc40073e6eac4067a42b82921b101acc3f8aa96db83170fcfa8fab122773d17cf
    // https://explorer.aptoslabs.com/txn/0x9cebdfb40373f13bf6e2d5f980090c700018e1b22ca1c274b6b80f4001b220c8?network=testnet

    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, suiceber!")
        });
    }
}