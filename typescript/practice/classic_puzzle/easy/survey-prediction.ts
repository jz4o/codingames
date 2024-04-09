/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const inputAnswers: string[] = [];
for (let i = 0; i < n; i++) {
    const answer: string = readline();
    inputAnswers.push(answer);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Answer = {
    age: number,
    gender: string,
    genre: string
};

const answers: Answer[] = inputAnswers.map(inputAnswer => {
    const [strAge, gender, genre]: string[] = inputAnswer.split(' ');
    const age: number = parseInt(strAge);

    return { age, gender, genre };
});

const trainAnswers: Answer[] = answers.filter(answer => answer.genre !== undefined);
const testAnswers: Answer[] = answers.filter(answer => answer.genre === undefined);

const learningModel: { [key: string]: { [key: string]: { [key: string]: number } } } = {};
trainAnswers.forEach(answer => {
    const age: number = answer.age;
    const gender: string = answer.gender;
    const genre: string = answer.genre;

    if (!(gender in learningModel)) {
        learningModel[gender] = {};
    }

    if (!(genre in learningModel[gender])) {
        learningModel[gender][genre] = {};
        learningModel[gender][genre]['minAge'] = age;
        learningModel[gender][genre]['maxAge'] = age;
    }

    const { minAge, maxAge }: { [key: string]: number } = learningModel[gender][genre];
    learningModel[gender][genre]['minAge'] = Math.min(age, minAge);
    learningModel[gender][genre]['maxAge'] = Math.max(age, maxAge);
});

const results: string[] = testAnswers.map(answer => {
    const age: number = answer.age;
    const gender: string = answer.gender;

    const genderObject = learningModel[gender];
    if (genderObject === undefined) {
        return 'None';
    }

    const genreObject: [string, { [key: string]: number }] = Object.entries(genderObject).find(entry => {
        const [_genre, { minAge, maxAge }]: [string, { [key: string]: number }] = entry;

        return minAge <= age && age <= maxAge;
    });

    if (genreObject === undefined) {
        return 'None';
    }

    const [genre]: [string, { [key: string]: number }] = genreObject;

    return genre;
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
