Array.prototype.myEach = function(callback) {

    for (let i = 0; i < this.length; i++){
        callback(this[i]);
    }
    // this.forEach(callback);   
}

Array.prototype.myMap = function(callback) {
    let res = [];
    this.myEach( function(ele) { res.push(callback(ele)); } );
    return res;
}

Array.prototype.myReduce = function(callback, initialValue=0) {
  let res = initialValue;
  this.myEach(function(ele) {
    res = callback(res, ele);
  });
  return res; 
}

// const banana = function(ele) {
//    return ele+1; 
// }

// [2,2,2,3,4].reduce(callback, 2)

// console.log([1,2,3,4].myMap(banana))

console.log([1, 2, 3].myReduce(function (acc, el) {
  return acc + el;
})) // => 6