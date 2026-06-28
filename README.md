# exonot

<short description of the package>

## Installation

### Local (quick)

Copy `exonot.sty` into your document directory, or into your local texmf tree:

```
# Linux / macOS
~/texmf/tex/latex/exonot/exonot.sty

# Windows (MiKTeX user tree, then run "Refresh FNDB")
%USERPROFILE%\texmf\tex\latex\exonot\exonot.sty
```

## Usage

```latex
\usepackage[draft, color=blue]{exonot}

\hello              % -> Hello, world!
\hello[\LaTeX user] % -> Hello, LaTeX user!
```

### Package options

| Option  | Type    | Default | Description                          |
|---------|---------|---------|--------------------------------------|
| `draft` | boolean | off     | Append a `[draft]` marker.           |
| `color` | string  | `black` | Color used by `\hello`.              |

## Building the example

```
latexmk -pdf example.tex
```

## License

Released under the [LaTeX Project Public License (LPPL) v1.3c](https://www.latex-project.org/lppl.txt).
