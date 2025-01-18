/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const M: number = parseInt(readline());
const invoices: number[] = [];
for (let i = 0; i < N; i++) {
    const invoice: number = parseInt(readline());
    invoices.push(invoice);
}
const paymentEntries: number[] = [];
for (let i = 0; i < M; i++) {
    const paymentEntry: number = parseInt(readline());
    paymentEntries.push(paymentEntry);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

class LabeledPayment {
    label: string;
    payment: number;
    invoices: number[];

    constructor(label: string, payment: number) {
        this.label = label;
        this.payment = payment;
        this.invoices = [];
    }

    setInvoices: (invoices: number[]) => void = (invoices: number[]): void => {
        this.invoices = invoices;
    };

    isMatched: () => boolean = (): boolean => {
        return this.invoices.length > 0;
    };

    toString: () => string = (): string => {
        return [this.label, this.payment, '-', ...this.invoices].join(' ');
    };
}

const labels: string[] = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
const labeledPayments = zip(labels.slice(0, paymentEntries.length), paymentEntries).map(([label, payment]) => {
    return new LabeledPayment(label, payment);
});

const invoiceStack: number[] = [];
invoices.forEach(invoice => {
    invoiceStack.push(invoice);
    const sumInvoice: number = invoiceStack.reduce((sum, invoice) => sum + invoice, 0);

    const matchedPayment: LabeledPayment | undefined = labeledPayments.find(labeledPayment => {
        return !labeledPayment.isMatched() && labeledPayment.payment === sumInvoice;
    });
    if (matchedPayment === undefined) {
        return;
    }

    matchedPayment.setInvoices([...invoiceStack]);
    invoiceStack.splice(0);
});

const results: string[] = labeledPayments.map(labeledPayment => labeledPayment.toString());

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
