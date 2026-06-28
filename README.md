# exonot

`exonot` provides standardized LaTeX macros for exoplanet science and
planetary astrophysics notation — masses and radii, system designations,
atmospheric/spectroscopy symbols, and observational quantities. Every macro
is wrapped in `\ensuremath`, so it works in both text and math mode, and all
subscripts are typeset upright (`\mathrm`) following IAU style.

## Building from source

The package source lives in `exonot.dtx`. The `.sty` and the PDF
documentation are *generated* — they are not checked into the repo.

```
# Extract exonot.sty from the documented source:
tex exonot.ins        # or: latex exonot.ins

# Typeset the manual (exonot.pdf):
pdflatex exonot.dtx
pdflatex exonot.dtx

# Or use the helpers:
make             # sty + manual         (Unix; needs make, zip)
.\build.ps1      # sty + manual         (Windows / PowerShell)
make ctan        # or: .\build.ps1 ctan # CTAN-ready exonot.zip
```

## Installation

Copy the generated `exonot.sty` into your document directory, or into your
local texmf tree:

```
# Linux / macOS
~/texmf/tex/latex/exonot/exonot.sty

# Windows (MiKTeX user tree, then run "Refresh FNDB")
%USERPROFILE%\texmf\tex\latex\exonot\exonot.sty
```

## Usage

```latex
\usepackage{exonot}              % default
\usepackage[symbols]{exonot}     % also defines \Earth and \Sun
\usepackage[siunitx]{exonot}     % defines SI units IF siunitx is loaded first
```

```latex
The host \star{A} hosts \system{WASP-39}{b}, a \Mjup-class planet whose
\HO{} and \CO{} bands appear at \snr${}>20$, with scale height \Hatm.
```

Build the demo to see every macro in context:

```
pdflatex exonot-demo.tex
```

## Package options

| Option     | Effect                                                                                  |
|------------|-----------------------------------------------------------------------------------------|
| `symbols`  | Loads `textcomp` and defines `\Earth` (⊕) and `\Sun` (⊙) for text or math.               |
| `siunitx`  | If `siunitx` is already loaded, declares SI units (see below); otherwise warns, no error.|

With `[siunitx]` and `siunitx` loaded, these units become available for
`\qty{}`/`\unit{}`: `\earthmass`, `\jupitermass`, `\solarmass`,
`\earthradius`, `\jupiterradius`, `\solarradius`, `\solarluminosity`.

## Macro reference

### Units and physical quantities

| Macro      | Renders as            | Meaning                          |
|------------|-----------------------|----------------------------------|
| `\Mearth`  | M⊕                    | Earth mass                       |
| `\Mjup`    | M_J                   | Jupiter mass                     |
| `\Msun`    | M⊙                    | Solar mass                       |
| `\Rearth`  | R⊕                    | Earth radius                     |
| `\Rjup`    | R_J                   | Jupiter radius                   |
| `\Rsun`    | R⊙                    | Solar radius                     |
| `\Lsun`    | L⊙                    | Solar luminosity                 |
| `\Teff`    | T_eff                 | Effective temperature            |
| `\logg`    | log g                 | Surface gravity                  |
| `\Porb`    | P_orb                 | Orbital period                   |
| `\aorb`    | a                     | Semi-major axis                  |
| `\Teq`     | T_eq                  | Equilibrium temperature          |
| `\tdepth`  | (R_p/R_⋆)²            | Transit depth (radius ratio²)    |
| `\Hatm`    | H                     | Atmospheric scale height         |
| `\Mp` `\Rp` `\rhop` | M_p, R_p, ρ_p | Generic planet mass/radius/density |
| `\Mstar` `\Rstar` `\rhostar` | M_⋆, R_⋆, ρ_⋆ | Generic stellar mass/radius/density |
| `\kB` `\mH` `\amu`    | k_B, m_H, m_u | Boltzmann const., H-atom mass, amu |
| `\Gnewton` `\stefan`  | G, σ_SB       | Gravitational & Stefan–Boltzmann const. |

### System notation

| Macro              | Renders as   | Meaning                              |
|--------------------|--------------|--------------------------------------|
| `\star{A}`         | A_⋆          | Host-star / component designation    |
| `\planet{b}`       | b            | Planet designation letter (upright)  |
| `\system{WASP-39}{b}` | WASP-39 b | Full system name, correct spacing    |

### Atmospheric / spectroscopy

**Molecules** (macro names follow the formula — monoxides vs. dioxides):

