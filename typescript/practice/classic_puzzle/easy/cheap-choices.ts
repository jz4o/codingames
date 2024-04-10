/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const c: number = parseInt(readline());
const p: number = parseInt(readline());
const items: string[] = [];
for (let i = 0; i < c; i++) {
    const item: string = readline();
    items.push(item);
}
const orders: string[] = [];
for (let i = 0; i < p; i++) {
    const order: string = readline();
    orders.push(order);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const inventory: { [key: string]: number[] } = {};
items.forEach(item => {
    const [category, size, priceStr]: string[] = item.split(' ');
    const price: number = parseInt(priceStr);

    const key: string = `${category} ${size}`;
    if (!(key in inventory)) {
        inventory[key] = [];
    }
    inventory[key].push(price);
});
Object.values(inventory).forEach(v => v.sort());

const results: string[] = orders.map(order => {
    return inventory[order]?.shift()?.toString() || 'NONE';
});

// console.log('NONE');
results.forEach(result => {
    console.log(result);
});
