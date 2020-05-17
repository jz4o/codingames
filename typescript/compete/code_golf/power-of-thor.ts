let [a,b,c,d]=readline().split(' ').map(i=>+i)
for(;;){let x='',y=''
a==c?0:a<c?(x='W',c--):(x='E',c++)
b==d?0:b<d?(y='N',d--):(y='S',d++)
console.log(y+x)}
