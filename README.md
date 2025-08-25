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

# Future Features
If you are feeling really ambitious, Codebuddy can be hard to work with---especially when trying to align tasks in the `.rst` files and the ones written in Codebuddy. Codebuddy *does* have a feature where you can import/export assignments ("Import Assignment" button in the course homepage or "Export Assignment" in the assignment page) as `json` files. This means that you *could* write a program that would go through all the `.rst` files and extract out all the task instructions, and then save them to a `json` file that could be imported to Codebuddy.

Here are a few thoughts on this idea:
- If the program could handle some of the other features of Codebuddy like hints, solutions, verification code, and tests, that would be great.
    - The last three of those examples would obviously not be written in the ``rst`` files, but maybe a separate file in a separate folder that sphinx doesn't touch?
- Codebuddy can't handle $\text{LaTeX}$, but many of our tasks use $\text{LaTeX}$ in the description, perhaps a tool that could strip this out, or replace it with Markdown inline code would be nice.
    - Codebuddy also uses Markdown which is slightly different than `rst` syntax (see how bulleted lists are made in both), so handling that would be great as well.
    - The same issue occurs with code blocks in Markdown and `rst`
- Integrating this program into our `make` file would enable these `json` files to be updated every time we deployed or used `make` locally, but (as of right now) I think we would still have to import the `json` file by hand.
- having an option to `[include_previous]` (see Codebuddy task instruction for more info) would be a great feature.

This would be a lot of work and I don't know if the amount of work would be worth it. We may not even be using Codebuddy in the future. It is also possible Codebuddy improves and gets an API for importing and exporting assignments (which may make this project wortwhile).

> -EF 08/25/2025