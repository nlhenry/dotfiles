#Open up a terminal window and install homebrew with the following command:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#After installing, add it to the path (replace ”[username]” with your actual username):
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/nikolus.henry/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
