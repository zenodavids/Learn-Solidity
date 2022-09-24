// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract IfElse {
    function foo(uint x) public pure returns (uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint _x) public pure returns (uint) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // shorthand way to write if / else statement
        return _x < 10 ? 1 : 2;
    }

    /* ASSIGNMENT

    Create a new function called evenCheck in the IfElse contract:
    That takes in a uint as an argument.
    The function returns true if the argument is even, and false if the argument is odd.
    Use a ternery operator to return the result of the evenCheck function.
    Tip: The modulo (%) operator produces the remainder of an integer division.
    */
    function evenCheck(uint i) public pure returns (bool){
        return i % 2 == 0 ? true : false;
    }
}