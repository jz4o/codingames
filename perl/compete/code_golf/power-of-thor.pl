$|=1;my($a,$b,$c,$d)=split(/ /,<STDIN>);while(1){my$e;$b<$d?($d--,$e='N'):$d<$b?($d++,$e='S'):0;$a<$c?($c--,$e.='W'):$c<$a?($c++,$e.='E'):0;print "$e\n"}
