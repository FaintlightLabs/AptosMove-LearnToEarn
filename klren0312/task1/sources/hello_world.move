module hello_world::hello_world {
  use std::string::{String, utf8};

  struct HelloWorld has key {
    message: String
  }

  // 0x1aa098ae614b2a6dcca43797d1fe132c0a3dec0c50f7125ae8e611abbbd03a83
  // https://explorer.aptoslabs.com/txn/0x1d2b610c22cd040686208525b3170070996f7fa038a43290ab846cbfa872b959?network=testnet
  fun init_module(sender: &signer) {
    move_to(sender, HelloWorld { message: utf8(b"Hello, klren0312!") });
  }
}