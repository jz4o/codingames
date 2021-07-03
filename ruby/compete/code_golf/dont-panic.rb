STDOUT.sync=1
s=:to_i
def t;gets.split;end
a=t.map(&s)
i=[]
j=[]
a[7].times{k=t.map(&s);i<<k[0];j<<k[1]}
loop{l,m,n=t;m=m.to_i;o=i.index(l.to_i);q=o ?j[o]:a[4];puts (q<m&&n[0]=='L')||(m<q&&n[0]=='R')||q==m ?:WAIT: :BLOCK}