| Macro | Out | Macro | Out | Macro | Out |
|-------|-----|-------|-----|-------|-----|
| `\HO`   | H₂O | `\CO`    | CO  | `\COtwo`  | CO₂ |
| `\CH`   | CH₄ | `\NH`    | NH₃ | `\SO`     | SO  |
| `\SOtwo`| SO₂ | `\SiO`   | SiO | `\SiOtwo` | SiO₂|
| `\Otwo` | O₂  | `\Othree`| O₃  | `\Ntwo`   | N₂  |
| `\Htwo` | H₂  | `\Helium`| He  | `\HtwoS`  | H₂S |
| `\HCN`  | HCN | `\CtwoHtwo` | C₂H₂ | `\OCS` | OCS |
| `\PHthree` | PH₃ | `\TiO` | TiO | `\VO`     | VO  |
| `\FeHyd`| FeH | `\CaH`   | CaH | `\MgH`    | MgH |
| `\NaI`  | Na ɪ| `\KI`    | K ɪ | `\FeI`    | Fe ɪ|
| `\FeII` | Fe ɪɪ | `\Hminus` | H⁻ | `\eminus` | e⁻ |

**Other atmospheric / spectroscopy:**

| Macro       | Renders as | Meaning                       |
|-------------|------------|-------------------------------|
| `\mmw`      | μ          | Mean molecular weight         |
| `\vmr{\HO}` | X_{H₂O}    | Volume mixing ratio           |
| `\CtoO`     | C/O        | Carbon-to-oxygen ratio        |
| `\FeH` `\MH`| [Fe/H], [M/H] | Metallicity (iron / bulk)  |
| `\Rspec`    | R_λ        | Transmission/resolution spec. |
| `\fcont`    | f_cont     | Stellar contamination factor  |
| `\Tday` `\Tnight` | T_day, T_night | Day/nightside temperature |
| `\Tint` `\Tirr` `\Tbright` | T_int, T_irr, T_b | Internal/irradiation/brightness temp. |
| `\opacity` `\optdepth` | κ, τ | Opacity, optical depth      |
| `\albedo` `\insol` `\redist` | A_B, S, f | Bond albedo, instellation, heat redistribution |

> Note: `\FeH` is the metallicity [Fe/H]; the iron-hydride molecule is `\FeHyd`.

### Orbital / dynamical

| Macro      | Renders as | Meaning                          |
|------------|------------|----------------------------------|
| `\ecc`     | e          | Eccentricity                     |
| `\inc`     | i          | Inclination                      |
| `\argperi` | ω          | Argument of periastron           |
| `\ascnode` | Ω          | Longitude of ascending node      |
| `\Tc` `\Tzero` `\Tperi` | T_c, T_0, T_peri | Conjunction/reference/periastron epoch |
| `\Krv`     | K          | Radial-velocity semi-amplitude   |
| `\massfn`  | f(m)       | Spectroscopic mass function      |
| `\obliq`   | λ          | Sky-projected spin–orbit obliquity |

### Observational

| Macro      | Renders as | Meaning                          |
|------------|------------|----------------------------------|
| `\tdur`    | T₁₄        | Total transit duration           |
| `\ting`    | T₁₂        | Ingress/egress duration          |
| `\bparam`  | b          | Impact parameter                 |
| `\ldc`     | u          | Limb-darkening coefficient       |
| `\ldc[1]`  | u₁         | …with optional index             |
| `\snr`     | S/N        | Signal-to-noise ratio            |
| `\fratio`  | F_p/F_⋆    | Planet/star flux ratio           |
| `\edepth`  | δ_ecl      | Eclipse depth                    |
| `\ppm`     | ppm        | Parts-per-million unit           |

### Statistics / model comparison

| Macro       | Renders as | Meaning                      |
|-------------|------------|------------------------------|
| `\chisq`    | χ²         | Chi-squared                  |
| `\redchisq` | χ²_ν       | Reduced chi-squared          |
| `\BIC` `\AIC` | BIC, AIC | Information criteria          |
| `\lnL`      | ln 𝓛       | Log-likelihood               |
| `\Bfac`     | 𝓑          | Bayes factor                 |

## Note on `\star`

`\star` is normally the LaTeX ⋆ binary operator. `exonot` redefines it for
the system-notation API (`\star{A}`). The original symbol remains available
as `\starsym` if you still need the operator.

## Submitting to CTAN

`make ctan` (or `.\build.ps1 ctan`) produces `exonot.zip` containing
`exonot.dtx`, `exonot.ins`, `exonot.pdf`, `exonot-demo.tex`, `README.md`
and `LICENSE`. Upload that zip at <https://www.ctan.org/upload>.

## License

Released under the [LaTeX Project Public License (LPPL) v1.3c](https://www.latex-project.org/lppl.txt).
