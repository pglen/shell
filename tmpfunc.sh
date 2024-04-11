tmpname()
{
local CNT=0
local TMPNAME=/root/tmp

while [ 1 == 1 ] ; do
  if [ -f $TMPNAME$CNT ]; then
	((CNT++))
   else
	echo "Got tmp name '$TMPNAME$CNT'"
	${1}=$TMPNAME$CNT
	return 0
  fi
done
}


