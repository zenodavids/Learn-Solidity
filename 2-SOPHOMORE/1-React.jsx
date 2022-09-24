//* ###########****************************########### *//
//* ###########**** REACT(FRONT-END) ******########### *//
//* ###########****************************########### *//

import React from "react";

/*** 1-working with arrays and mapping ***/
const React = () => {
  return (
    <div>
      {/* set up an array */}
      const items = ["Apples", "Bananas", "Grapes"];
      <div>
        <h1>Shopping List</h1>
        <ul>
          {/* map through the array */}
          {items.map((item, index) => (
            <li key={index}>{item}</li>
          ))}
        </ul>
      </div>
    </div>
  );
};

/* ************* 2 ***************** */

{
  /*** 2-Data Passing between Components (props) ***/
}

// Card receives an object as an argument
// We can destructure the object to get specific variables
// from inside the object - name and job
function Card({ name, job }) {
  return (
    <div className='card'>
      <img src='https://picsum.photos/100' alt='avatar' />
      <div className='container'>
        <h4>
          <b>{name}</b>
        </h4>
        <p>{job}</p>
      </div>
    </div>
  );
}

function Cards() {
  return (
    <div className='cards'>
      <Card name='Alice' job='Frontend Developer' />
      <Card name='Bob' job='Backend Developer' />
      <Card name='Charlie' job='Full Stack Developer' />
    </div>
  );
}

const App = () => {
  return (
    <div className='App'>
      <Cards />
    </div>
  );
};

/* ************** 3 **************** */

/*** 3-Interactive Components ***/
/**
 * adding functions in functions
 *
 */

function someFunc() {
  // called inside someFunc
  function otherFunc() {
    console.log("Hello!");
  }

  otherFunc();
}

someFunc(); // will print "Hello!"

otherFunc(); // will throw an error this is only available for use inside the someFunc() itself.

// a more realistic example
const addThreeNums = (a, b, c) => {
  const addTwoNums = (x, y) => x + y;
  return addTwoNums(a, addTwoNums(b, c));
};
console.log(addThreeNums(1, 2, 3));

/**************************************** */
/** 3a-buttons interactivity */
function Button() {
  function handleClick() {
    console.log("Hello");
  }

  return (
    <button className='button' onClick={handleClick}>
      Click Me!
    </button>
  );
}

const App2 = () => {
  return (
    <div className='App'>
      <Button />
    </div>
  );
};

/**************************************** */
/** 3b-buttons interactivity */

/**print text in the console as the user is typing into an input box */
function PrintTypedText() {
  function handleOnChange(text) {
    console.log(text);
  }

  return <input type='text' onChange={(e) => handleOnChange(e.target.value)} />;
}

const App3 = () => {
  return (
    <div className='App'>
      <PrintTypedText />
    </div>
  );
};

/**************************************** */
/*** 4-React Hooks - useState and useEffect ***/
//***** 4a-useState ****** *//
function ThisWorks() {
  // Variables created using useState in React are called State Variables.
  // myNumber is the variable itself
  // setMyNumber is a function that lets us update the value
  // useState(0) initializes the React Hook
  // with the starting value of 0
  const [myNumber, setMyNumber] = useState(0);

  function increment() {
    // Sets the new value to the old value + 1
    setMyNumber(myNumber + 1);
  }

  return (
    <div>
      <p>{myNumber}</p>
      {/* on click, the value increments by 1 */}
      <button onClick={increment}>Increment!</button>
    </div>
  );
}

//////////
// another example

function StateWithInput() {
  // myName is the variable
  // setMyName is the updater function
  // Create a state variable with initial value
  // being an empty string "" and updates as you type
  const [myName, setMyName] = useState("");

  function handleOnChange(text) {
    setMyName(text);
  }

  return (
    <div>
      <input type='text' onChange={(e) => handleOnChange(e.target.value)} />
      <p>Hello, {myName}!</p>
    </div>
  );
}

//////////
// another example

// useState can store arrays and objects... using the spread operator
function StateArray() {
  const [fruits, setFruits] = useState([]);
  const [currentFruit, setCurrentFruit] = useState("");

  function updateCurrentFruit(text) {
    setCurrentFruit(text);
  }

  function addFruitToArray() {
    // The spread operator `...fruits` adds all elements
    // from the `fruits` array to the `newFruits` array
    // and then we add the `currentFruit` to the array as well
    const newFruits = [...fruits, currentFruit];
    setFruits(newFruits);
  }

  return (
    <div>
      <input type='text' onChange={(e) => updateCurrentFruit(e.target.value)} />
      <button onClick={addFruitToArray}>Add Fruit</button>

      <ul>
        {fruits.map((fruit, index) => (
          <li key={index}>{fruit}</li>
        ))}
      </ul>
    </div>
  );
}

