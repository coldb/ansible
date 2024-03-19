# Computer setup

## Building docker images

If this is the first time building the script run `chmod +x build-dockers`. This will make the docker build file executable.

To build the docker images run the following command `./build-dockers`. This will build the docker images that can be used for testing the ansible scripts. 

When making updates to the files then the docker image needs to be rebuilt.

## Using the docker image

Run `docker run --rm -it new-computer bash`. This will start the container and open the terminal.

Once in the terminal run `ansible-playbook local.yaml`. This will trigger the install ansible install.