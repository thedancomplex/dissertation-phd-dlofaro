ps -eo pcpu,pid,user,args | sort -r -k1 | less | grep $(pidof hubo-daemon) | grep hubo-daemon >> huboCPU.tex

