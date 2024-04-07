# Computer setup

## Building docker images

If this is the first time building the script run `chmod +x build-dockers`. This will make the docker build file executable.

To build the docker images run the following command `./build-dockers`. This will build the docker images that can be used for testing the ansible scripts. 

When making updates to the files then the docker image needs to be rebuilt.

## Using the docker image

Run `./build-dockers && docker run --rm -it new-computer bash`. This will start the container and open the terminal.

Once in the terminal run `ansible-playbook local.yaml`. This will trigger the install ansible install.

### Install only relevant tags

To install only the relevant tags use the `-t` flag with the name of the tag to install. Example `ansible-playbook -t node local.yaml`

### Install with .ssh keys

To install the dotfiles the .ssh keys need to be installed as well. To do this the following command can be executed `ansible-playbook -t dotfiles local.yaml --ask-become-pass --ask-vault-pass`