# Mining

Mining is the process that helps create new blocks of transactions to be added to the Ethereum blockchain network.
It also helps keep the network secure from attacks.

_Ethereum 2.0 (scheduled for mid-late 2022) has replaced Proof of Work with Proof of Stake_

# Why do miners exist?

Miners, therefore, are also responsible for validating cryptocurrency transactions on the blockchain network and adding them to the ledger.
In Ethereum, when a miner successfully mines a block, they receive 2 ETH for their hard work.

_Who can become a miner?_
_Anyone, though not everyone can mine Ethereum profitably._

# Costs of Mining

- Costs to build and maintain the hardware,
- Electrical costs of powering the mining rig,
- Potential cost of equipment to support the mining rig (coolers, ventilators, energy monitors, electrical wiring, solar farms, etc.)
  To mine profitably, you can use a calculator like this;
  https://etherscan.io/ether-mining-calculator.

# How are Ethereum transactions mined?

_1._ A user signs a transaction request from their account.
_2._ The transaction is broadcasted to the Ethereum network through a node.
_3._ Upon hearing of the new transaction, each node in the network adds the transaction to their local mempool (memory pool).
The mempool is a list of transactions that nodes have heard about but have not yet been included as part of a block.
_4._ At some point, a miner groups a lot of transactions into a potential block, in a way that maximizes transaction fees they earn while staying under the block gas limits. Then,
_4a._ The miner verifies the validity of each transaction. This involves things like checking that no one is trying to transfer ether they don't own, or that the signature is invalid, or the request is malformed, etc.
_4b._ The miner then executes the transaction on their local copy of the Ethereum Virtual Machine (EVM). It awards the transaction fees for each such request to their own account.
_4c._ The miner begins the process of creating the Proof-of-Work certificate of legitimacy for the entire block, after all transactions in the block have been verified and executed on their local EVM.
_5._ Eventually, the miner finishes producing the certificate of legitimacy for the block, which includes the user's transaction. The miner then broadcasts the completed block to the world, which includes the certificate and the new state information for the blockchain.
_6._ Other nodes hear about the new block. They verify the certificate (which is easy to do), execute all transactions in the block on their local copies of the EVM, and verify that their EVM state matches the one proposed by the miner.
_7._ Once other nodes have verified everything proposed by the miner, they add this block to their blockchain node, and accept the new EVM state as "the current state of the blockchain".
_8._ Each node removes the transactions included within the block from their local mempool.
_9._ This process repeats.

# Methods of Mining

===================

# _1._ CPU-based mining

First mining method.
quite slow and impractical because it can take months to earn a tiny amount of mining rewards.

# _2._ GPU-based mining

most common mining method.
maximizes the computation power by bringing together multiple GPUs under a single mining rig and putting them all to work.

# _3._ Application-Specific Integrated Circuit (ASIC) mining

also very popular.
These are hardware chips designed specifically to mine Ethereum.

# _4._ Cloud mining

allows individual miners to leverage the power of dedicated mining facilities, without owning any hardware.

# Mining Pools

Mining pools allow miners to combine their computational resources in order to increase their chances of mining blocks.
If anyone in the mining pool succeeds at mining a block, the reward is distributed proportionately to everyone in the pool based on their computational power they contribute to the pool.
