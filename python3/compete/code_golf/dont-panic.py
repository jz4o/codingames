_,_,_,_,a,_,_,b=map(int,input().split())
c,d=[],[]
for i in range(b):e,f=map(int,input().split());c.append(e);d.append(f)
while 1:g,h,i=input().split();g,h=map(int,[g,h]);j=c.index(g)if g in c else-1;k=d[j]if j!=-1else a;print('WAIT'if(k<h and i[0]=='L')or(h<k and i[0]=='R')or k==h else'BLOCK')