//***** 4b-useEffect ****** *//
import { useEffect, useState } from "react";
/*
* automatically runs code when page is first loaded when a certain state variable changes
* These type of functions are called side effects.
* useEffect takes two arguments - a function and a dependency array;
* The function is the code that runs when the effect is run,
* the dependency array specifies when to trigger the side effect.

* below is an example of when the website is first loaded and wants to display the user a loading screen, once the data has been loaded, remove the loading screen and show the actual content.
*/
function LoadDataFromServer() {
  const [data, setData] = useState("");
  const [loading, setLoading] = useState(false);

  async function loadData() {
    setLoading(true);

    // Imaginary function that performs an API call to load
    // data from a server
    const data = await apiCall();
    setData(data);

    setLoading(false);
  }

  // loadData is the function that is ran
  // An empty dependency array means this code is ran
  // once when the page loads
  useEffect(() => {
    loadData();
  }, []);
  // if loading, display chill, else display data
  return <div>{loading ? "chill..." : data}</div>;
}

async function apiCall() {
  return new Promise((resolve) => {
    // display for 'chill...' for 5 seconds
    setTimeout(() => resolve("ABCDEF"), 5000);
  });
}

//////////////////
//running some piece of code every time a state variable's value changes. ie, say you're searching for a person's name on Facebook, how does Facebook fetch and display recommendations every time you add/remove a character?
function DependentEffect() {
  const names = ["Alice", "Bob", "Charlie", "David", "Emily"];

  const [recommendations, setRecommendations] = useState([]);
  const [searchText, setSearchText] = useState("");

  useEffect(() => {
    // If user is not searching for anything, don't show any recommendations
    if (searchText.length === 0) {
      setRecommendations([]);
    }
    // Else, find recommendations
    else if (searchText.length > 0) {
      const newRecs = names.filter((name) =>
        name.toLowerCase().includes(searchText.toLowerCase())
      );
      setRecommendations(newRecs);
    }
  }, [searchText]);

  return (
    <div>
      <input type='text' onChange={(e) => setSearchText(e.target.value)} />
      <h2>Recommendations:</h2>
      <ul>
        {recommendations.map((rec, index) => (
          <li key={index}>{rec}</li>
        ))}
      </ul>
    </div>
  );
}

////////////
// You can also similarly create side effects which are dependent on multiple state variables, not just one. If any of the dependent variables change, the side effect is run. You do this by just adding more state variables to the dependency array.
useEffect(() => {
  // Some code
}, [stateVar1, stateVar2, stateVar3, andSoOn]);

//***** 4c-useRef ****** *//
import { useRef } from "react";
/**
 * Similar to useState
 * a useRef variable does'nt update the HTML view.
 * allows us to refer directly to DOM elements.
 *
 * When you run this below example,
 you will notice that as soon as the page loads, the input element is already in focus i.e.
 you can start typing without clicking on it first.
 This is because we hold a reference to the input element,
 and have a useEffect that runs on page load due to having an empty dependency array,
 that focuses on the input element.
 */
function InputFocus() {
  const inputRef = useRef();

  useEffect(() => {
    inputRef.current.focus();
  }, []);

  return <input ref={inputRef} type='text' />;
}
export default React;
/**
 * React File Structure
Great, we have covered the main concepts you should know if you're just getting started with React. But so far, we have only dealt with isolated component examples. How does an actual React project look like?

React applications are typically created using a tool like create-react-app (CRA). CRA is a command-line tool that helps you setup new React projects and install all the required dependencies without you needing to manually create all the boilerplate.

When you use CRA, you will end up with a file structure that looks like this.

Image

The package.json file should be recognizable. CRA works through a Node.js environment, and package.json is where all the dependencies and project metadata is created - as with any other Node.js project.

The src/ folder houses the components and CSS styling, basically any React-specific code. The main component here is App.js, which is the autogenerated component that is created when you first set up a React application. index.js is the main entrypoint of the React application, but typically you would not need to modify it very much (or at all). It just contains some boilerplate React code that takes your components and converts it into actual HTML and JS that can be run in a browser.

The public/ folder then contains only one file by default - index.html. You would usually never touch this yourself. This is a super simple barebones HTML file. When a React app is run, React does some magic under the hood that takes all your components and Javascript code, converts it to actual HTML and JS that can run in the browser, and replaces the contents of index.html with all of that. Then, the updated index.html is what is displayed to the user.

If you wanted to add images, fonts, music, etc. to your website, they would also go into the public/ folder. The public/ folder basically contains everything you want to be directly accessible on your website.

For example, if you added an image called avatar.png into your public/ folder, you can then display that image within a React component as such:

<img src="/avatar.png" />

While this may seem weird because your component lives inside the src/ folder and not the public/ folder - the reason it works is because the image lives in the same folder as index.html - and index.html is where your React code actually ends up. So when referencing an image using the relative path of /avatar.png, it knows that avatar.png must be inside the public folder.
 */
