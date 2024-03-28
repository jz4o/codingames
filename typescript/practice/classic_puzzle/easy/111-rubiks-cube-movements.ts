/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const rotations: string = readline();
const face1: string = readline();
const face2: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rotationObject: { [key: string]: { [key: string]: string } } = {
  'x': {
    'U': 'B',
    'F': 'U',
    'D': 'F',
    'B': 'D'
  },
  "x'": {
    'U': 'F',
    'F': 'D',
    'D': 'B',
    'B': 'U'
  },
  'y': {
    'L': 'B',
    'F': 'L',
    'R': 'F',
    'B': 'R'
  },
  "y'": {
    'L': 'F',
    'F': 'R',
    'R': 'B',
    'B': 'L'
  },
  'z': {
    'U': 'R',
    'L': 'U',
    'D': 'L',
    'R': 'D'
  },
  "z'": {
    'U': 'L',
    'L': 'D',
    'D': 'R',
    'R': 'U'
  }
};

const [afterFace1, afterFace2]: string[] = rotations.split(' ').reduce(([f1, f2], rotation) => {
    return [
        rotationObject[rotation][f1] || f1,
        rotationObject[rotation][f2] || f2
    ];
}, [face1, face2]);

const results: string[] = [afterFace1, afterFace2];

// console.log('face1');
// console.log('face2');
results.forEach(result => {
    console.log(result);
});
