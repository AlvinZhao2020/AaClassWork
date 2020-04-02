Array.prototype.uniq = function() {
        let res = [];
        for (let i = 0; i < this.length; i++) {
            if (!res.includes(this[i])){
                res.push(this[i]);
            }
        }
        return res;
    }

Array.prototype.twoSum = function() {
  let res = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      if (j > i && this[i] == -this[j]) {
        // let arr = new Array(i, j);
        // res.push(arr);
        res.push([i, j])
      }
    }
  }
  return res;
}

Array.prototype.transpose = function() {
    let res = [];
    for (let i = 0; i < this.length; i++) {  
        let inner = [];
        for (let j = 0; j < this.length; j++) {     
            inner.push(this[j][i]);
        }
        res.push(inner)
    }
  return res;
}
