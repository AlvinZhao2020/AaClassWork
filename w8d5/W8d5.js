// class Clock {
//     constructor(){
//         const date = new Date();
//         this.myTime = [date.getHours(), date.getMinutes(), date.getSeconds()];
//         this.printTime(this.myTime);
        
//         // We run setInterval in the browser, so the context for setInterval is initially the window.
//         // Bind switches the context for setInterval to Clock
//         // setInterval(this._tick.bind(this),1000);
//         // Fat Arrow binding can't be changed
//         setInterval(()=> this._tick(),1000);
//     }
//     printTime() {  
//         console.log(`${this.myTime[0]}:${this.myTime[1]}:${this.myTime[2]}`);
//     }
//     _tick(){
//         if (this.myTime[2] === 59){
//             if (this.myTime[1] === 59){
//                 if(this.myTime[0] === 23){
//                     this.myTime[0] = 0;
//                 }
//                 else {
//                     this.myTime[0] += 1;
//                 }
//                 this.myTime[1] = 0;
//             }
//             else {
//                 this.myTime[1] += 1;
//             }
//             this.myTime[2] = 0;
//         }
//         else {
//             this.myTime[2] += 1;
//         }
//         return this.printTime();
//     }
// }
// const clock = new Clock();
// // Imported the readline library
const readline = require('readline');

// Create new interface instance of that library
const reader = readline.createInterface({
    // it's okay if this part is magic; it just says that we want to
    // 1. output the prompt to the standard output (console)
    // 2. read input from the standard input (again, console)

    input: process.stdin,
    output: process.stdout
});

// function addNumbers(sum,numsLeft,completionCallback) {            
//     if (numsLeft > 0){
//         // Ask the user for a number
//         reader.question('give me a number',function(numString){
//             // Turn the input string into a number
//             const number = parseInt(numString);
//             sum += number;
//             // print partial sum at this round
//             console.log(`partial sum :${sum}`);
//             numsLeft -= 1 ;
//             //recursion
//         addNumbers(sum,numsLeft,completionCallback);

//         });
//     } else {
//         completionCallback(sum);
//         reader.close();
//     }
// }


// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


function askIfGreaterThan(el1, el2, callback) {
    // ask user if el1 larger than el2 and get a boolean back.
        reader.question(`Is ${el1} larger than ${el2}?`, function(answer){
            if (answer === 'yes') {
                return callback(true);
            } else if (answer === 'no') {
            return callback(false);
            }
        }
    )
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i === (arr.length - 1)){
        outerBubbleSortLoop(madeAnySwaps);
    }
    if (i<arr.length-1) {
        askIfGreaterThan(arr[i], arr[i+1], (isGreaterThan)=>{
            if (isGreaterThan === true) {
                let temp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = temp;
                madeAnySwaps = true;
            }
            innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
        }
        );
       
    }
}

function absurdBubbleSort(arr,sortCompletionCallback){
    function outerBubbleSortLoop(madeAnySwaps){
        if (madeAnySwaps == true){
            innerBubbleSortLoop(arr,0,false,outerBubbleSortLoop);
        }else{
            sortCompletionCallback(arr);
        }
    }
    outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
});