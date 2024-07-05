\NeedsTeXFormat{LaTeX2e} % Sets the LaTeX version for the class to work.
\ProvidesClass{fmbvecto}[2022/08/13 LaTeX class by Federico Melo Barrero. Para los talleres de Vecto.]

%% Options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Any non-defined option will be passed to the article document class.
\ProcessOptions\relax

\LoadClass[10pt,letterpaper,twoside]{article} % Base class: article.
\RequirePackage{fmbmath} % My personal package. Contains macros and packages for the class to work.

%% 1. Text format
\usepackage{parskip} % Add space between paragraphs and remove indentation, without getting unexpected vertical spacing.
%\renewcommand{\baselinestretch}{2} % Interlineado.
\RequirePackage{hyperref} % Hyperlinks to refs.
\RequirePackage{hyphenat} % Manage hyphenation.
\RequirePackage{enumitem} % Customize enumerate, itemize and description environments.
%\RequirePackage[utf8]{inputenc}
%\usepackage{fourier}

%% Customization of longtable environment
\RequirePackage{longtable}
\setlength\LTleft{0pt} % Longtables aligned to the left.
\setlength\LTright\fill
\setlength{\LTpre}{0pt} % No extra space before longtables (default is \bigskipamount)
\setlength{\LTpost}{0pt} % No extra space after longtables.

%% Customization of barriers for floats provided by placeins package
\usepackage{placeins} % Defines command \FloatBarrier so floats cannot bypass a certain point.
\usepackage{nicefrac} % Fractions with / format.
\let\Oldsection\section
\renewcommand{\section}{\FloatBarrier\Oldsection} % Floats stay within the section they are placed.
\let\Oldsubsection\subsection
\renewcommand{\subsection}{\FloatBarrier\Oldsubsection} % Floats stay within the subsection they are placed.
\let\Oldsubsubsection\subsubsection
\renewcommand{\subsubsection}{\FloatBarrier\Oldsubsubsection} % Floats stay within the subsubsection they are placed.

% Customization of itemize environment
\renewcommand{\labelitemi}{\( \bullet \)} % Item level 1: Bullet.
\renewcommand{\labelitemii}{\( \circ \)} % Item level 2: Circunference.
\renewcommand{\labelitemiii}{\( \diamond \)} % Item level 3: Diamond.
\renewcommand{\labelitemiv}{\(\triangleright\)} % Item level 4: Triangle (right).

\hypersetup{%
    colorlinks=false,
    linkbordercolor={cyan!40!black},% hyperlink borders will be red
    linkcolor={cyan!40!black}, % Cyan for internal links.
    pdfborderstyle={/S/U/W 0.6}% border style will be underline of width 1pt
    citecolor={blue!50!black}, % Blue for external hyperlinks.
    urlcolor={blue!80!black}% Dark blue for citations.
}%

%% 3. Para tareas
\RequirePackage[theorems,skins,breakable]{tcolorbox} % Colored and framed text boxes.
\newtcolorbox{gbox}{colback=white,colframe=green!37!black,breakable,enhanced}
\newcommand*{\answ}[1]{{\bfseries\textcolor{green!37!black}{#1}}}
\newcommand*{\falta}[1]{{\textsc{\textcolor{red!67!black}{#1}}}}
\newcommand{\quien}[1]{ \hfill {\textbf{\LARGE\textcolor{pink!80!black}{#1}}} \hfill}

%% 2. Page format
\RequirePackage[margin=1in]{geometry} % All sides with one inch margin.

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyhead[OL]{\textbf{\thepage} \quad \textcolor{green!50!black}{\(\bullet\)}  \quad \textsf{\title} \hbox{  }}
\fancyhead[OR]{}
\fancyhead[EL]{}
\fancyhead[ER]{\textsf{\subject} \quad \textcolor{green!50!black}{\(\bullet\)} \quad \textbf{\thepage}}

% Específico de Dalgo. Caja problema:

\newcounter{problema} % Counter de problema
\renewcommand\theproblema{\arabic{problema}}
% Doesn't restrat if section changes. Doesn't include section number.

\NewDocumentEnvironment{problema}{o}{%
	\refstepcounter{problema}
	\begin{tcolorbox}[%
		title=Ejercicio \theproblema. #1,
		colback=white, 
		colframe=green!30!black, 
		breakable,
		enhanced, 
		sharp corners=northwest, 
		fonttitle=\bfseries\sffamily, 
		drop fuzzy shadow southeast,
		attach boxed title to top left={
			xshift=1cm,
			yshift*=1mm-\tcboxedtitleheight}, 
		before skip=2mm,
		after skip=4mm, 
		boxrule=0.4mm, 
		boxed title style={ 
			frame code={
				\path[fill=tcbcolback!50!black]
				([yshift=-1mm,xshift=-1mm]frame.north west)
				arc[start angle=0,end angle=180,radius=1mm]
				([yshift=-1mm,xshift=1mm]frame.north east)
				arc[start angle=180,end angle=0,radius=1mm];
				\path[left color=tcbcolback!60!black,
				right color=tcbcolback!60!black,
				middle color=tcbcolback]
				([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
				[rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
				-- (frame.south east) -- (frame.south west)
				-- ([xshift=-1mm,yshift=-1mm]frame.north west)
				[sharp corners]-- cycle;}},
		colbacktitle=green!30!black,
		subtitle style={colback=green!30!black!75!white}
		% before lower=\textbf{\textsf{Solución:~\\}},
		]%
	}{%
\end{tcolorbox}
}