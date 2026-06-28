# build.ps1 -- Windows build script for the exonot package.
#
# Usage:
#   .\build.ps1            # extract sty + build docs (default)
#   .\build.ps1 sty        # extract exonot.sty from exonot.dtx
#   .\build.ps1 doc        # typeset exonot.pdf (the manual)
#   .\build.ps1 demo       # build exonot-demo.pdf
#   .\build.ps1 ctan       # build a CTAN-ready exonot.zip
#   .\build.ps1 clean      # remove build artifacts
#   .\build.ps1 distclean  # also remove generated sty/pdf/zip

param([string]$Target = 'all')

$ErrorActionPreference = 'Stop'
$pkg = 'exonot'

function Invoke-Tex($exe, $arg) {
    & $exe $arg
    if ($LASTEXITCODE -ne 0) { throw "$exe $arg failed (exit $LASTEXITCODE)" }
}

function Build-Sty { Invoke-Tex 'tex' "$pkg.ins" }

function Build-Doc {
    Build-Sty
    Invoke-Tex 'pdflatex' "$pkg.dtx"
    Invoke-Tex 'pdflatex' "$pkg.dtx"
}

function Build-Demo {
    Build-Sty
    Invoke-Tex 'pdflatex' "$pkg-demo.tex"
    Invoke-Tex 'pdflatex' "$pkg-demo.tex"
}

function Build-Ctan {
    Build-Doc
    $staging = Join-Path $PWD $pkg
    if (Test-Path $staging) { Remove-Item -Recurse -Force $staging }
    if (Test-Path "$pkg.zip") { Remove-Item -Force "$pkg.zip" }
    New-Item -ItemType Directory -Path $staging | Out-Null
    'exonot.dtx','exonot.ins','exonot.pdf','exonot-demo.tex','README.md','LICENSE' |
        ForEach-Object { Copy-Item $_ $staging }
    Compress-Archive -Path $staging -DestinationPath "$pkg.zip"
    Remove-Item -Recurse -Force $staging
    Write-Host "Created $pkg.zip"
}

function Invoke-Clean {
    Get-ChildItem -Path . -Include `
        *.aux,*.log,*.out,*.toc,*.idx,*.ind,*.ilg,*.glo,*.gls,*.hd,`
        *.fls,*.fdb_latexmk,*.synctex.gz -Recurse |
        Remove-Item -Force -ErrorAction SilentlyContinue
}

function Invoke-Distclean {
    Invoke-Clean
    'exonot.sty','exonot.pdf','exonot-demo.pdf','exonot.zip' |
        ForEach-Object { if (Test-Path $_) { Remove-Item -Force $_ } }
}

switch ($Target) {
    'all'       { Build-Doc }
    'sty'       { Build-Sty }
    'doc'       { Build-Doc }
    'demo'      { Build-Demo }
    'ctan'      { Build-Ctan }
    'clean'     { Invoke-Clean }
    'distclean' { Invoke-Distclean }
    default     { throw "Unknown target '$Target'" }
}
