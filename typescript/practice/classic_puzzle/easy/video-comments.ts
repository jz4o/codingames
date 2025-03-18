/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const comments: string[] = [];
for (let i = 0; i < n; i++) {
    const comment: string = readline();
    comments.push(comment);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Comment {
    origin: string;
    userName: string;
    date: number;
    likes: number;
    priority: number;
    index: number;
    parentIndex: number | null;

    constructor(commentStr: string, index: number) {
        const [userName, dateStr, likesStr, priorityStr]: string[] = commentStr.split('|');
        const date: number = parseInt(dateStr.replace(':', ''));
        const likes: number = parseInt(likesStr);
        const priority: number = ['Pinned', 'Followed', 'none'].indexOf(priorityStr);

        this.origin = commentStr;
        this.userName = userName;
        this.date = date;
        this.likes = likes;
        this.priority = priority;
        this.index = index;
        this.parentIndex = null;
    }

    static sort: (comments: Comment[]) => Comment[] = (comments: Comment[]): Comment[] => {
        const sortedComments: Comment[] = [...comments];
        sortedComments.sort((a, b) => {
            if (a.priority !== b.priority) {
                return a.priority - b.priority;
            }

            if (a.likes !== b.likes) {
                return b.likes - a.likes;
            }

            if (a.date !== b.date) {
                return b.date - a.date;
            }

            return a.index - b.index;
        });

        return sortedComments;
    };
}

const allComments: Comment[] = comments.map((comment, index) => new Comment(comment, index));

let parentIndex: number | null = null;
allComments.forEach(comment => {
    if (comment.userName.startsWith(' '.repeat(4))) {
        comment.parentIndex = parentIndex;
    } else {
        parentIndex = comment.index;
    }
});

const originComments: Comment[] = allComments.filter(comment => comment.parentIndex === null);
const replyComments: Comment[] = allComments.filter(comment => comment.parentIndex !== null);

const resultComments: Comment[] = Comment.sort(originComments).flatMap(originComment => {
    const targetReplyComments: Comment[] = replyComments.filter(comment => comment.parentIndex === originComment.index);
    const sortedReplyComments: Comment[] = Comment.sort(targetReplyComments);

    return [originComment, ...sortedReplyComments];
});

const results: string[] = resultComments.map(comment => comment.origin);

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
