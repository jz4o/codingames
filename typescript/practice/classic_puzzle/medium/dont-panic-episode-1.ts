/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const _nbFloors: number = parseInt(inputs[0], 10); // number of floors
const _width: number = parseInt(inputs[1], 10); // width of the area
const _nbRounds: number = parseInt(inputs[2], 10); // maximum number of rounds
const _exitFloor: number = parseInt(inputs[3], 10); // floor on which the exit is found
const exitPos: number = parseInt(inputs[4], 10); // position of the exit on its floor
const _nbTotalClones: number = parseInt(inputs[5], 10); // number of generated clones
const _nbAdditionalElevators: number = parseInt(inputs[6], 10); // ignore (always zero)
const nbElevators: number = parseInt(inputs[7], 10); // number of elevators
const elevatorFloors: number[] = [];
const elevatorPositions: number[] = [];
for (let i = 0; i < nbElevators; i++) {
    const inputs: string[] = readline().split(' ');
    const elevatorFloor: number = parseInt(inputs[0], 10); // floor on which this elevator is found
    const elevatorPos: number = parseInt(inputs[1], 10); // position of the elevator on its floor

    elevatorFloors.push(elevatorFloor);
    elevatorPositions.push(elevatorPos);
}

// game loop
let loopInputs: string[];
while ((loopInputs = readline().split(' ')).length !== 0) {
    // direction of the leading clone: LEFT or RIGHT
    // floor of the leading clone
    // position of the leading clone on its floor
    const [cloneFloorStr, clonePosStr, direction]: string[] = loopInputs;
    const cloneFloor: number = parseInt(cloneFloorStr, 10);
    const clonePos: number = parseInt(clonePosStr, 10);

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
        console.log('BLOCK');
    }
}

