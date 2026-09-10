/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const g: number = parseInt(inputs1[0], 10);
const e: number = parseInt(inputs1[1], 10);
const groupRows: string[] = [];
for (let i = 0; i < g; i++) {
    const group: string = readline();
    groupRows.push(group);
}
const inputs2: string[] = readline().split(' ');
const events: number[] = [];
for (let i = 0; i < e; i++) {
    const event: number = parseInt(inputs2[i], 10);
    events.push(event);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Student {
    id: number;
    groupId: number;
}

const DEQUEUEING_EVENT: number = -1;

const groups: string[][] = groupRows.map(groupRow => groupRow.split(' '));
const eventItems: (number | Student)[] = events.map(event => {
    if (event === DEQUEUEING_EVENT) {
        return DEQUEUEING_EVENT;
    } else {
        const groupId = groups.findIndex(group => group.includes(event.toString()));
        return { id: event, groupId };
    }
});

const studentQueue: Student[] = [];
const leavedStudents: Student[] = [];
eventItems.forEach(eventItem => {
    if (eventItem === DEQUEUEING_EVENT) {
        leavedStudents.push(studentQueue.shift());
        return;
    }

    const student: Student = eventItem as Student;
    const insertIndex: number = student.groupId >= 0 && studentQueue.flatMap((s, index) => s.groupId === student.groupId ? index : []).at(-1);
    if (typeof insertIndex === 'number') {
        studentQueue.splice(insertIndex + 1, 0, student);
    } else {
        studentQueue.push(student);
    }
});

const results: string[] = leavedStudents.map(student => student.id.toString());

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
