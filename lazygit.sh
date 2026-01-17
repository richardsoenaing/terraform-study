#!/bin/bash

# Names to delete
FOLDER_TO_DELETE=".terraform"
FILE_TO_DELETE=".terraform.lock.hcl"

# Navigate to the directory where the script is located
cd "$(dirname "$0")" || exit 1

echo "Starting Git automation process..."

# 1. Delete all matching folders
echo "Deleting all folders named '$FOLDER_TO_DELETE'..."
find . -type d -name "$FOLDER_TO_DELETE" -prune -exec rm -rf {} +

# 2. Delete all matching files
echo "Deleting all files named '$FILE_TO_DELETE'..."
find . -type f -name "$FILE_TO_DELETE" -exec rm -f {} +

echo "Deletion completed."

# 3. Stage all changes
git add .

# 4. Prompt for a commit message
read -p "Enter Git commit message: " commit_message

# 5. Commit the changes
git commit -m "$commit_message"

# 6. Push changes
git push origin main

echo "Git process completed successfully."
