# Description
An Ansible playbook to build Docker images.

# Requirements
* Running local Dockerfiles server
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
The [build_host](group_vars/build_host.yml) group variables file contains configuration variables:
```yaml
# Merge RUN commands to decrease layers
build_merge_runs: true
# Build directory location
build_build_dir: "{{ playbook_dir }}/build"
# Do not execute the Docker build command
build_execute: true
# Do not remove existing Docker images
build_remove: true
```
## Execution
```
ansible-playbook -i inventory.yml playbook.yml
```
### Author
Haydar Ciftci <haydar.ciftci@gmail.com>

### License
[MIT](LICENSE)
