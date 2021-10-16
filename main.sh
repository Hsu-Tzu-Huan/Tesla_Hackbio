# Team tesla

# clone the git hub repository
git clone https://github.com/Hsu-Tzu-Huan/Tesla_Hackbio.git

# download all required package
sudo apt-get -y install git
sudo apt-get -y install php
sudo apt-get -y install python3
sudo apt-get -y install clang
sudo apt-get -y install nodejs
sudo apt-get -y install r-base

# move into the repo folder
cd Tesla_Hackbio

# list all files in the repo, loop through them and execute conditionally
files=$(ls *)
sudo rm -rf tesla.csv
touch tesla.csv
echo "name, email, slack_username, biostack" >> tesla.csv

for file in $files
do
    # split files based on extension
    filename=$(basename -- $file)
    extension=${filename##*.}
    filename=${filename%.*}

    # execute based on extension and write information to txt file
    case $extension in
    "html")
        echo "Executing html file"
        google-chrome $file >> tesla.csv
        ;;
    "py")
        echo "Executing python file"
        python3 $file >> tesla.csv
        ;;
    "js")
        echo "Executing javascript file"
        node $file >> tesla.csv
        ;;
    "cpp")
        echo "Executing C++ file"
        clang -o $filename $file
        ./$filename >> tesla.csv
        ;;
    "java")
        echo "Executing Java file"
        javac $file
        java $filename >> tesla.csv
        ;;
    "R")
        echo "Executing R file"
        Rscript $file >> tesla.csv
        ;;

    esac

done

# open the file
xdg-open ./tesla.csv