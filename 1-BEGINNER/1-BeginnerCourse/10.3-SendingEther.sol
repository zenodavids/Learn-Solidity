// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

//before an address can recieve ethers, it must be payable first
contract ReceiveEther {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}

/* Assignment

Build a charity contract that receives Ether that can be withdrawn by a beneficiary.

Create a contract called Charity.
Add a public state variable called owner of the type address.
Create a donate function that is public and payable without any parameters or function code.
Create a withdraw function that is public and sends the total balance of the contract to the owner address.
Tip: Test your contract by deploying it from one account
and then sending Ether to it from another account. Then execute the withdraw function.
*/

contract Charity {
    //define the owner
    address public owner;

    //contract constructor
    constructor() {
        owner = msg.sender;
    }
    // before an address can recieve ethers, it must be open for payments to come in.
    function donate() public payable {}

    function withdraw() public {

        // checks for the total balance
        uint amount = address(this).balance;

        // Call returns a boolean value indicating success or failure.
        (bool sent, bytes memory data) = owner.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
}