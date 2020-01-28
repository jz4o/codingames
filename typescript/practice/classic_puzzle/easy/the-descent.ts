/**
 * The while loop represents the game.
 * Each iteration represents a turn of the game
 * where you are given inputs (the heights of the mountains)
 * and where you have to print an output (the index of the mountain to fire on)
 * The inputs you are given are automatically updated according to your last actions.
 **/


// game loop
while (true) {
    let mountainHs: number[] = [];
    for (let i = 0; i < 8; i++) {
        const mountainH: number = parseInt(readline()); // represents the height of one mountain.

        mountainHs.push(mountainH);
    }

    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    let targetH: number = 0;
    let targetId: number = 0;
    for (let i: number = 0; i < mountainHs.length; i++) {
        if (targetH < mountainHs[i]) {
            targetH = mountainHs[i];
            targetId = i;
        }
    }

    // console.log('4');     // The index of the mountain to fire on.
    console.log(targetId);
}
