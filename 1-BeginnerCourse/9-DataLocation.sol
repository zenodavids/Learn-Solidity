// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract DataLocations {

  // state variables (arr, map, and myStructs) are always stored in storage.
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) public myStructs;

   /*  Assignment

Change the value of the myStruct member foo, inside the function f, to 4.
Create a new struct myMemStruct2 with the data location memory inside the function f and assign it the value of myMemStruct. Change the value of the myMemStruct2 member foo to 1.
Create a new struct myMemStruct3 with the data location memory inside the function f and assign it the value of myStruct. Change the value of the myMemStruct3 member foo to 3.
Let the function f return myStruct, myMemStruct2, and myMemStruct3.
Tip: Make sure to create the correct return types for the function f.
    */
    function f() public returns (MyStruct memory, MyStruct memory, MyStruct memory){
        // call _f with state variables
        _f(arr, map, myStructs[1]);
        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        myStruct.foo = 4;
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
        MyStruct memory myMemStruct2 = myMemStruct;
        myMemStruct2.foo = 1;

        MyStruct memory myMemStruct3 = myStruct;
        myMemStruct3.foo = 3;
        return (myStruct, myMemStruct2, myMemStruct3);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }


        /* If we wanted to assign a new value to the
    first element of the array _arr,
    we could do that in the function g but not in the function h.
     This is because _arr in function g has the data location memory
     and function h has the data location calldata. */
    // You can return memory variables
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // do something with memory array
        _arr[0] = 1;
    }

    function h(uint[] calldata _arr) external {
        // do something with calldata array
        // _arr[0] = 1;
    }
}
