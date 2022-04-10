a,b,c,d=map(int,input().split())
while 1:
 e=''
 if a<c:e='W';c-=1
 elif c<a:e='E';c+=1
 if b<d:e='N'+e;d-=1
 elif d<b:e='S'+e;d+=1
 print(e)
