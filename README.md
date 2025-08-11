# emc2-labs
Repo for making changes to BYU EMC2 labs.


### Notes on RST and Sphinx 

Check out the rst primer [here](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#rst-primer). Also check out the [following for doing math](https://sphinx-rtd-trial.readthedocs.io/en/latest/ext/math.html) in rst.

To compile sphinx code, check out their [main build page](https://www.sphinx-doc.org/en/master/man/sphinx-build.html). Mainly comes down to the following:

`sphinx-build -M html sourcedir outputdir`

### Configure your environment
1) run `conda env create -f environment.yml`. This will install all the necessary libraries to run sphinx and create a conda environment for you. Activate it using `conda activate emc2_dev`.

# Deploying the Compiled Code to emc2.byu.edu
Run initiate_deploy.sh with the options -f, -w, or -a (for fall, winter, or all)

Usage: `initiate_deploy.sh [f|w|a]`

If this doesn't work, `initiate_deploy.sh` may not have permission to execute. You can fix this with

`chmod +x initiate_deploy.sh`

This script will access the emc2 server (and make sure you have an ssh key to get in) and call `build_and_deploy.sh` which pulls everything, recompiles, then copies all the changes over to `emc2.byu.edu`.