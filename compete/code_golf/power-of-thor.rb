a,b,c,d=gets.split(" ").map(&:to_i);loop{e='';(e='N';d-=2)if b<d;(e='S';d+=1)if d<b;(e+='W';c-=1)if a<c;(e+='E';c+=1)if c<a;puts e}
