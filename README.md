# UGM Beamer Template

This repository provides an **unofficial** custom Beamer template built with LaTeX, offering a powerful and versatile alternative to traditional presentation software like PowerPoint. While inspired by the [original template from UGM](https://brand.ugm.ac.id/downloads/), this template leverages the many advantages of LaTeX.

# Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/canggihpw/ugm-beamer-template.git
   cd ugm-beamer-template
   ```

2. Create a new presentation:
   ```bash
   ./new-presentation.sh my-talk
   cd presentations/my-talk
   ```

3. Edit your slides in `content.tex`.

4. Compile:
   ```bash
   latexmk -xelatex main.tex
   # or from the repo root:
   make build
   ```

5. Open `../../build/main.pdf`.

# Features

* **Easy Content Management**: Place your presentation content in `contents/`. The entry point is `main.tex`.
* **Themed Presentations**: Choose from pre-defined themes in the `themes/` directory.
* **Customizable**: Modify existing themes or create your own by adding them to `themes/`.
* **Open to Contribution**: Pull requests are welcome.

# Directory Structure

```
ugm-beamer-template/
├── main.tex                  # Entry point — compile this
├── Makefile                  # make build / make watch / make clean
├── new-presentation.sh       # Scaffold a new presentation folder
├── latexmkrc                 # Latexmk build configuration
├── contents/
│   └── sample.tex            # Minimal blank starter
├── presentations/            # Your presentations go here (created by script)
├── examples/
│   ├── tutorial/             # Full walkthrough of all slide types
│   │   ├── main.tex
│   │   ├── content.tex
│   │   └── latexmkrc
│   └── footnote/             # How to add footnotes to slides
│       ├── main.tex
│       ├── content.tex
│       └── latexmkrc
├── themes/
│   └── ugm1/                 # Default UGM theme
├── fonts/                    # Gama-Sans font family
├── helper/
│   └── grid.tex              # Debug grid overlay
└── build/                    # Compiled output (auto-generated)
```

# Slide Types

| Slide type | How to use |
|---|---|
| Title slide | `\maketitle` |
| Section divider | `\section{Name}` then `\sectionpage` inside a frame |
| Content slide | Wrap frame with `\usebackgroundtemplate{\backgroundcontent}` |
| Quote slide | `\quoteslide{"Your quote." - Author}` |

See `examples/tutorial/` for a complete working demonstration of all slide types.

# Compiling

**Option 1 — Latexmk** (recommended):
```bash
latexmk -xelatex main.tex
```

**Option 2 — Manual XeLaTeX**:
```bash
xelatex main.tex
```

**Option 3 — VS Code** with [latex-workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop):

Create `.vscode/settings.json`:
```json
{
    "latex-workshop.latex.tools": [
        {
            "name": "latexmk-xelatex",
            "command": "latexmk",
            "args": ["-xelatex", "-interaction=nonstopmode", "-synctex=1", "%DOC%"]
        }
    ],
    "latex-workshop.latex.recipes": [
        {
            "name": "xelatex (latexmk)",
            "tools": ["latexmk-xelatex"]
        }
    ],
    "latex-workshop.latex.recipe.default": "xelatex (latexmk)",
    "latex-workshop.latex.outDir": "build"
}
```

**Option 4 — Overleaf**: Upload a `.zip` of the repository, then set the compiler to XeLaTeX via Menu > Compiler > XeLaTeX.

> **Note:** XeLaTeX is required (not pdfLaTeX) because the template uses custom `.otf` fonts.

# Compiling Examples

Each example has its own `main.tex` and `latexmkrc`. Either run from the example's directory:

```bash
cd examples/tutorial && latexmk -xelatex main.tex
cd examples/footnote && latexmk -xelatex main.tex
```

Or compile all at once from the repo root:

```bash
make examples
```

# Contributing

1. Fork the repository.
2. Create a branch for your changes.
3. Test that the presentation compiles correctly.
4. Submit a pull request.

# License

MIT — see [LICENSE](LICENSE) for details.

# What's Next

* Add more themes
* Detailed theme customization documentation
