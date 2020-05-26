a,b,c,d=gets.split.map &:to_i
loop{puts (b<d ?(d-=1;'N'):d<b ?(d+=1;'S'):'')+(a<c ?(c-=1;'W'):c<a ?(c+=1;'E'):'')}
