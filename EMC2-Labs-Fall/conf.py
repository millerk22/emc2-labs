# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "Fall EMC2 Labs"
copyright = "2025, Nick Andersen and EMC2 Developers"
author = "Nick Andersen and EMC2 Developers"
release = "2025"

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["myst_parser", "sphinx.ext.mathjax"]

templates_path = ["_templates"]
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "sphinx_material"
html_static_path = ["_static"]

html_title = "Math 495R EMC2 Python Labs"

html_sidebars = {
    "**": [
        "logo-text.html",
        "globaltoc.html",
        "localtoc.html",
        "searchbox.html",
    ]
}

html_theme_options = {"nav_title": "Fall EMC2 Labs"}

suppress_warnings = ["config.cache"]


# Allows for centering of figures.
# If things get messed up, this would be a good place to check.
def setup(app):
    app.add_css_file("custom.css")
