/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const _N: number = parseInt(readline());
const V: number = parseInt(readline());
const M: number = parseInt(readline());
const inputRows: [number, number, number][] = [];
for (let i = 0; i < M; i++) {
    const inputs: string[] = readline().split(' ');
    const P: number = parseInt(inputs[0]);
    const L: number = parseInt(inputs[1]);
    const R: number = parseInt(inputs[2]);
    inputRows.push([P, L, R]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Node {
    nodeIndex: number;
    childIndexL: number;
    childIndexR: number;

    constructor(nodeIndex: number, childIndexL: number, childIndexR: number) {
        this.nodeIndex = nodeIndex;
        this.childIndexL = childIndexL;
        this.childIndexR = childIndexR;
    }

    hasChild: (nodeIndex: number) => boolean = (nodeIndex: number): boolean => {
        return [this.childIndexL, this.childIndexR].includes(nodeIndex);
    };

    direction: (childNodeINdex: number) => string = (childNodeIndex: number): string => {
        return this.childIndexL === childNodeIndex ? 'Left' : 'Right';
    };
}

const nodes: Node[] = inputRows.map(([p, l, r]) => new Node(p, l, r));

const treePath: string[] = [];

let targetNodeIndex: number = V;
let parentNode: Node;
while ((parentNode = nodes.find(node => node.hasChild(targetNodeIndex))) !== undefined) {
    treePath.unshift(parentNode.direction(targetNodeIndex));

    targetNodeIndex = parentNode.nodeIndex;
}

const result: string = treePath.length === 0 ? 'Root' : treePath.join(' ');

// console.log('tree_path');
console.log(result);
