NAME="Fergie Clock"
VERS="0.16"

# Specify the hours (in 24-hour format) for the clock to be muted.
# Set begin at 99 to disable
# Set end to 0 to disable

QUIET_HOUR_BEGIN=22
QUIET_HOUR_END=8
QUIET_HOUR="FALSE"

MINUTE_CHIME_FILE="./chime.wav"
HOUR_CHIME_FILE="./hour_chime.wav"
PLAY_CMD="aplay -q "

# Begin Loop
while true;
do
  HOUR24=$(date +"%-H")
  HOUR=$(date +"%-I")
  MINUTE=$(date +"%-M")
  MINUTE_MOD=$(( $MINUTE%15 ))
  SECONDS=$(date +"%-S")

if (( $HOUR24 >= $QUIET_HOUR_BEGIN )) || (( $HOUR24 <= $QUIET_HOUR_END ));
then
  QUIET_HOUR="TRUE"
else
  QUIET_HOUR="FALSE"
fi





# Clock display
  clear
  echo "$NAME v$VERS"
  echo "Quiet hours: ($QUIET_HOUR_BEGIN:00 to $QUIET_HOUR_END:00) $QUIET_HOUR"
  date +"%I:%M:%S"
  echo ""

# Top of Hour Chimes (Chimes number of hours minus one, which is contained in the "hour_chime.wav" for the last hour.
 if [ $MINUTE == 0 ] && (( $SECONDS <= 5)) && [ "$QUIET_HOUR" == "FALSE" ] ;
  then
    for (( i=1; i<$HOUR; i++ ))
    do
      $PLAY_CMD $MINUTE_CHIME_FILE
      sleep 1 
    done
    $PLAY_CMD $HOUR_CHIME_FILE
  fi


  # Plays a short chime every 15 minutes
  if [ $MINUTE_MOD == 0 ] && (( $SECONDS <= 1 )) && [ "$QUIET_HOUR" == "FALSE" ] ;
  then
    $PLAY_CMD $MINUTE_CHIME_FILE
  fi

sleep 1
done
#End Loop
