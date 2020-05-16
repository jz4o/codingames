let c=Number(readline()),ts=readline().split(' ').map(i=>Number(i)),n,p
ts.map(t=>((n||-273)<=t&&t<0)?n=t:0<t&&t<=(p||5526)?p=t:t==0?n=p=0:0)
let b=(n||0)+(p||0),r=c==0?0:!n||!p?b:b<=0?p:n
console.log(r)
