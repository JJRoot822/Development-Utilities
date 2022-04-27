@echo off
echo "Initializing Git Repository..."

if exist %2 (
    echo "Going to Specified Directory..."
    goto DirectoryExists
) else (
    echo "Creating Specified Directory..."
    goto DirectoryDoesNotExist
)

:DirectoryExists
cd %2
goto init

:DirectoryDoesNotExist
mkdir %2
cd %2
goto init

:init
git init
type nul > README.md
type nul > .gitignore
git add .
git branch -M %1
git commit -m "Initial Commit"
git remote add origin %2
git push -u origin %1
goto end

:end
echo Done!
pause