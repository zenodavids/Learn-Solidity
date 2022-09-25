# Proof of Work

This is a consensus protocol (PoW) That allows all nodes on the Ethereum Network to agree on the current state of the blockchain, and secures the network against a variety of attacks.

_NOTE: Recently on September 15 2022, the Ethereum Merge completed and Ethereum shifted to a Proof of Stake system._

## Consensus protocol

this is when the network nodes need to reach an agreement on the network's current state.

_Consensus is a general agreement about an opinion or idea that is shared by all the people in a group._

Consensus protocols are primarily economic systems that help prevent certain kinds of attacks.

## Block Production

miners are responsible for producing new blocks, Hence compete against each other to create new blocks full of processed transactions.
The winner then earns freshly minted ETH for their hard work.

The race is won by whoever's computer can solve a computationally hard mathematical puzzle the fastest.
The problem is computationally hard to solve, but very easy to verify.

## Network Security

The network is kept secure by the fact that to gain 51% control over the network, you would need 51% of the network's computational power.

## Sybil Resistance

_proof of work is not a consensus protocol by itself._
They are actually _Sybil resistance_ mechanisms and block producer selectors - a way to decide who is going to be the producer of the latest block.

_Sybil Resistance measures how a protocol would do against a Sybil attack._

_A Sybil attack is the problem when one user or group pretends to be many different users._

## Chain Selection Rules

Occasionally, two miners will produce valid blocks roughly at the same time. The technical term for this is a fork.

However, a single contiguous chain needs to be chosen as the "correct chain" to prevent the splitting of state.

"longest chain" rule can do this.
Whichever chain is accepted by a higher number of nodes and continues to grow longer is chosen as the 'correct chain', and the forked chain is gotten rid of.

_The combination of Proof of Work and the longest chain rule is known as "Nakamoto Consensus"_

this means that transactions which get mined as part of a temporary fork may be rolled back once the fork is gotten rid of in favour of a different longer chain.
This introduces the concept of Finality.

_The blocks which form the forked chain and end up getting deleted are called Uncle Blocks._
_the Ethereum network still rewards Uncle block miners with 1.75 ETH for their hard work._

## Finality

_A transaction has "finality" on Ethereum when it's part of a block that can't change._

two valid blocks can get mined at the same time.
This creates a temporary fork.
transactions rejected on the temporary fork may have been included in the accepted chain.
This means it could get reversed.

_So finality refers to the time you should wait before considering a transaction irreversible._

For Ethereum, the recommended time is six blocks or just over 1 minute.
After six blocks, you can say with relative confidence that the transaction was successful (more than 99.999% chance it will not be reverted now).
_You can wait longer for even greater assurances._

## The 'Work' in Proof of Work

The _Ethereum proof-of-work protocol, Ethash,_ requires miners to go through an intense race of trial and error.
The process goes as follows:

_1_/The miner selects a group of transactions to include in a potential block.
Based on the block they create, the network has rules to choose a slice of data (roughly ~1GB in size) from the current state of the blockchain network. These rules are not particularly relevant, but you can read more about them in the Ethash docs.
They put the dataset through a hashing function to calculate a target value. This target is a number, which is inversely proportionate to the mining difficulty. The higher the mining difficulty, the lower the target, and vice versa.
Then, the miner uses brute force to try to find another random number called the nonce.
Putting the combination of the dataset, target, nonce, and a couple other values through a hashing function should result in a number that is lower than the target.
HashFunction(dataset, target, nonce, ...) = a number
The higher the mining difficulty, the lower the target, and hence the harder it is to find a nonce which satisfies this condition.
Miners keep using trial-and-error to find a valid value for the nonce which satisfies the condition. There is no formula to calculate the nonce.
