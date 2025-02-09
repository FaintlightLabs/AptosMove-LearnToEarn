module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    //0x6496731b7fda283560237e102224ac60db155966d1aecf66b7f0daf9737cec81
    //https://explorer.aptoslabs.com/txn/0xf5ad14a299fe8071c232c681248126e8b9aa1a389041fa47286e9a324ac6a706?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, baicaiyihao")
        });
    }
}
