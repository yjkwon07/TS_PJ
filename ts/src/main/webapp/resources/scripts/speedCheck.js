// Do the normal stuff for this function
function someMethodIThinkMightBeSlow(startTime) {
    console.log(startTime);

    var duration = performance.now() - startTime;
    console.log("someMethodIThinkMightBeSlow took", duration, "ms");
}