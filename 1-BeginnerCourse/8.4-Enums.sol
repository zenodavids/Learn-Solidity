// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Enum {
    // Enum representing shipping status
    // define enum
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    // define enum
    enum Size {
        S,
        M,
        L
    }

    /* Default value is the first element listed in
    definition of the type, in this case "Pending"

    enum variable syntax
     name of the enum, the visibility, and the name of the variable
    */
     // initialize enum variable

    Status public status;
    Size public sizes;

    /*enum members are stored as unsigned (uint) integers, not strings
    Pending  - 0
    Shipped  - 1
    Accepted - 2
    Rejected - 3
    Canceled - 4
    */

    function get() public view returns (Status) {
        // access enum value
        return status;
    }

    function getSize() public view returns (Size) {
        // access enum value
        return sizes;
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // You can also update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}