module 0x91ef3a27df25618223851e64f583204085d0bca35922fdade54ceebde557f19a::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // 0x79622609d201fbbdb27f526afaf26587405a0e529016ef2a9852c0d6a23cc857
    // https://explorer.aptoslabs.com/txn/0x9151f5a64c6f9bed01c77b83de5b1a50eb5ddcfe0dfeff4ae3e1129d5a435343?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, ctyweb3!")
        });
    }
}