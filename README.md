# emc2-labs

Source repository for the BYU EMC2 labs.

## RST and Sphinx

The labs are written in reStructuredText (RST or reST) and compiled using Sphinx.
Check out the [RST primer](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#rst-primer) and a [guide for doing math](https://sphinx-rtd-trial.readthedocs.io/en/latest/ext/math.html) in RST.
[Sphinx](https://www.sphinx-doc.org/en/master/man/sphinx-build.html) is a Python library for converting RST files into HTML files (webpages).

### Environment Configuration

The file [`config/environment.yml`](./config/deployment.svg) contains the [conda](https://anaconda.org/anaconda/conda) environment configuration used when compiling the labs.
Create the environment from scratch:

```bash
conda deactivate
conda env create -f config/environment.yml
conda activate emc2_dev
```

Or, update an existing environment:

```bash
conda deactivate
conda env update -n emc2_dev -f config/environment.yml
conda activate emc2_dev
```

### Compiling the Labs Locally

The fall and winter labs are stored in separate folders, each of which has a `Makefile` with the sphinx compilation recipes.

```bash
cd EMC2-Labs-Fall
make html
open _build/html/index.html  # Open the compiled labs in a browser.
```

## Deploying Compiled Code to emc2.byu.edu

In order for the labs to show up on the EMC2 website, we need to compile the labs to HTML and move them to the right server.
First, create a file named `server_config.env` in the directory `emc2_labs/config`. It should contain the following:

```txt
EMC2_USER=<username>
EMC2_PATH=<path_to_emc2_labs>
MATH_PATH=<path_to_emc2_labs>
```

Here, everything in `<>` should be replaced with the actual values (get these from the current leader of the project). Note that the `EMC2_PATH` and the `MATH_PATH` are different.

Run `initiate_deploy.sh` with the options -f, -w, or -a (for fall, winter, or all)

If this doesn't work, `initiate_deploy.sh` may not have permission to execute. You can fix this with

```bash
chmod +x initiate_deploy.sh
```

> [!WARNING]
> `config/build_and_deploy.sh` should never be run from your machine.

> [!NOTE]
> The SSH protocol requires three things, the username, hostname, and password. The username and hostname are usually paired together like `<username>@<hostname>`. When this script asks for the username, only put in the actual `username` and not the username-hostname pair.

### Behind the Scenes

Running [`initiate_deploy.sh`](./initiate_deploy.sh) accesses the emc2 server (and make sure you have an ssh key to get in) and calls `config/build_and_deploy.sh`, which pulls everything, compiles the labs, then copies all the resulting HTML files to [emc2.byu.edu](https://emc2.byu.edu/).

![](./config/deployment.svg)

## Future Features

### Codebuddy

If you are feeling really ambitious, Codebuddy can be hard to work with---especially when trying to align tasks in the `.rst` files and the ones written in Codebuddy. Codebuddy *does* have a feature where you can import/export assignments ("Import Assignment" button in the course homepage or "Export Assignment" in the assignment page) as `json` files. This means that you *could* write a program that would go through all the `.rst` files and extract out all the task instructions, and then save them to a `json` file that could be imported to Codebuddy.

Here are a few thoughts on this idea:

- If the program could handle some of the other features of Codebuddy like hints, solutions, verification code, and tests, that would be great.
  - The last three of those examples would obviously not be written in the ``rst`` files, but maybe a separate file in a separate folder that sphinx doesn't touch?
- Codebuddy can't handle $\text{LaTeX}$, but many of our tasks use $\text{LaTeX}$ in the description, perhaps a tool that could strip this out, or replace it with Markdown inline code would be nice.
  - Codebuddy also uses Markdown which is slightly different than `rst` syntax (see how bulleted lists are made in both), so handling that would be great as well.
  - The same issue occurs with code blocks in Markdown and `rst`
- Integrating this program into our `make` file would enable these `json` files to be updated every time we deployed or used `make` locally, but (as of right now) I think we would still have to import the `json` file by hand.
- having an option to `[include_previous]` (see Codebuddy task instruction for more info) would be a great feature.

This would be a lot of work and I don't know if the amount of work would be worth it. We may not even be using Codebuddy in the future. It is also possible Codebuddy improves and gets an API for importing and exporting assignments (which may make this project worthwhile).

### Live Code Cells

Sphinx allows for extnesions that enable live code execution. This can be really useful for students who want a more interactive experience, but has some development costs.

Positives:

- Allows students to play with the code themselves
- More of an interactive experience, easier to see how Python works directly.
- Runs quickly
- The developer does not have to write the output of the python code, it is executed when sphinx compiles everything.
Negatives:
- We may have to change Fall Lab 1 with how we introduce python and how we introduce the idea of cells.
- The backend software needs to create a bunch of Backend images which takes 5 to 10 minutes. If we implemented this, we would probably want to add something to the deployment script to deploy to the website only after the Docker images are created.
- We would need to change all of the code cells to a different format, which would take time, but wouldn't be that intense.
Other:
- After playing with code, a simple refresh brings it back to the original state, which can be good or bad.
- Cells act just like a jupyter notebook where variables are retained over cells. This may cause a problem if we had previously redefined variables in labs and a student ran cells out of order. We would have to check for that.

The following [GitHub repository](https://github.com/EliFarrer/sphinx_thebe) is a small example of how this can be done.
