/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const nbFloors: number = parseInt(inputs[0]); // number of floors
const width: number = parseInt(inputs[1]); // width of the area
const nbRounds: number = parseInt(inputs[2]); // maximum number of rounds
const exitFloor: number = parseInt(inputs[3]); // floor on which the exit is found
const exitPos: number = parseInt(inputs[4]); // position of the exit on its floor
const nbTotalClones: number = parseInt(inputs[5]); // number of generated clones
const nbAdditionalElevators: number = parseInt(inputs[6]); // ignore (always zero)
const nbElevators: number = parseInt(inputs[7]); // number of elevators
const elevatorFloors: number[] = [];
const elevatorPositions: number[] = [];
for (let i = 0; i < nbElevators; i++) {
    var inputs: string[] = readline().split(' ');
    const elevatorFloor: number = parseInt(inputs[0]); // floor on which this elevator is found
    const elevatorPos: number = parseInt(inputs[1]); // position of the elevator on its floor

    elevatorFloors.push(elevatorFloor);
    elevatorPositions.push(elevatorPos);
}

// game loop
while (true) {
    var inputs: string[] = readline().split(' ');
    const cloneFloor: number = parseInt(inputs[0]); // floor of the leading clone
    const clonePos: number = parseInt(inputs[1]); // position of the leading clone on its floor
    const direction: string = inputs[2]; // direction of the leading clone: LEFT or RIGHT

    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    const elevatorIndex: number = elevatorFloors.indexOf(cloneFloor);
    const target: number = elevatorIndex >= 0 ? elevatorPositions[elevatorIndex] : exitPos;

    const isAlreadyFacingLeftTarget: boolean = target < clonePos && direction === 'LEFT';
    const isAlreadyFacingRightTarget: boolean = clonePos < target && direction === 'RIGHT';

    // console.log('WAIT');     // action: WAIT or BLOCK
    if (isAlreadyFacingLeftTarget || isAlreadyFacingRightTarget || target === clonePos) {
        console.log('WAIT');
    } else {
        console.log('BLOCK')
    }
}
