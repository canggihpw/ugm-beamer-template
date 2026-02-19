#!/usr/bin/env bash
# Creates a new presentation under presentations/<name>/
#
# Usage:
#   ./new-presentation.sh <name>
#
# Example:
#   ./new-presentation.sh my-talk
#   cd presentations/my-talk
#   latexmk -xelatex main.tex

set -e

NAME="$1"

if [ -z "$NAME" ]; then
    echo "Usage: $0 <presentation-name>"
    exit 1
fi

DEST="presentations/$NAME"

if [ -d "$DEST" ]; then
    echo "Error: '$DEST' already exists."
    exit 1
fi

mkdir -p "$DEST"

# Write main.tex
cat > "$DEST/main.tex" << 'EOF'
\documentclass[11pt,aspectratio=169]{beamer}
\input{content}
EOF

# Write content.tex from the blank starter
cat > "$DEST/content.tex" << 'EOF'
\usetheme{ugm1}

% -------------------------------------------------------
% Presentation metadata — edit these
% -------------------------------------------------------
\title{Your Title}
\subtitle{Your Subtitle}
\author{Your Name}
\date{\today}

% -------------------------------------------------------
% Slides
% -------------------------------------------------------
\begin{document}

% Title slide
\maketitle

% Section divider
\section{Introduction}
\begin{frame}
    \sectionpage
\end{frame}

% Content slide
{
\usebackgroundtemplate{\backgroundcontent}
\begin{frame}
    \frametitle{Slide Title}
    \begin{itemize}
        \item First point
        \item Second point
        \item Third point
    \end{itemize}
\end{frame}
}

% Quote slide
\quoteslide{"Your quote here." - Author}

\end{document}
EOF

# Write latexmkrc with relative paths back to themes/fonts
DEPTH=$(echo "$DEST" | tr -cd '/' | wc -c | tr -d ' ')
BACK=""
for i in $(seq 1 "$DEPTH"); do
    BACK="../$BACK"
done

cat > "$DEST/latexmkrc" << EOF
\$aux_dir = "${BACK}build";
\$tmpdir  = "${BACK}build";
\$out_dir = "${BACK}build";

ensure_path( 'TEXINPUTS', './/' );
ensure_path( 'TEXINPUTS', '${BACK}themes//' );
ensure_path( 'TEXINPUTS', '${BACK}fonts//' );
EOF

echo "Created '$DEST'"
echo ""
echo "Next steps:"
echo "  cd $DEST"
echo "  latexmk -xelatex main.tex"
echo "  open ${BACK}build/main.pdf"
