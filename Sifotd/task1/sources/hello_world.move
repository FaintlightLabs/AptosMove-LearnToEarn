module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }
    // 0xe6bd0836a586c895e7ef40a1cc6285f7acd5c8bf57b372e79a01b90b4d2c2b3f
    // https://explorer.aptoslabs.com/txn/0x59a89638868453284c847020fe8bd1c4205f32d37297e0c5f1cbb7e91b13fe44?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, Sifotd")
        });
    }
}
