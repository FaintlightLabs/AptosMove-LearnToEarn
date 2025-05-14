module hello_blockchain::message {

    use std::string::{String, utf8};
    use aptos_std::debug;

    struct HelloWorld has key{
        message:String
    }
    // 0x078963b90d1dcf7078c899f8ee3397f61eb106a4e8bc62049e600cda57770bf0
    //  https://explorer.aptoslabs.com/txn/0x770fd21caf3deabf7209a1aea3b1a4b53002443a1c7fdae61a4fddfd8b86430d?network=testnet
    fun init_module(sender:&signer){
        let message: String=utf8(b"Hello,Dr-yellow");
        debug::print(&message);
        move_to(sender,HelloWorld{
            message
        });
    }
}