a=int(input())
b=list(map(int,input().split()))
c=[t for t in b if t<0]
d=[t for t in b if t>0]
if 0 in b:e=f=0
else:
 e=max(c)if any(c)else None
 f=min(d)if any(d)else None
if a==0:g=0
elif not any(c):g=f
elif not any(d):g=e
else:g=f if e+f<=0 else e
print(g)
