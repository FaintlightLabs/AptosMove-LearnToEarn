### 开发文档
``` move
- 编写合约
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

```
``` bash
D:\Code\web3\aptos\AptosMove-LearnToEarn\stualan> aptos move compile --named-addresses hello_world=default --skip-fetch-latest-git-deps
Compiling, may take a little while to download git dependencies...
FETCHING GIT DEPENDENCY https://github.com/aptos-labs/aptos-core.git
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
{
  "Result": [
    "d323ef554eb31900f4a4f552918f6eb65eeaebc74d91e6ab984aae2cee55317c::hello_world"
  ]
}
PS D:\Code\web3\aptos\AptosMove-LearnToEarn\stualan> aptos move publish --named-addresses hello_world=default 
Compiling, may take a little while to download git dependencies...
UPDATING GIT DEPENDENCY https://github.com/aptos-labs/aptos-core.git
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
package size 1048 bytes
Do you want to submit a transaction for a range of [177500 - 266200] Octas at a gas unit price of 100 Octas? [yes/no] >
yes
Transaction submitted: https://explorer.aptoslabs.com/txn/0x4740f05b0fbf5b5dc298f48ddbc3ae42f753726fb025b45293dd870ae5dc65b4?network=devnet
{
  "Result": {
    "transaction_hash": "0x4740f05b0fbf5b5dc298f48ddbc3ae42f753726fb025b45293dd870ae5dc65b4",
    "gas_used": 1775,
    "gas_unit_price": 100,
    "sender": "d323ef554eb31900f4a4f552918f6eb65eeaebc74d91e6ab984aae2cee55317c",
    "sequence_number": 0,
    "success": true,
    "timestamp_us": 1739187606474782,
    "version": 48366671,
    "vm_status": "Executed successfully"
  }
}
```