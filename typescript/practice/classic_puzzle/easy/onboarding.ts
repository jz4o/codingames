// game loop
while (true) {
    const enemy1: string = readline(); // name of enemy 1
    const dist1: number = parseInt(readline()); // distance to enemy 1
    const enemy2: string = readline(); // name of enemy 2
    const dist2: number = parseInt(readline()); // distance to enemy 2

    // Write an action using console.log()

    // Enter the code here

    if (dist1 < dist2) {
        console.log(enemy1);
    } else {
        console.log(enemy2);
    }
}
