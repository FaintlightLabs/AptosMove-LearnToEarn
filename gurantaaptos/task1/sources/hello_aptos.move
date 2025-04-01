module 0x68fe777fac6b24a50dfd1a9c9db1717b6a7fdf62c2ca3387690aac6101a9d3ef::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // <0x75daf39280981649649c120e8297c5f725fdc701398ab292fe95e38212a2b763>
    //  https://explorer.aptoslabs.com/txn/0xb39c8bd16c332ecbf28d4155783ddf9da7a656c0a7754641d2c9f67aa4fbe626?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, <guranta>!")
        });
    }
}
