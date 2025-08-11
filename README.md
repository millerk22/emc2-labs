# emc2-labs
Repo for making changes to BYU EMC2 labs.

### Notes on RST and Sphinx 

Check out the rst primer [here](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#rst-primer). Also check out the [following for doing math](https://sphinx-rtd-trial.readthedocs.io/en/latest/ext/math.html) in rst.

To compile sphinx code, check out their [main build page](https://www.sphinx-doc.org/en/master/man/sphinx-build.html). Mainly comes down to the following:

`sphinx-build -M html sourcedir outputdir`

### Configure your environment
1) run `conda env create -f config/environment.yml`. This will install all the necessary libraries to run sphinx and create a conda environment for you. Activate it using `conda activate emc2_dev`.

# Deploying the Compiled Code to emc2.byu.edu
## Prerequisites
A file named `server_config.env` should be in the directory `emc2_labs` (on the same level as the deployment scripts). It should contain:

```
EMC2_USER=<username>
EMC2_PATH=<path_to_emc2_labs>
MATH_PATH=<path_to_emc2_labs>
```

Where everyting in `<>` should be replaced with the actual values. Note that the `EMC2_PATH` and the `MATH_PATH` are different.

## Usage
Run `initiate_deploy.sh` with the options -f, -w, or -a (for fall, winter, or all)

Usage: `initiate_deploy.sh [f|w|a]`

If this doesn't work, `initiate_deploy.sh` may not have permission to execute. You can fix this with

`chmod +x initiate_deploy.sh`

> [!WARNING]
> `config/build_and_deploy.sh` should never be run from your machine.

> [!NOTE]
> The SSH protocol requires three things, the username, hostname, and password. The username and hostname are usually paired together like `<username>@<hostname>`. When this script asks for the username, only put in the actual `username` and not the username-hostname pair.

## Behind the Scenes
`initiate_deploy.sh` will access the emc2 server (and make sure you have an ssh key to get in) and call `config/build_and_deploy.sh` which pulls everything, recompiles, then copies all the changes over to `emc2.byu.edu`.

![](./config/deployment.svg)