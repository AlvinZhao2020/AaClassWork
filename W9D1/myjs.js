// function sum(){
//     // let arr = Array.from(arguments);
//     let arr = [...arguments];
//     let res = 0;
//     for(let i = 0 ; i<arr.length;i++){
//         res += arr[i];
//     }
//     return res;
// }

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

// class Cat {
//     constructor(name) {
//         this.name = name;
//     }

//     says(sound, person) {
//         console.log(`${this.name} says ${sound} to ${person}!`);
//         return true;
//     }
// }

// class Dog {
//     constructor(name) {
//         this.name = name;
//     }
// }

// // Function.prototype.myBind = function(instance, ...args) {
// //     //this = markov.says
// //     let context = this; //markov.says
// //     //args = ["meow", "Kush"]
// // // ----------------------------------------
// //     return function(...callArgs) { 
// //       //Cat.says.call(instance);
// //       args2 = args.concat(callArgs);
// //       // context.apply(instance, args2);
// //       return context.call(instance, ...args2);
// //     }
// // // ----------------------------------------
// // };

// //...
// Function.prototype.myBind = function() {
//   let context = this;
//   let instance = Array.from(arguments)[0];
//   return function() {
//     let arr = Array.from(arguments);
//     return context.apply(instance, arr);
//   }
// }



// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");



// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true


// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true


function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// e.g.
// let dragon = 
//   name =>
//     size =>
//       element =>
//         name + ' is a ' +
//         size + ' dragon that breathes ' +
//         element + '!';

// console.log(dragon('Karo')('large')('ice'));




Function.prototype.curry = function(n){
    let arr = [];
    let context = this;
    
    function getNum (num) {
      while (arr.length < n) {
        arr.push(num);
      }
    }
    if(arr.length === n) {
      return context(...arr);
    }
}
// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
 
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 
console.log(f1(6));

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6)); // == 30