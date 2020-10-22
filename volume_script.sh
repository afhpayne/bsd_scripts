vol=$(mixer | awk 'NR==1{print substr ($7,1,3)}');
if [ $vol != 100 ];
then pcm="MUTE";
else pcm=$(mixer | awk 'NR==2{print substr($7,1,2)"%"}');
fi
echo $pcm
