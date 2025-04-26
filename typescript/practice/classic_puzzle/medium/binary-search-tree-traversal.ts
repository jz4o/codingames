/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const inputs: string[] = readline().split(' ');
const vis: number[] = [];
for (let i = 0; i < n; i++) {
    const vi: number = parseInt(inputs[i]);
    vis.push(vi);
}
// for (let i = 0; i < 4; i++) {
//
//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');
//
//     console.log('answer');
// }

class Tree {
    root: Node;

    constructor(values: number[]) {
        const dupValues: number[] = [...values];
        this.root = new Node(dupValues.shift());

        dupValues.forEach(value => this.root.addNode(value));
    }

    preOrderValues: () => number[] = (): number[] => {
        return this.root.preOrderValues();
    };

    inOrderValues: () => number[] = (): number[] => {
        return this.root.inOrderValues();
    };

    postOrderValues: () => number[] = (): number[] => {
        return this.root.postOrderValue();
    };

    levelOrderValues: () => number[] = (): number[] => {
        const values: number[] = [];
        let targetLevelNodes: Node[] = [this.root];
        while (targetLevelNodes.length > 0) {
            values.push(...targetLevelNodes.map(node => node.value));
            targetLevelNodes = targetLevelNodes.flatMap(node => {
                return [node.left, node.right].filter(child => child !== null);
            });
        }

        return values;
    };
}

class Node {
    value: number;
    left: Node;
    right: Node;

    constructor(value: number) {
        this.value = value;
        this.left = null;
        this.right = null;
    }

    addNode: (value: number) => void = (value: number): void => {
        if (value < this.value && this.left !== null) {
            this.left.addNode(value);
        }
        if (value < this.value && this.left === null) {
            this.left = new Node(value);
        }
        if (this.value < value && this.right !== null) {
            this.right.addNode(value);
        }
        if (this.value < value && this.right === null) {
            this.right = new Node(value);
        }
    };

    preOrderValues: () => number[] = (): number[] => {
        return [
            this.value,
            ...(this.left?.preOrderValues() || []),
            ...(this.right?.preOrderValues() || [])
        ];
    };

    inOrderValues: () => number[] = (): number[] => {
        return [
            ...(this.left?.inOrderValues() || []),
            this.value,
            ...(this.right?.inOrderValues() || [])
        ];
    };

    postOrderValue: () => number[] = (): number[] => {
        return [
            ...(this.left?.postOrderValue() || []),
            ...(this.right?.postOrderValue() || []),
            this.value
        ];
    };
}

const tree: Tree = new Tree(vis);

const results: string[] = [
    tree.preOrderValues().join(' '),
    tree.inOrderValues().join(' '),
    tree.postOrderValues().join(' '),
    tree.levelOrderValues().join(' ')
];

results.forEach(result => {
    console.log(result);
});
