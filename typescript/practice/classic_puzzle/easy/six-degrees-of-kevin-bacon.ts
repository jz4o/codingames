/**
 * 6 Degrees of Kevin Bacon!
 **/

const actorName: string = readline();
const n: number = parseInt(readline());
const movieCasts: string[] = [];
for (let i = 0; i < n; i++) {
    const movieCast: string = readline();
    movieCasts.push(movieCast);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const kevin: string = 'Kevin Bacon';

const castsArray: string[][] = movieCasts.map(movieCast => {
    const [_movieName, casts]: string[] = movieCast.split(': ');

    return casts.split(', ');
});

let targetCasts: string[] = [actorName];
let baconNumber: number = 0;
while (!targetCasts.includes(kevin)) {
    baconNumber++;

    const nextTargetCasts = castsArray.flatMap(casts => {
        const isFoundTargetCast: boolean = targetCasts.some(target => casts.includes(target));

        return isFoundTargetCast ? casts : [];
    });

    targetCasts = nextTargetCasts;
}

const result: string = baconNumber.toString();

// console.log('N degrees to Kevin Bacon');
console.log(result);
