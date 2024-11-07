# Computer setup

## Triggering triggering script on new computer

To trigger the script without first cloning the repository run the following 

```bash
curl -sSL https://raw.githubusercontent.com/coldb/ansible/main/ansible-run | sh
```

**Refactoring**
```bash
curl -sSL https://github.com/coldb/ansible/blob/u24-refactoring/ansible-run | sh
```

## Building docker images

If this is the first time building the script run `chmod +x build-dockers`. This will make the docker build file executable.

To build the docker images run the following command `./build-dockers`. This will build the docker images that can be used for testing the ansible scripts. 

When making updates to the files then the docker image needs to be rebuilt.

## Using the docker image

Run `./build-dockers && docker run --rm -it new-computer bash`. This will start the container and open the terminal.

Once in the terminal run `cd ~/ansible/ && ansible-playbook -t install local.yaml --ask-vault-pass`. This will trigger the install ansible install.

### Running the personal ansible playbook

Run `cd ~/personal/ansible-personal/ && ansible-playbook -t install local.yaml --ask-vault-pass`. This will trigger the ansible playbook inside the personal ansible repository.

### Install only relevant tags

To install only the relevant tags use the `-t` flag with the name of the tag to install. Example `ansible-playbook -t node local.yaml`

### Install with .ssh keys

To install the dotfiles the .ssh keys need to be installed as well. To do this the following command can be executed `ansible-playbook -t dotfiles local.yaml --ask-become-pass --ask-vault-pass`

## Setup high resolution screen support

When the computer screen has a very high resolution the i3 interface needs to be scaled to match. To enable high resolution settings run the group `i3-scaling`.
