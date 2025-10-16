#!/bin/bash

# Define main variables and file paths
parent="submission_remainder_*/"
star="startup.sh"
config="./submission_remainder_*/config/config.env"
continuation="y"
assignment_name="" # Stores the assignment name entered by the user

# Function to process a given assignment
copilot_function() {
    assignment="$1" # Capture the assignment name as an argument

    # Check if the required directory exists
    if [ ! -d $parent ]; then
        sleep 0.9
        echo "The directory doesn't exist. Please run the file create_environment.sh"
        echo " "
        exit 1
    else
        # Update the ASSIGNMENT variable inside the configuration file
        sed -i "s/ASSIGNMENT=\".*\"/ASSIGNMENT=\"$assignment_name\"/" $config

        echo "Processing '$assignment' assignment"

        # Navigate to the target directory and run the startup script
        cd $parent
        if [ ! -f $star ]; then
            echo "Error: $star not found."
            exit 1
        else
            ./$star  # Execute the startup script
            cd ..    # Return to the previous directory
        fi
    fi
}

# Main loop: allows multiple assignments to be processed sequentially
while [[ "$continuation" == "y" || "$continuation" == "Y" ]]; do
    echo " "
    echo "Which assignment do you want to check?"
    echo "Example options:
Shell Navigation
Shell Basics
Git"

    # Prompt user for the assignment name
    read -p "Enter the assignment name: " assignment_name

    # Run the function with the provided assignment name
    copilot_function "$assignment_name"

    echo " "
    # Ask if the user wants to process another assignment
    read -p "Do you want to analyze another assignment (y/n): " continuation
done

# Exit message after the loop finishes
echo -e "Exiting"

