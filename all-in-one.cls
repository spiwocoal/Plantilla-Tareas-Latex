\NeedsTeXFormat{LaTeX2e}
\newcommand{\templateauthor}{Mario Vilar}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\def\fileversion{2.6}
\def\filedate{30/08/2023}

\ProvidesClass{all-in-one}[\filedate\space Version \fileversion\space by \templateauthor]
\RequirePackage{ifthen}

%\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish]{babel}
\RequirePackage[T1]{fontenc}

\RequirePackage{geometry}
\RequirePackage{calc}

\RequirePackage{amsmath}
\RequirePackage{mathtools}
\RequirePackage{amssymb}

\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage[svgnames]{xcolor}

\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{float}

\RequirePackage{titling}
\RequirePackage[explicit]{titlesec}
\RequirePackage{eso-pic, transparent}

\RequirePackage{extramarks}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage[type={CC},modifier={by-nc-nd},hyperxmp={false},version={4.0}]{doclicense}

\RequirePackage{xpatch}
\RequirePackage{rotating}
\RequirePackage{fbox}

% Some commands that will be useful for the title.
\makeatletter
\newcommand{\doctitle}[1]{\def\@doctitle{#1}}
\newcommand{\docsubtitle}[1]{\def\@docsubtitle{#1}}
\newcommand{\footext}[1]{\def\@footext{#1}}
\makeatother

% Number equations within section and tag only references equations.
\numberwithin{equation}{section}
\mathtoolsset{showonlyrefs,showmanualtags}

% Different theorem environments with respective styles.
\newtheorem{theorem}{Teorema}[section]
\newtheorem{corollary}[theorem]{Corolario}
\newtheorem{lemma}[theorem]{Lema}
\newtheorem{exercise}[theorem]{Ejercicio}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definición}

\theoremstyle{remark}
\newtheorem{remark}[theorem]{Nota}
\newtheorem{example}[theorem]{Ejemplo}

 % To make the lists more aesthetic, gray tones.
\setlist{label=\textcolor{gray}{\textbullet},topsep=2pt,noitemsep}
\setenumerate{label=\textcolor{gray}{\textit{\arabic*}.},topsep=2pt,noitemsep}

% Keeping the gray tones along the document, on the header bar.
\renewcommand{\headrulewidth}{1pt}
\xpretocmd\headrule{\color{lightgray}}{}{\PatchFailed}
\renewcommand{\qedsymbol}{\textcolor{gray}{$\blacksquare$}}

\geometry{a4paper, left=19.1mm, right=19.1mm, top=25.4mm, bottom=25.4mm}
% Important, header and footer spacing
\def\mylength{3pt}
\setlength{\headheight}{12pt+\mylength}
\addtolength{\headsep}{1em}
\addtolength{\footskip}{1em}
\addtolength{\textheight}{-2em-1ex-\mylength}

% If you want to put a quote, it can appear in italic.
\AtBeginEnvironment{quote}{\itshape}

% A beautiful background for the titlepage.
\AtBeginEnvironment{titlepage}{\AddToShipoutPictureBG*{\transparent{0.1}\BackgroundPic}}
\newcommand\BackgroundPic{\put(0,0){\parbox[b][\paperheight]{\paperwidth}{\vfill\centering\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{extras/fondo.jpg}\vfill}}}
\AtBeginEnvironment{titlepage}{\AddToShipoutPictureBG*{\transparent{0.1}\BackgroundPic}}

% Licensing
\newcommand{\licensing}{\AfterEndEnvironment{titlepage}{\AddToShipoutPictureBG{\put(0,1em){\parbox[b]{\paperwidth}{\vfill\centering\footnotesize{\color{gray}\normalfont\doclicenseText\hspace{2pt}\doclicenseIcon}}}}}}

% Page numbering
\newcommand{\pagenumber}[1]{{\setlength{\fboxsep}{5pt}\fbox[#1,lcolor=lightgray,rcolor=lightgray,tcolor=lightgray,bcolor=lightgray]{\fontsize{10pt}{10pt}\selectfont{\textcolor{gray!70!black}{\thepage}}}}}

% Header configuration
\makeatletter

\fancypagestyle{singleside}{%
\fancyhead{}%
\lhead{\color{black}\nouppercase{\textit{\lastleftxmark}}}%
\rhead{\color{black}\nouppercase{\textsc{\lastrightxmark}}}%
\fancyfoot{}%
\rfoot{\pagenumber{rt}}%
\lfoot{\fontsize{10pt}{10pt}\selectfont{\textsc{\textcolor{black}{\@doctitle}\;\textcolor{lightgray}{|}\;\textcolor{gray!70!black}{\@docsubtitle}}}}%
\cfoot{\color{gray!70!black}\fontsize{10pt}{10pt}{\@footext}}
\renewcommand{\headrulewidth}{1pt}}%

\fancypagestyle{twoside}{%
\fancyhead{}%
\fancyhead[LE,RO]{\color{black}\nouppercase{\textit{\lastleftxmark}}}%
\fancyhead[LO,RE]{\color{black}\nouppercase{\textsc{\lastrightxmark}}}%
\fancyfoot{}%
\fancyfoot[RO]{\pagenumber{rt}}%
\fancyfoot[LE]{\pagenumber{lt}}%
\fancyfoot[RE]{\fontsize{10pt}{10pt}\selectfont{\textcolor{black}{\textsc{\@doctitle}}}}%
\fancyfoot[LO]{\fontsize{10pt}{10pt}\selectfont{\textcolor{gray!70!black}{\textsc{\@docsubtitle}}}}%
\fancyfoot[CO,CE]{\color{gray!70!black}\selectfont{\fontsize{10pt}{10pt}{\@footext}}}%
\renewcommand{\headrulewidth}{1pt}}%

\fancypagestyle{plain}{%
\fancyhead{}%
\fancyfoot{}%
\cfoot{\pagenumber{rlt}}%
\renewcommand{\headrulewidth}{0pt}}%

\fancypagestyle{auxsingle}{%
\fancyhead{}%
\chead{\nouppercase{\textsc{\leftmark}}}%
\fancyfoot{}%
\lfoot{\fontsize{10pt}{10pt}\selectfont{\textsc{\textcolor{black}{\@doctitle}\;\textcolor{lightgray}{|}\;\textcolor{gray!70!black}{\@docsubtitle}}}}%
\rfoot{\pagenumber{rt}}%
\renewcommand{\headrulewidth}{1pt}}%

\fancypagestyle{auxtwoside}{%
\fancyhead{}%
\fancyhead[CE,CO]{\nouppercase{\textsc{\leftmark}}}%
\fancyfoot{}%
\fancyfoot[RE]{\fontsize{10pt}{10pt}\selectfont{\textcolor{black}{\textsc{\@doctitle}}}}%
\fancyfoot[LO]{\fontsize{10pt}{10pt}\selectfont{\textcolor{gray!70!black}{\textsc{\@docsubtitle}}}}%
\fancyfoot[RO]{\pagenumber{rt}}%
\fancyfoot[LE]{\pagenumber{lt}}%
\renewcommand{\headrulewidth}{1pt}}%

\makeatother

% Greetings for the template author command (modify the auxiliar pagestyles).
\makeatletter
\newcommand{\greetings}{%
\fancypagestyle{auxsingle}{%
\fancyhead{}%
\chead{\nouppercase{\textsc{\leftmark}}}%
\fancyfoot{}%
\lfoot{\fontsize{10pt}{10pt}\selectfont{\textit{Template by}: \textsc{\templateauthor}}}%
\rfoot{\pagenumber{rt}}%
\renewcommand{\headrulewidth}{1pt}}%
\fancypagestyle{auxtwoside}{%
\fancyhead{}%
\fancyhead[CE,CO]{\nouppercase{\textsc{\leftmark}}}%
\fancyfoot{}%
\fancyfoot[CE,CO]{\fontsize{10pt}{10pt}\selectfont{\textit{Template by}: \textsc{\templateauthor}}}%
\fancyfoot[RE]{\fontsize{10pt}{10pt}\selectfont{\textcolor{black}{\textsc{\@doctitle}}}}%
\fancyfoot[LO]{\fontsize{10pt}{10pt}\selectfont{\textcolor{gray!70!black}{\textsc{\@docsubtitle}}}}%
\fancyfoot[RO]{\pagenumber{rt}}%
\fancyfoot[LE]{\pagenumber{lt}}%
\renewcommand{\headrulewidth}{1pt}}}%
\makeatother

% Now, if we load all-in-one with two side option, we will adjust the headers accordingly
\makeatletter
\if@twoside
  \newcommand{\defaultsettings}{twoside}
  \newcommand{\auxsettings}{auxtwoside}
\else
  \newcommand{\defaultsettings}{singleside}
  \newcommand{\auxsettings}{auxsingle}
\fi
\makeatother

\pagestyle{\defaultsettings}

% Section and subsection marks.
\renewcommand{\sectionmark}[1]{\extramarks{\thesection}{#1}}
\renewcommand{\subsectionmark}[1]{\extramarks{\thesubsection}{#1}}
\renewcommand{\subsubsectionmark}[1]{\extramarks{\thesubsubsection}{#1}}

% Title styles
\titleformat{\section}[frame]
{\color{gray}\large\normalfont\mdseries\scshape\centering}{\filcenter\small\quad{\color{black}\textit{\thesection}}\quad}
{1ex}{\color{gray!50!black}\Large\bfseries\filcenter#1}[]
\titleformat{\subsection}[hang]{\color{gray}\normalfont\mdseries\scshape\centering}{\textit{\thesubsection}}{2ex}{\color{gray!50!black}#1\hfill}
\titleformat{\subsubsection}[hang]{\color{gray}\normalfont\mdseries\scshape\centering}{\textit{\thesubsubsection}}{2ex}{\color{gray!50!black}#1\hfill}
