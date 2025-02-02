# Computer setup

## Triggering triggering script on new computer

To trigger the script without first cloning the repository run the following. This will install the required dependencies and clone the coldb/ansible repository. And trigger the ansible-runbook with the `install` tag. 

```bash
curl -sSL https://raw.githubusercontent.com/coldb/ansible/main/ansible-run | sh
```

## Building docker images

To build the docker images run the following command `./build-dockers`. This will build the docker images that can be used for testing the ansible scripts. 

When making updates to the files then the docker image needs to be rebuilt.

## Using the docker image

Run `./build-dockers && docker run --rm -it new-computer bash`. This will build and start the container and open the terminal.

Once in the terminal run `cd ~/ansible/ && ansible-playbook -t install local.yaml --ask-vault-pass`. This will trigger the install ansible install.

Modify the `-t` value to trigger other tags to be run (coma separated list) or run the `./run` script to use fuzzy find to find possible tags to trigger.

### Running the personal ansible playbook

Run `cd ~/personal/ansible-personal/ && ansible-playbook -t install local.yaml --ask-vault-pass`. This will trigger the ansible playbook inside the personal ansible repository.

## Setup high resolution screen support

When the computer screen has a very high resolution the i3 interface needs to be scaled to match. Use the `install-i3-scaling` or `update-i3-scaling` tags to install or update the nessesary setups.
