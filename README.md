# AptosMove LearnToEarn
![Web 1920 1 (4)](https://github.com/user-attachments/assets/1f52b068-61fb-456d-98ca-cda7042ade30)

>Aptos Move Learn To Earn 是由 Faintlight x KeyMap 联合发起的 Aptos Move 共学营。

>帮助大家学习 Aptos Move 合约以及更高级的合约操作以及 typescript sdk 、React 中的 wallet 组件的用法等。

>希望大家可以用更轻松的心态学习一门新的语言，接触新的公链技术


## **可供参考的学习内容和路线**

1. Aptos 公链机制：
    - 了解 Aptos 公链的架构、共识机制，Gas 模型、帐户模型、资源模型、交易与状态模型
    <details> 
        
    - [共识机制](https://aptos.dev/en/network/blockchain/validator-nodes#consensus) 
    - [账户模型](https://aptos.dev/en/network/blockchain/accounts)
    - [Gas 模型](https://aptos.dev/en/network/blockchain/gas-txn-fee)
    - [资源模型](https://aptos.dev/en/network/blockchain/resources)
    - [交易与状态模型](https://aptos.dev/en/network/blockchain/txns-states)
   </details>
3. Aptos Move （初级）：
    - 了解 Aptos Move 的基本语法，Aptos  Stdlib 的使用
    <details> 
        
    - [Aptos Move Book](https://aptos.dev/en/build/smart-contracts/book)
    - [Aptos Stdlib 合约源码](https://github.com/aptos-labs/aptos-core/tree/main/aptos-move/framework/aptos-stdlib/sources)
   </details>
5. Aptos Move （中级）：
    - 了解 Aptos Move Framework 和 其他官方库，并尝试部署简单的 ToDolist 合约、了解 Object 模型
    <details> 
        
    - [Aptos Move Framework 合约源码](https://github.com/aptos-labs/aptos-core/tree/main/aptos-move/framework/aptos-framework/sources)
    - [Aptos Token 合约源码](https://github.com/aptos-labs/aptos-core/tree/main/aptos-move/framework/aptos-token-objects/sources)
    - [ToDolist 合约示例](https://learn.aptoslabs.com/zh/code-example/todo-list)
    - [Object 模型](https://aptos.dev/en/build/smart-contracts/objects)
   </details>
7. Aptos Move （高级）：
    - 了解 Aptos Move 的代币标准 ，FA （同质化代币） / DA（非同质化代币），并尝试部署自己的 代币水龙头、NFT LaunchPad 
    <details> 
        
    - [NFT LaunchPad 合约 / 前端 示例](https://learn.aptoslabs.com/zh/code-example/fa-launchpad)
        - [Live Demo](https://fungible-asset-launchpad.vercel.app/)
    - [Fungible Asset（ 同质化代币 -  FT / ERC 20 ）文档](https://aptos.dev/en/build/smart-contracts/fungible-asset)
    - [Digital Asset（ 非同质化代币 -  NFT / ERC 721 ）文档](https://aptos.dev/en/build/smart-contracts/digital-asset)
   </details>
8. Dapp开发： 合约测试，React / Nextjs 与 Aptos Wallet 的链接、Ts SDK 的使用，读取链上数据、发送链上交易
9. 新功能：Keyless 无私钥登陆，Randomness 链上随机数， Dispatchable Fungible Assets


## 任务列表

| 任务编号 | 任务名称 | 任务奖励 | 详情 |
|--------|--------|--------|--------|
| [Task 1](https://www.buildthree.xyz/bounty/0xd4548fe6626f7fb1c188d233677145ee1018aa2506590535baeeb602c01fabb1) | 完成 Aptos Testnet 上的 hello  world 合约部署 | 1 USDT     | [任务详情](#Task-1)  |
| [Task 2](https://www.buildthree.xyz/bounty/0x011a4e5e7adf4f5e6505de97ddde2565b467f1ff6e1bc4e6acca8d36d02fd8f6) | 完成 Aptos Testnet 上的 Coin 合约部署         | 1.5 USDT   | [任务详情](#Task-2)  |
| [Task 3](https://www.buildthree.xyz/bounty/0x5f7689d6cfc854cabfa1dd7436ffed3333520158ec570a107b3923534aee1685) | 完成 Aptos Testnet 上的 Fungible Asset (FA) 合约部署 | 2 USDT | [任务详情](#Task-3) |


### Task 1

任务简要： 完成 Aptos Testnet 上的 hello  world 合约部署
任务奖励： 1 USDT 
任务详情：

- 完成 hello world 合约，并将 Message 改为 `hello \<Your github id>`
- 将合约部署 txn 写入合约的注释部分
- 将合约源码用 pull request 的方式提交至当前仓库（合约应该放入 一个以你的 Github id 作为名字的文件夹）
- 等待 PR 审核，完成修改
- 将已经合并的 PR 链接发送至 Build3 的 Proof 等待审核并领取奖励

#### Task 1 操作步骤（Task 1 为示例教学关，后续不会由操作步骤演示）：
<details>

1. **Fork 本项目**
   点击右上角的 `Fork` 按钮，将项目 fork 到你的 GitHub 账户。

2. **Clone 本地仓库**
   在本地将 fork 后的仓库 clone 到你的本地：

   **注意修改 <your-username> 部分为你的 Github id，否则 clone 失败**
  
   ```bash
   git clone https://github.com/<your-username>/AptosMove-LearnToEarn.git
   cd AptosMove-LearnToEarn
   ```
3. **创建文件夹结构**

     在根目录下创建一个以你的 GitHub ID 命名的文件夹，然后在该文件夹下创建 task1 文件夹，并将 Hello World 合约放入该文件夹中
     
     例如，假设你的 GitHub ID 为 username，文件夹结构应如下所示：
   
     ```
     username/
     └── task1/
         └── sources
             └── hello_world.move
         └── Move.toml
     ```
   
     1. 可以使用 `mkdir username` 创建外层文件夹
   
     2. 然后使用 `mkdir task1` 创建 task 1 文件夹
     
     3. 执行 `cd task1` 进入 task 1 文件夹 
   
     4. 并执行 `aptos move init --name task1` 创建 Aptos 项目目录结构
   
     5. 在 sources 目录下创建 hello_world.move 文件
4. **编写 hello_world.move**
   在 hello_world.move 中填写以下代码，注意要将 <Your Github ID> Github ID 修改成自己的

   ```
   module hello_world::hello_world {
       use std::string::{String, utf8};
   
   
       struct HelloWorld has key {
           message: String
       }
   
       fun init_module(sender: &signer) {
           move_to(sender, HelloWorld{
               message:  utf8(b"Hello, <Your Github ID>!")
           });
       }
   }

   ```
5. **编译并publish 合约**
   - 可以先使用 `aptos init` 创建一个私钥账户，并根据提示领取测试币
   - 在Move.toml里面[addresses]下面加上hello_world="<你上一步初始化的地址>"
   ```
    [package]
    name = "task1"
    version = "1.0.0"
    authors = []

    [addresses]
    hello_world="<你上一步初始化的地址>"
    
    [dev-addresses]

    [dependencies.AptosFramework]
    git = "https://github.com/aptos-labs/aptos-framework.git"
    rev = "mainnet"
    subdir = "aptos-framework"

    [dev-dependencies]

   ```
   - 使用 `aptos move publish` 可以部署代码
   - 将在部署代码前替换下方的 <在 Build3 领取任务的钱包地址> 
   - 将部署代码后的 txn hash 保存到当前代码中 , 替换 <TXN Hash>

   ```

   module hello_world::hello_world {
       use std::string::{String, utf8};
   
   
       struct HelloWorld has key {
           message: String
       }

       // <在 Build3 领取任务的钱包地址>
       // https://explorer.aptoslabs.com/txn/<TXN Hash>?network=testnet
       fun init_module(sender: &signer) {
           move_to(sender, HelloWorld{
               message:  utf8(b"Hello, <Your Github ID>!")
           });
       }
   }
   ```
6. **commit 代码并提交 Pull request**
   - 这一步骤可以使用 AI 或者 搜索引擎
7. **等待合并 - 提交 PR 的链接至 Build3**
   - 当请求合并的 PR 被成功合并后，将合并的 PR 链接发送至
</details>

### Task 2
任务简要： 完成 Aptos Testnet 上的 Coin 水龙头合约部署
任务奖励： 1.5 USDT 
任务详情：

- 完成 Coin 合约，在合约的 `fun init_module` 函数中发行 Coin
- `Coin` 的名字为 `Coin + _ + Github ID`, 例如： 我是 inekxo8 ，我发行的代币 name 为 `Coin_inekxo8`
- `Coin` 的 `symbol` 不做要求, 合理即可
- `Coin` 的精度为 `8`
- **当前合约应该可以由任意账户领取 `Coin`, 实现代币水龙头的功能**
- 将合约部署 txn 写入合约的注释部分
- 将合约源码用 pull request 的方式提交至当前仓库（合约应该放入 一个以你的 Github id 作为名字的文件夹）
- 等待 PR 审核，完成修改
- 将已经合并的 PR 链接发送至 Build3 的 Proof 等待审核并领取奖励


参考资料：
- init_module: https://aptos.dev/en/build/smart-contracts/modules-on-aptos
- Aptos Coin: https://aptos.dev/en/build/smart-contracts/aptos-coin

### Task 3
任务简要： 完成 Aptos Testnet 上的 Fungible Asset (FA) 水龙头合约部署
任务奖励： 2 USDT 
任务详情：

- 完成 FA 合约，在合约的 `fun init_module` 函数中发行 FA
- `FA` 的名字为 `Coin + _ + Github ID`, 例如： 我是 inekxo8 ，我发行的代币 name 为 `FA_inekxo8`
- `FA` 的 `symbol` 不做要求, 合理即可
- `FA` 的精度为 `8`
- **当前合约应该可以由任意账户领取 `FA`, 实现代币水龙头的功能**
- 将合约部署 txn 写入合约的注释部分
- 将合约源码用 pull request 的方式提交至当前仓库（合约应该放入 一个以你的 Github id 作为名字的文件夹）
- 等待 PR 审核，完成修改
- 将已经合并的 PR 链接发送至 Build3 的 Proof 等待审核并领取奖励


参考资料：
- init_module: https://aptos.dev/en/build/smart-contracts/modules-on-aptos
- Fungible Asset: https://aptos.dev/en/build/smart-contracts/fungible-asset
