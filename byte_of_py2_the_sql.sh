#!/bin/bash
# >> source ./byte_of_py2_the_sql.sh start
# OR      
# >> . ./byte_of_py2_the_sql.sh start
    # Sources script in current shell (instead of executing in a subshell, 
    # so that environment changes (like activating the virtual environment) will persist

# Load environment variables
source .env 
echo "Loading environment variables..."

# Get the first argument, which will be "start" or "stop"
action="$1"

# Check if the action is "start"
if [ "$action" = "start" ]; then
    echo "Activating \033[3m$VENV_NAME\033[0m virtual environment..."
    # source /Users/thenickedwards/.virtualenvs/byte_of_py2_the_sql/bin/activate
    source "$VENV_PATH"
    echo "Virtual environment \033[1m$VENV_NAME\033[0m activated."
    echo "Starting Docker containers..."
    docker-compose up -d
    echo "Docker containers started."
    echo "Opening pgAdmin at http://localhost:5433/"
    sleep 5
    open http://localhost:5433/
# Otherwise, assume the action is "stop"
else
    echo "Stopping Docker containers..."
    docker-compose stop
    echo "Deactivating $VENV_NAME virtual environment..."
    deactivate
    echo "Virtual environment $VENV_NAME deactivated."
fi