PID=`ps -ef | grep "log_proxy 15560 15561" | grep -v grep | awk '{print $2}'`
P_PID=`ps -ef | grep "log_proxy 15560 15561" | grep -v grep | awk '{print $3}'`
echo "kill $PID $P_PID"
kill $PID $P_PID

