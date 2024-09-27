#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")
count=0

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $WINNER != winner || $OPPONENT != opponent ]]
  then
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_INTO_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      echo Inserted into teams, $WINNER as $count
      ((count=count+1))
    fi

    TEAM_ID_2=$($PSQL "SELECT team_id from teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM_ID_2 ]]
    then
      INSERT_INTO_TEAMS_2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      echo Inserted into teams, $OPPONENT as $count
      ((count=count+1))
    fi

    TEAM_A=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    TEAM_B=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$TEAM_A,$TEAM_B,$WINNER_GOALS,$OPPONENT_GOALS)")
    echo Inserted into games, $TEAM_A vs $TEAM_B in $YEAR with $WINNER_GOALS:$OPPONENT_GOALS  
  fi
  
done
