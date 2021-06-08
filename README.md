# Description
An Ansible playbook to build Docker images.

# Requirements
* Running local Docker server
* User must be in group `docker`

## How it works
The `var/` folder contains configuration files for each image and version to be build.
The playbook loads each file individually and executes a series of tasks:

* Creates a build directory
* Copies files for the image into that directory
* Removes existing images with that specific image and version
* Builds the image

The Dockerfiles are generated via an Jinja2 template located in `templates/`.

## Configuration
The [playbook](playbook.yml) contains the configuration variables

```yaml
ansible_connection: local
ansible_interpreter_python: /usr/bin/python3
# Merge RUN commands to decrease layers
build_merge_runs: true
# Build directory location
build_build_dir: "{{ playbook_dir }}/build"
# Do not execute the docker build command
build_execute: true
# Do not remove existing docker images
build_remove: true
# Push the images after build
build_push: true
```
## Execution
```
ansible-playbook playbook.yml
```
### Author
Haydar Ciftci <haydar.ciftci@gmail.com>

### License
[MIT](LICENSE)
