<?php fscanf(STDIN,"%d",$n);foreach(explode(" ",fgets(STDIN))as$t){$t=intval($t);$t==0?$a=$b=$t:($t<0&&($a?:-274)<$t?$a=$t:(0<$t&&$t<($b?:5527)?$b=$t:0));}echo $n==0?0:($b==null||$a==null?$b.$a:($a+$b<1?$b:$a));
