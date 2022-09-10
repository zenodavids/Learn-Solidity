// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract ViewAndPure {
    uint public x = 1;

    // Promise not to modify the state but reads the state.
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }


    // Promise not to modify or read from the state.
    // no side effects and will always return the same result if you pass the same arguments
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }


    /* ASSIGNMENT

    Create a function called addToX2
    that takes the parameter y and
    updates the state variable x with the
    sum of the parameter and the state variable x.
    */
       function addToX2(uint y) public {
         x = x + y;
    }

}

//Declaring functions view and pure can save gas cost and make the code more readable and easier to maintain.

/* modifying the state means;

Writing to state variables.
Emitting events.
Creating other contracts.
Using selfdestruct.
Sending Ether via calls.
Calling any function not marked view or pure.
Using low-level calls.
Using inline assembly that contains certain opcodes."
*/

/* Reading the state means;

Reading from state variables.
Accessing address(this).balance or <address>.balance.
Accessing any of the members of block, tx, msg (with the exception of msg.sig and msg.data).
Calling any function not marked pure.
Using inline assembly that contains certain opcodes.
*/

// learn more from
// https://docs.soliditylang.org/en/latest/contracts.html#view-functions