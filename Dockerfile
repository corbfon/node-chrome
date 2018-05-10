# Get ubuntu
FROM ubuntu:latest

# grab some necessary dependencies
RUN apt-get update
RUN apt-get install -my wget gnupg
RUN apt-get install curl -y
RUN apt-get install sudo -y

# install that nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# install chrome - don't worry about the apparent failure, it's just used to get a list of deps for apt-get -f install
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN sudo dpkg -i google-chrome-stable_current_amd64.deb || echo '\ninstall failed - but its fine we just wanted a dependency list\n'
RUN sudo apt-get -f install -y
RUN sudo dpkg -i google-chrome-stable_current_amd64.deb