// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Mapping {
    /*Mappings are declared with the syntax
    mapping(KeyType => ValueType) VariableName.

     The key type can be any built-in value type or any contract,
     but not a reference type. The value type can be of any type.
    */
    // Mapping from address to uint
    mapping(address => uint) public myMap;
    mapping(address => uint) public balances;

    function get(address _addr) public view returns (uint) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value 0.
        return balances[_addr]; //accessing values

    }

    function set(address _addr, uint _i) public {
        // Update the value at this address
        myMap[_addr] = _i; //setting value
        balances[_addr] = _i; //setting value
    }

    function remove(address _addr) public {
        // Reset the value to the default value.
        delete myMap[_addr];
        delete balances[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nested[_addr1][_i];
    }

    function set(
        address _addr1,
        uint _i,
        bool _boo
    ) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}