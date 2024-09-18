#!/bin/bash

LINE=( $(cat roster.txt) )
LOGFILE=ga2ex11-log.log

# Loop through the array's contents
for name in "${LINE[@]}"; do
    # Check if the directory already exists
    if [ -d "/home/$name" ]; then
        echo "User $name already exists. skipping.." | tee -a $LOGFILE
        continue
    else
        sudo useradd -c "Account for $name" -s /usr/bin/bash -d /home/$name -m $name
        echo "$date User $name created successfully."  | tee -a $LOGFILE
    fi
# Run the command to create a directory named .ssh owned by the user
    sudo mkdir /home/$name/.ssh
    
    # Check if the owner of the directory is correct
    echo "Checking ownership of /home/$name/.ssh" | tee -a $LOGFILE
    if [[ -O "/home/$name/.ssh" ]]; then
       echo "$name is owner of /home/$name/.ssh" | tee -a $LOGFILE
       if [ -z "$( ls -A '/home/$name/.ssh' )" ]; then
            echo "SSH keys not found" | tee -a $LOGFILE
            echo "Generating SSH key for $name" | tee -a $LOGFILE
            sudo ssh-keygen -t ed25519 -f /home/$name/.ssh/id_ed25519_$name -N ""
            sudo chown -R $name:vagrant /home/$name/.ssh
            sudo chmod 700 /home/$name/.ssh
        else
            echo "SSH keys found, skipping key generation" | tee -a $LOGFILE
       fi
    else
        echo "User $name is not a owner" | tee -a $LOGFILE
    fi
    
done


