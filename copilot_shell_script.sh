#!/bin/bash

parent_dir="submission_remainder_*/"
star="startup.sh"
config="./submission_remainder_*/config/config.env"
continuation="y"
assignment_name="" # Initialize the variable to hold the user's input

copilot_function() {
    # The assignment name is passed as the first argument
    assignment="$1"

    if [ ! -d $parent_dir ]; then
        sleep 0.9
        echo "The directory doesn't exist. Please run the file create_environment.sh"
        echo " "
        exit 1
    else
        sed -i "s/ASSIGNMENT=\".*\"/ASSIGNMENT=\"$assignment_name\"/" $config

        echo "Processing '$assignment' assignment"

 cd $parent_dir
        if [ ! -f $star ]; then
            echo "Error: $star not found."
            exit 1
        else
            ./$star
            cd ..
        fi
    fi
}

while [[ "$continuation" == "y" || "$continuation" == "Y" ]]; do
    echo " "
    echo "Which assignment do you want to check?"
    echo "Example options:
Shell Navigation
Shell Basics
Git"

    # Capture user input for the assignment name
    read -p "Enter the assignment name: " assignment_name

# Read the assignment name directly into assignment_name
    read -p "Enter the assignment name: " assignment_name

    # Run the function using the name provided by the user
    copilot_function "$assignment_name"

    echo " "
    read -p "Do you want to analyze another assignment (y/n): " continuation
done

echo -e "Exiting"
