#!/bin/bash
# Script to set up GitHub Actions for Firebase deployment

# Navigate to the project directory
cd /Users/sakshamsrivastava/my_portfolio_web

# Configure Git to use merge strategy for pulls
git config pull.rebase false

# Pull the latest changes from the remote repository
git pull

# Commit the GitHub Actions workflow file
git commit -m "Add GitHub Actions workflow for Firebase deployment"

# Push the changes to the remote repository
git push origin main

echo "GitHub Actions workflow has been pushed to the repository."
echo "Check the Actions tab in your GitHub repository to see the workflow running."
