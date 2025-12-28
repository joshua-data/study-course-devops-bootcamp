### Install stress package onto the instance.

```bash
dnf install stress -y
```

### Write a bash script in order to do a random stress test. (vim stress.sh)

```bash
#!/bin/bash

while true; do

    # Pick a random session duration (60s to 5 mins)
    SESSION_DUARTION=$((60 + RANDOM % 241))
    echo "Starting stress session for $SESSION_DURATION seconds..."
    SESSION_END=$((SECOND + SESSION_DUARTION))
    
    while [ $SECONDS -lt $SESSION_END ]; do
        echo "Running stress at $(date)"
        stress -c 11 -t 5
        # Pick a random interval before next run (5s to 20s)
        SLEEP_TIME=$((5 + RANDOM % 16))
        echo "Sleeping $SLEEP_TIME seconds before next stress..."
        sleep $SLEEP_TIME
    done

    # Optional: Random cooldown before next session
    COOLDOWN=$((30 + RANDOM % 61))
    echo "Session ended. Cooling down for $COOLDOWN seconds..."
    sleep $COOLDOWN
done
```

### Run the bash script.

```bash
chmod u+x stress.sh
./stress.sh
```

### Stop the command and let's run it in a detached session.

```bash
nohup ./stress.sh & 
```