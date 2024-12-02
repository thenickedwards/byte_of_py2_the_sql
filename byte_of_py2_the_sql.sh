#!/bin/bash
# . ./byte_of_py2_the_sql.sh     OR source ./byte_of_py2_the_sql.sh
# By sourcing the script in your current shell instead of executing it in a subshell, the environment changes (like activating the virtual environment) will persist.
# ./byte_of_py2_the_sql.sh       OR ./byte_of_py2_the_sql.sh stop     OR . ./byte_of_py2_the_sql.sh    OR source ./byte_of_py2_the_sql.sh

# Get the first argument, which will be "start" or "stop"
action="$1"

# Check if the action is "start"
if [ "$action" = "start" ]; then
    echo "Activating \033[3mbyte_of_py2_the_sql\033[0m virtual environment..."
    source /Users/thenickedwards/.virtualenvs/byte_of_py2_the_sql/bin/activate
    echo "Virtual environment \033[1mbyte_of_py2_the_sql\033[0m activated."
    echo "Starting Docker containers..."
    docker-compose up -d
    echo "Docker containers started."
# Otherwise, assume the action is "stop"
else
    echo "Stopping Docker containers..."
    docker-compose stop
    echo "Deactivating virtual environment..."
    deactivate
    echo "Virtual environment deactivated."
fi