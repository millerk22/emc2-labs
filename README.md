# emc2-labs
Repo for making changes to BYU EMC2 labs.

### Notes on RST and Sphinx 

Check out the rst primer [here](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#rst-primer). Also check out the [following for doing math](https://sphinx-rtd-trial.readthedocs.io/en/latest/ext/math.html) in rst.

To compile sphinx code, check out their [main build page](https://www.sphinx-doc.org/en/master/man/sphinx-build.html). Mainly comes down to the following:

`sphinx-build -M html sourcedir outputdir`

### Configure your environment
1) run `conda env create -f config/environment.yml`. This will install all the necessary libraries to run sphinx and create a conda environment for you. Activate it using `conda activate emc2_dev`.

# Development
To develop the labs without Deploying each time, install the [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.Live Server) extension which can display the compiled html code on your browser.

To recompile with sphinx, run `make html` in either `EMC2-Labs-Fall` or `EMC2-Labs-Winter` and it will compile the associated html.

Once you have the extension installed, and have compiled new html code, click "Go Live" at the bottom right of your screen (see Live Server's documentation for more info) and Live Server will open a web browser window. Navigate to the `_build/html` directory from that window and it will display the labs as they have been created.

Live Server will automatically update this page whenever you use `make html`.

# Deploying the Compiled Code to emc2.byu.edu
## Prerequisites
Create a file named `server_config.env` in the directory `emc2_labs/config`. It should contain:

```
EMC2_USER=<username>
EMC2_PATH=<path_to_emc2_labs>
MATH_PATH=<path_to_emc2_labs>
```

Where everything in `<>` should be replaced with the actual values (get these from the current leader of the project). Note that the `EMC2_PATH` and the `MATH_PATH` are different.

## Usage
Run `initiate_deploy.sh` with the options -f, -w, or -a (for fall, winter, or all)

Usage: `initiate_deploy.sh -[f|w|a]`

If this doesn't work, `initiate_deploy.sh` may not have permission to execute. You can fix this with

`chmod +x initiate_deploy.sh`

> [!WARNING]
> `config/build_and_deploy.sh` should never be run from your machine.

> [!NOTE]
> The SSH protocol requires three things, the username, hostname, and password. The username and hostname are usually paired together like `<username>@<hostname>`. When this script asks for the username, only put in the actual `username` and not the username-hostname pair.

## Behind the Scenes
`initiate_deploy.sh` will access the emc2 server (and make sure you have an ssh key to get in) and call `config/build_and_deploy.sh` which pulls everything, recompiles, then copies all the changes over to `emc2.byu.edu`.

![](./config/deployment.svg)