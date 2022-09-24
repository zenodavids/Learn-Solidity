/*licence*/
// SPDX-License-Identifier: MIT

/*specifies the compiler version of Solidity used*/
pragma solidity ^0.8.0;

/*imports the ERC-20 token standard from OpenZeppelin (OZ).*/
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

/*
* name of solidity contract is ZeeToken
* ZeeToken is an instance of ERC20
*/
contract ZeeToken is ERC20 {

    /*
     * constructor function that is called when the smart contract is first deployed.
     * using the first parenthesis, we want two arguments from the user;
      _name (name of the token),
      _symbol (symbol of the Token).
    * ERC20(_name, _symbol) is from the imported openZepplin contract's constructor. here,
     we call that as part of our constructor.
    */
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {

      /*
       * _mint is an internal function within the ERC20 standard contract,
        which means that it can only be called by the contract itself.
       * Since you (the developer) want to receive some tokens when you deploy this contract,
        we call the _mint function to mint some tokens to msg.sender.
       * _mint takes two arguments - an address to mint to, and the amount of tokens to mint
       * 10 * 10 ** 18 specifies that you want 10 full tokens to be minted to your address.
       * ERC20 tokens by default work with 18 decimal places.
         So 1 full LW3Token in this case, is actually represented as 10 ^ 18.
         Therefore, to get 10 full LW3Tokens, we use 10 * 10 ** 18.
      */
        _mint(msg.sender, 10 * 10 ** 18);
    }
}

// 0x105a6915a2a8fE793EdEB0BD7B4D98698cF2E7f3