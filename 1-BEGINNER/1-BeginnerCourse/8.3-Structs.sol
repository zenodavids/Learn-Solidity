// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Todos {
    // define struct
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    function create(string memory _text) public {
        // 3 ways to initialize a struct

        // 1- calling it like a function
        todos.push(Todo(_text, false));

        // 2- key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // 3- initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false

        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        // accessing structs
        return (todo.text, todo.completed);
    }

    // update text
    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }

    /* ASSIGNMENT

    Create a function remove that takes a uint as a parameter
    and deletes a struct member with the given index in the todos mapping.
    */
    function remove(uint _index) public {
        delete todos[_index];
    }
}