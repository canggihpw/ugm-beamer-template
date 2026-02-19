# UGM Beamer Template
This repository provides an **unofficial** custom Beamer template built with LaTeX, offering a powerful and versatile alternative to traditional presentation software like PowerPoint. While inspired by the [original template from UGM](https://brand.ugm.ac.id/downloads/), this template leverages the many advantages of LaTeX.

# Features
* Easy Content Management: Place your presentation content in the contents directory. The main structure is defined in main.tex.
* Themed Presentations: Choose from pre-defined themes in the themes directory.
* Customizable: Feel free to modify existing themes or create your own by adding them to the themes directory.
* Open to Contribution: We welcome pull requests to improve the template and add functionalities.

# Directory Structure
The repository is organized with the following directories:

* build: This directory is automatically generated during the compilation process. Users shouldn't modify files here.
* contents: Place your presentation content (text, figures, etc.) in separate .tex files within this directory.
* fonts: This directory contains any additional fonts used by the template.
* helper: Helper functions or macros used by the template reside here.
* themes: Pre-defined themes for your presentations are located here. You can add custom themes to this directory.
* contents/sample.tex: This file provides a sample presentation structure you can adapt for your own content.
* main.tex: This file defines the main structure of the presentation and includes your content from the contents directory.
* latexmkrc: This file provides a sample configuration for compiling the presentation using Latexmk (optional).

# Getting Started
* Clone the Repository: Use git clone https://github.com/canggihpw/ugm-beamer-template.git to clone this repository.
* Edit Content: Add your presentation content in separate .tex files within the contents directory. Refer to sample.tex for guidance.
* Compile:
    * Option 1: Latexmk:
Ensure you have Latexmk installed (refer to documentation for installation steps).
Place your content in the contents directory.
Run `latexmk -xelatex main.tex` from the command line. This will compile your presentation using the settings in latexmkrc.

    * Option 2: Manual Compilation:
Use a XeLaTeX compiler to compile the main.tex file. This will generate a PDF presentation.

    * Option 3: Visual Studio Code:
Use [latex-workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension to compile the main.tex file. You can create a workspace settings by creating a `.vscode/` folder and a `.settings.json` inside it. The `settings.json` can then contain the following settings:
        ```json
        {
            "latex-workshop.latex.tools": [
                {
                    "name": "latexmk-xelatex",
                    "command": "latexmk",
                    "args": [
                        "-xelatex",
                        "-interaction=nonstopmode",
                        "-synctex=1",
                        "%DOC%"
                    ]
                }
            ],
            "latex-workshop.latex.recipes": [
                {
                    "name": "xelatex (latexmk)",
                    "tools": [
                        "latexmk-xelatex"
                    ]
                }
            ],
            "latex-workshop.latex.recipe.default": "xelatex (latexmk)",
            "latex-workshop.latex.outDir": "build"
        }
        ```
    * Option 4: Overleaf:
Use [Overleaf](https://www.overleaf.com/) to compile the presentation by uploading a `.zip` file. To use xelatex to render the presentation, change the compiler setting by going to menu > copiler > XeLaTeX.

# Contributing
We welcome contributions to improve this template! Here's how to contribute:

* Fork the Repository: Create a fork of this repository on GitHub.
* Create a Branch: Make changes to your forked repository in a new branch.
* Make Changes: Modify existing themes, create new themes, or improve functionalities as needed.
* Test Changes: Make sure your changes compile and produce the desired output.
* Pull Request: Submit a pull request to merge your changes back into the main repository.

# License
This template is provided under the MIT license (refer to the LICENSE file for details).

# Contact
For any questions or suggestions, feel free to open an issue on this repository.

# What's Next
* Provide a detailed documentation
* Add more themes
* Add detailed theme configuration for inner theme
