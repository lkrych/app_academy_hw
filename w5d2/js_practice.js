function madLib(verb, adjective, noun) {
  // Write a function that takes three strings - a verb, an adjective,
  // and a noun - uppercases and interpolates them into the sentence
  // "We shall VERB the ADJECTIVE NOUN". Use ES6 template literals.
  console.log(`We shall ${verb} the ${adjective} ${noun}.`);
}
madLib('destroy', 'evil','tacos');


function isSubstring(searchString, subString){
//returns a boolean if the substring is part of the search string
  console.log(searchString.includes(subString));
}
isSubstring("The Dutch East Indies Trading company", "East");
isSubstring("The Dutch East Indies Trading company", "India");

function fizzBuzz(array){
// 3 and 5 are magic numbers.
// Define a function fizzBuzz(array) that takes an array and
// returns a new array of every number in the array that is divisible
// by either 3 or 5, but not both.
  const fizz = [];
  array.map((el) => {
    
  });
}
function isPrime(){}

function sumOfNPrimes(){}

function titleize(array_of_names,callback){}
// Write a function titleize that takes an array of names and a function
// (callback). titleize should use Array.prototype.map to create a new
// array full of titleized versions of each name - titleize meaning "Roger"
// should be made to read "Mx. Roger Jingleheimer Schmidt". Then pass this
// new array of names to the callback, which should use Array.prototype.forEach
 // to print out each titleized name.
