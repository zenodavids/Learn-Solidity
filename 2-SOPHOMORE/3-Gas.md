transactions made on the Ethereum network require the users to pay a transaction fee.

this fee is called GAS and Gas is the fuel that allows it (Ethereum) to operate, in the same way that a car needs gasoline to run.

Gas fees are paid in Ethereum's native currency - ether or ETH.

======================

# PRE - LONDON UPGRADE

======================
Before the London Upgrade took place in 2021,
how much ether you needed to pay for a transaction was calculated using a simple formula.

gas fees = gas spent x gas price

- Gas Spent is the total amount of gas (in gas units) that were used to execute the transaction
- Gas Price is the amount of ether you're willing to pay per gas unit of execution
  Gas prices are denominated in gwei, a denomination of ETH.

1 Gwei = 0.000000001 ETH
1 ETH = 10^9 Gwei

Gwei stands for Giga-Wei, which is equal to 1,000,000,000 (10^9) wei.
Wei is the smallest denomination of ETH.
1 ETH = 10^18 Wei

# Example

The cheapest transaction is just the transfer of ETH from one account to another. This transaction costs 21,000 gas units.

Therefore, gas fees = 21,000 x 200 = 4,200,000 Gwei = 0.0042 ETH

how the gas price was set to 200 Gwei?
How much the gas price is set to is up to the user.
Transactions with higher gas price have higher priority to be included in a block,
as miners receive a higher tip for mining those first.

Wallets like Metamask provide reasonable estimates for gas prices based on current network conditions for transactions to be executed - therefore most users don't need to touch the gas price values themselves. (Though, you can enable modification through Metamask settings)

# Variable Block Sizes

before the London Upgrade in 2021,
the block gas limit was constant for all blocks.
Each block had a maximum capacity of 15M gas.
In times of high demand, this resulted in bad user experience,
as blocks were operating at full capacity, and users had to wait for the demand to reduce to get included in a block.

======================

# POST - LONDON UPGRADE

======================
On August 5th 2021, the London Upgrade primarily introduced three benefits:

- Better gas fees estimations
- Quicker transaction inclusion
- Burning a percentage of ETH being used as transaction fees.

# Base gas price fees

This was the minimum price per unit of gas for getting your transaction included within this block.
This was calculated natively by the network based on the demand for block space

With this upgrade, the gas fees formula changed to the following:
gas fees = gas spent x (base fees + priority fees)

# Example

if Alice pays Bob 1 ETH, the gas cost (in units) is 21,000.
Suppose the base fees is 100 Gwei,
and Alice decides to include a tip of 10 Gwei.

total gas fees = 21,000 x (100 Gwei + 10 Gwei) = 2,310,000 Gwei = 0.00231 ETH

# Variable Block Sizes

The upgrade introduced variable size blocks to Ethereum.
Each block now has a target gas limit of 15M gas,
but the size can increase or decrease along with network demand,
up until a maximum of 30M gas.

On average, the network achieves equilibrium around 15M gas by modifying the block size and base fees.

If the block gas is greater than the 15M target,
the base fees for the next block is increased.
Similarly, if the block gas is smaller than the 15M target,
the base fees for the next block is decreased.
The amount by which the base fees gets adjusted is dependent on how far the block gas was from the 15M target.

# Better Gas Estimation

On average, the network achieves equilibrium around 15M gas by modifying the block size and base fees.

If the block gas is greater than the 15M target, the base fees for the next block is increased. Similarly, if the block gas is smaller than the 15M target, the base fees for the next block is decreased. The amount by which the base fees gets adjusted is dependent on how far the block gas was from the 15M target.
