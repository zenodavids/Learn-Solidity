// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract FunctionModifier {
    // We will use these variables to demonstrate how to use
    // modifiers.
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // Set the transaction sender as the owner of the contract.
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of
    // the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    // Modifiers can take inputs. This modifier checks that the
    // address passed in is not the zero address.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    // only the owner can asign a new owner
    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }
/////////////////////////////////////////////
  /* assignment

Create a new function, increaseX in the contract.
The function should take an input parameter of type uint
and increase the value of the variable x by the value of the input parameter.
Make sure that x can only be increased.
The body of the function increaseX should be empty.

Tip: Use modifiers.
*/
    modifier biggerThan0(uint y) {
        require(y > 0, "Not bigger than x");
        _;
    }

    modifier increaseXbyY(uint y) {
        _;
        x = x + y;
    }

    function increaseX(uint y) public onlyOwner biggerThan0(y) increaseXbyY(y){
    }
//////////////////////////////////////////////

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}