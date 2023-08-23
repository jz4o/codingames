/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const S: number = parseInt(inputs[0]);
const M: number = parseInt(inputs[1]);
var inputs: string[] = readline().split(' ');
const serviceMaxclients: number[] = [];
for (let i = 0; i < S; i++) {
    const maxclients: number = parseInt(inputs[i]);
    serviceMaxclients.push(maxclients);
}
const serviceClients: number[][] = [];
for (let i = 0; i < M; i++) {
    var inputs: string[] = readline().split(' ');
    const serviceClientsRow: number[] = [];
    for (let j = 0; j < S; j++) {
        const clients: number = parseInt(inputs[j]);
        serviceClientsRow.push(clients);
    }
    serviceClients.push(serviceClientsRow);
}
let tempInstances: number[] = Array(S).fill(0);
for (let i = 0; i < M; i++) {

    // Write an answer using console.log()
    // To debug: console.error('Debug messages...');

    const serviceClientsRow: number[] = serviceClients[i];

    const instances: number[] = [...Array(serviceClientsRow.length).keys()].map(index => Math.ceil(serviceClientsRow[index] / serviceMaxclients[index]));

    const scalings: number[] = [...Array(instances.length).keys()].map(index => instances[index] - tempInstances[index]);
    tempInstances = instances;

    const result: string = scalings.join(' ');

    // console.log('Number of services to start / stop');
    console.log(result);
}
