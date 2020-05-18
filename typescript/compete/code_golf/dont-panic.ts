let r=()=>readline(),[,,,,a,,,b]=r().split(' ').map(i=>+i),c=[],d=[]
for(let i=0;i<b;i++){
let [e,f]=r().split(' ').map(i=>+i)
c.push(e)
d.push(f)}
for(;;){var g=r().split(' '),h=+g[1],j=g[2],k=c.indexOf(+g[0]),l=k>=0?d[k]:a
console.log(((l<h&&j[0]=='L')||(h<l&&j[0]=='R')||l==h)?'WAIT':'BLOCK')}
