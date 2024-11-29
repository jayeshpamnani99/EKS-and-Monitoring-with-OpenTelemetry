#!/bin/bash

# Base directory containing application subfolders
base_dir="/Users/manavgupta/Library/CloudStorage/OneDrive-UniversityofMaryland/UMD Courses/Sem 3/ENPM 818N Cloud Computing/endsem/cloud818n-group11-endsem/kubernetes/otel-demo-yaml/08-application"

# Check if the base directory exists
if [[ ! -d "$base_dir" ]]; then
    echo "Base directory $base_dir does not exist!"
    exit 1
fi

# Loop through each subfolder in the base directory
for service_dir in "$base_dir"/*; do
    # Ensure it's a directory
    if [[ -d "$service_dir" ]]; then
        echo "Processing directory: $service_dir"

        # Initialize the numbering
        count=1

        # Remove existing numbers from filenames (if any)
        for file in "$service_dir"/*; do
            if [[ -f "$file" ]]; then
                # Strip the leading number and dash from the filename
                new_name=$(echo "$(basename "$file")" | sed -E 's/^[0-9]+-//')
                mv "$file" "$service_dir/$new_name"
            fi
        done

        # Rename configmap file (if exists)
        for file in "$service_dir"/*configmap.yaml; do
            if [[ -f "$file" ]]; then
                new_name="$service_dir/$(printf "%02d" $count)-$(basename "$file")"
                mv "$file" "$new_name"
                echo "Renamed $(basename "$file") to $(basename "$new_name")"
                ((count++))
            fi
        done

        # Rename service file (if exists)
        for file in "$service_dir"/*service.yaml; do
            if [[ -f "$file" ]]; then
                new_name="$service_dir/$(printf "%02d" $count)-$(basename "$file")"
                mv "$file" "$new_name"
                echo "Renamed $(basename "$file") to $(basename "$new_name")"
                ((count++))
            fi
        done

        # Rename deployment file (if exists)
        for file in "$service_dir"/*deployment.yaml; do
            if [[ -f "$file" ]]; then
                new_name="$service_dir/$(printf "%02d" $count)-$(basename "$file")"
                mv "$file" "$new_name"
                echo "Renamed $(basename "$file") to $(basename "$new_name")"
                ((count++))
            fi
        done
    fi
done

echo "Renaming completed!"
