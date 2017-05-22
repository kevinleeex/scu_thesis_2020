% 文件名：scuthesis.cls
% 文件描述：以 ctexbook 文档类为基础，定义四川大学学位论文文档类
% 作者：LegendaryLeo
% 参考：pkuthss-1.2beta
% 修改日期：2016年6月2日
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{../Template/scuthesis}[2016/05/30 v0.1]
% 声明传入参数，定义对应的论文类别，分别对应博士、硕士和学士学位论文。这里由于tex对中文支持不够，因此不能在此定义论文名称。
\DeclareOption{doctor}{\def\thesistype{0}}
\DeclareOption{master}{\def\thesistype{1}}
\DeclareOption{bachelor}{\def\thesistype{2}}
% 将文档类其他参数全部传递给 ctexbook 文档类。
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% 此文档类以 ctexbook 为基础，设定页面尺寸为 A4，默认字号为小四号。
% CJKfntef 宏包提供了 \maketitle 中用到的 \CJKunderline 命令。
% fancyhdr 宏包提供了方便使用的命令用于设置页眉、页脚。
\LoadClass[fntef, a4paper, fancyhdr, cs4size]{ctexbook}
% 加入判断支持
\RequirePackage{ifthen}
% 此宏包提供图形支持。
\RequirePackage{graphicx}
% 设置16K页面
\RequirePackage{anysize}
\papersize{27cm}{19.5cm}
% 左边距 1.95cm，右边距 1.95cm，上边距 1.25cm，下边距 1.25cm，版心 215×145mm
\marginsize{1.95cm}{1.95cm}{1.25cm}{1.25cm}
\setlength{\topskip}{-0.7cm}

% 设定页眉、页脚样式。
%\fancypagestyle{plain}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}}
\fancypagestyle{plain}{\pagestyle{fancy}}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[RE]{\zihao{-5}\songti\@title}
\fancyhead[RO]{\zihao{-5}\songti\@title}
\fancyhead[LO,LE]{\zihao{-5}\songti\universityname\thesisname}
\fancyfoot[CO,CE]{\zihao{-5}\thepage}

% 使用epstopdf宏包重定向eps输出路径，避免图片错误
\RequirePackage[outdir=./]{epstopdf}

% 使用hyperref宏包去除索引上的颜色标记
\RequirePackage{hyperref}
\hypersetup{pdfborder=0 0 0}
% 使用tocloft宏包修改目录样式
\RequirePackage{tocloft}
% 目录中显示目录项和参考文献项
\RequirePackage{tocbibind}
% 使用caption2宏包修改题注样式
\RequirePackage{caption2}
% 修改题注样式
\renewcommand{\captionfont}{\zihao{5}\rm\heiti}
\renewcommand{\captionlabeldelim}{~}
% 使用natbib宏包修改参考文献行距和参考标记样式
%               上标	方括号	逗号分隔	自动排序分类
\RequirePackage[super,square,comma,sort&compress]{natbib}
\setlength{\bibsep}{0.5ex}
% 定义 \incite 命令，用于如“文献[1]”这样的引用
\newcommand*{\incite}{}
\DeclareRobustCommand*{\incite}[1]{
  \begingroup
    % \romannumeral-`\x
    \setcitestyle{numbers}
    \hspace{-1em}文献~\cite{#1}\hspace{-0.3em}
  \endgroup
}

% 支持自定义列表环境
\RequirePackage{enumitem}
% 支持ams数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
% 支持float图片环境
\RequirePackage{float}
% 三线表支持
\RequirePackage{booktabs}
% 这些命令用于设定各项文档信息的具体内容。
\newcommand\ENGtitle[1]{\def\@ENGtitle{#1}}
\newcommand\ENGauthor[1]{\def\@ENGauthor{#1}}
\newcommand\accomplishdate[1]{\def\@accomplishdate{#1}}
\newcommand\school[1]{\def\@school{#1}}
\newcommand\supervisor[1]{\def\@supervisor{#1}}
\newcommand\ENGsupervisor[1]{\def\@ENGsupervisor{#1}}
\newcommand\major[1]{\def\@major{#1}}
\newcommand\ENGmajor[1]{\def\@ENGmajor{#1}}
\newcommand\direction[1]{\def\@direction{#1}}
\newcommand\ENGdirection[1]{\def\@ENGdirection{#1}}
\newcommand\defensedate[1]{\def\@defensedate{#1}}
\newcommand\keywords[1]{\def\@keywords{#1}}
\newcommand\ENGkeywords[1]{\def\@ENGkeywords{#1}}
\newcommand\university[1]{\def\@university{#1}}
\newcommand\ENGuniversity[1]{\def\@ENGuniversity{#1}}
% 加入封面标题命令，支持封面标题的换行 20161124
\newcommand\CoverTitle[1]{\def\@CoverTitle{#1}}

% 设置标题深度为4
\setcounter{secnumdepth}{4}
% CTEX设置各级标题对齐方式，字号，字体及前后段间距
% “章节”标题，小三号黑体，左对齐，前后段间距为10pt
\CTEXsetup[
	format+={\zihao{-3}\rm\heiti\flushleft},
	beforeskip={-1cm},
	afterskip={10pt}
]{chapter}
% “节”标题，四号黑体，左对齐，前后段间距为10pt
\CTEXsetup[
	format+={\zihao{4}\rm\heiti\flushleft},
	beforeskip={10pt},
	afterskip={10pt}
]{section}
% “小节”标题，小四号黑体，左对齐，前后段间距为10pt
\CTEXsetup[
	format+={\zihao{-4}\rm\heiti\flushleft},
	beforeskip={10pt},
	afterskip={10pt}
]{subsection}
% “次小节”标题，小四号楷体，左对齐，前后段间距为10pt
\CTEXsetup[
	format+={\zihao{-4}\rm\kaishu\flushleft},
	beforeskip={10pt},
	afterskip={10pt}
]{subsubsection}
% “段”标题，小四号楷体，左对齐，前后段间距为0pt
\renewcommand{\theparagraph}{(\arabic{paragraph})}
\CTEXsetup[
	name={,},
	number={\theparagraph},
	format+={\zihao{-4}\rm\kaishu\flushleft},
	beforeskip={0pt},
	afterskip={0pt}
]{paragraph}
% 定义\makechaptertitlecenter命令，可使命令后章节标题居中
\newcommand{\makechaptertitlecenter}{\CTEXsetup[format+={\center}]{chapter}}
% 定义\makechaptertitleleft命令，可使命令后章节标题居左
\newcommand{\makechaptertitleleft}{\CTEXsetup[format+={\flushleft}]{chapter}}
% 判断论文类别，定义不同论文名称
\ifthenelse{\equal{\thesistype}{0}}{
	\def\thesisname{博士学位论文}
	\def\CHSauthortype{研究生}
	\def\ENGauthortype{Postgraduate}
  \def\TypeAbbr{PhD Degree}
	}{}
\ifthenelse{\equal{\thesistype}{1}}{
	\def\thesisname{硕士学位论文}
	\def\CHSauthortype{研究生}
	\def\ENGauthortype{Postgraduate}
  \def\TypeAbbr{MSc Degree}
	}{}
\ifthenelse{\equal{\thesistype}{2}}{
	\def\thesisname{学士学位论文}
	\def\CHSauthortype{本科生}
	\def\ENGauthortype{Undergraduate}
  \def\TypeAbbr{Bachelor Degree}
	}{}


% 定义\fillinblank命令，用下划线填充指定的空间。
\newcommand{\fillinblank}[2]{
	\CJKunderline{\makebox[#1]{#2}}
}
% 定义\putonbottom命令，将对象放到页面底部。
\newcommand{\putonbottom}[1]{
	\begin{figure}[b!]%
		\begin{minipage}{\textwidth}
			{#1}
		\end{minipage}
	\end{figure}
}

% 定义目录标题格式，小三号黑体居中，段前后距10pt
\renewcommand{\cfttoctitlefont}{\hfill\zihao{-3}\rm\heiti}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforetoctitleskip}{10pt}
\renewcommand{\cftaftertoctitleskip}{10pt}
% 定义引导线格式，为点，点距0.5，章节标题也使用引导线
\renewcommand{\cftdot}{.}
\renewcommand{\cftdotsep}{0.5}
\renewcommand{\cftchapdotsep}{\cftdotsep}
% 定义章节目录项前后距
\setlength{\cftbeforechapskip}{0pt}

% 定义\maketoc命令，将自动生成符合要求的目录。
\newcommand{\maketoc}{
	\thispagestyle{empty}\cleardoublepage
	\tableofcontents\pagenumbering{roman}
	\thispagestyle{fancy}
}

% 设定标题页格式。
\renewcommand\maketitle
{
	\cleardoublepage
	\begin{titlepage}
		\begin{center}
			% 校名和论文类别、“四川大学”字样
			{
				\ \\[-1cm]
				\includegraphics[width=8cm]{../Template/Components/Images/SCU_TITLE}\\[1.5cm]
					{\makebox[10.5cm][s]{\zihao{-0}\heiti\thesisname}}
				}
				\\[2cm]
				% 论文标题，作者，完成日期
				{
					\zihao{-3}\kaishu
					\begin{tabular}{cc}
						{\makebox[1.5cm][s]{\textbf{\label@title}}}  & \fillinblank{12cm}{\parbox[b]{12cm}{\centering\textbf{\@CoverTitle}}} \\[0.7cm] % 使用 parbox 支持换行
						{\makebox[1.5cm][s]{\textbf{\label@author}}} & \fillinblank{4cm}{\textbf{\@author}}
						{\makebox[2cm][s]{\textbf{\label@accomplishdate}}} \fillinblank{5.8cm}{\textbf{\@accomplishdate}}
					\end{tabular}
				}
				\\[2.6cm]
				% 培养单位，指导教师，专业等信息
				{
					\zihao{-3}\kaishu
					\begin{tabular}{cc}
						{\makebox[3.2cm][s]{\textbf{\label@university}}}  & \fillinblank{6.2cm}{\textbf{\university}}
						\\[0.8cm]
						{\makebox[3.2cm][s]{\textbf{\label@supervisor}}}  & \fillinblank{6.2cm}{\textbf{\@supervisor}}
						\\[0.8cm]
						{\makebox[3.2cm][s]{\textbf{\label@major}}}       & \fillinblank{6.2cm}{\textbf{\@major}}
						\\[0.8cm]
						{\makebox[3.2cm][s]{\textbf{\label@direction}}}   & \fillinblank{6.2cm}{\textbf{\@direction}}
						\\[0.8cm]
						{\makebox[3.2cm][s]{\textbf{\label@defensedate}}} & \fillinblank{6.2cm}{\textbf{\@defensedate}}
					\end{tabular}
				}
			\end{center}
		\end{titlepage}
		\thispagestyle{empty}
	}

	% 重定义autoref标签
	%\renewcommand{\partautorefname}{\part}
	%\renewcommand{\figureautorefname}{\figurename}
	%\renewcommand{\tableautorefname}{\tablename}
	%\renewcommand{\appendixautorefname}{\appendixname}
	%\renewcommand{\equationautorefname}{\equationname}
	%\renewcommand{\Itemautorefname}{\Itemname}

	%\newcommand{\equationname}{式}
	%\renewcommand{\equationautorefname}{\equationname}

	% 定义\specialchap命令，生成没有编号的章节。从pkuthss-1.2beta保留，本模版中未使用。
	\newcommand{\specialchap}[1]{
		\chapter*{#1}\markboth{#1}{}
		\addcontentsline{toc}{chapter}{#1}\phantomsection
	}

	% 定义\autograph命令，生成版权授权书等的签名栏。
	\newcommand{\autograph}{
		\begin{center}
			\begin{tabular*}{\textwidth}{p{0.5\textwidth}p{0.5\textwidth}}
				学位论文作者签名：& 导师签名：\\[1cm]
				签字日期：\quad年\quad月\quad日 & 签字日期：\quad年\quad月\quad日
			\end{tabular*}
		\end{center}
	}

	% 定义中文摘要环境
	\newenvironment{CHSabstract}
	{
		\cleardoublepage
		\ \vspace{0cm}\par
		\begin{center}
			\zihao{-2}\songti{\@title} \\[0.5cm]
			\zihao{-4}
			{\heiti{{\label@major}{：}}}{\kaishu{\@major}} \\[0.5cm]
			{\heiti{{\CHSauthortype}{：}}}{\kaishu{\@author}}
			\quad
			{\heiti{{\label@supervisor}{：}}}{\kaishu{\@supervisor}}
		\end{center}
		\ \vspace{0cm}\par
		%\ \\[-0.5cm]
	}
	{
		\vspace{1em}\par
		\noindent\textbf{关键词：}\@keywords
		%\putonbottom{\textbf{关键词：}\@keywords}
	}
	% 定义英文摘要环境
	\newenvironment{ENGabstract}
	{
		\cleardoublepage
		\ \vspace{0cm}\par
		\begin{center}
			\zihao{-2}{\@ENGtitle} \\[1.5em]
			\zihao{-4}
      {\textbf{Presented for \TypeAbbr}} \\[0.5em]
			{\textbf{{\label@ENGmajor: \@ENGmajor}}} \\[0.5em]
			{\textbf{{\ENGauthortype: \@ENGauthor}}}
			\quad
			{\textbf{{\label@ENGsupervisor: \@ENGsupervisor}}}
		\end{center}
		\ \vspace{0cm}\par
		%\ \\[-0.5cm]\setlength\parindent{2em}
	}
	{
		\vspace{1em}\par
		\noindent\textbf{Keywords:} \@ENGkeywords%\putonbottom{\textbf{Keywords:} \@ENGkeywords}
	}
	% 定义参考文献环境
	\newenvironment{reference}
	{
		\cleardoublepage
		\zihao{-5}
		\setlength{\baselineskip}{12pt}
	}

	% 设置文档默认行距为20pt
	\setlength{\baselineskip}{20pt}
	% 加载cleveref宏，支持智能化引用
	\RequirePackage{cleveref}
	\crefformat{chapter}{第~#2#1#3~章}
  \Crefformat{chapter}{第~#2#1#3~章}
	\crefrangeformat{chapter}{第~#3#1#4~-~#5#2#6~章}
  \Crefrangeformat{chapter}{第~#3#1#4~-~#5#2#6~章}
  \crefmultiformat{chapter}{第~#2#1#3~章}{和第~#2#1#3~章}{,~第~#2#1#3~章}{和第~#2#1#3~章}
  \Crefmultiformat{chapter}{第~#2#1#3~章}{和第~#2#1#3~章}{,~第~#2#1#3~章}{和第~#2#1#3~章}
  \crefrangemultiformat{chapter}{第~#3#1#4~-~#5#2#6~章}{和第~#3#1#4~-~#5#2#6~章}{,~ 第~#3#1#4~-~#5#2#6~章}{和第~#3#1#4~-~#5#2#6~章}
  \Crefrangemultiformat{chapter}{第~#3#1#4~-~#5#2#6~章}{和第~#3#1#4~-~#5#2#6~章}{,~ 第~#3#1#4~-~#5#2#6~章}{和第~#3#1#4~-~#5#2#6~章}

	\crefformat{section}{第~#2#1#3~节}
  \Crefformat{section}{第~#2#1#3~节}
	\crefrangeformat{section}{第~#3#1#4~-~#5#2#6~节}
  \Crefrangeformat{section}{第~#3#1#4~-~#5#2#6~节}
  \crefmultiformat{section}{第~#2#1#3~节}{和第~#2#1#3~节}{,~第~#2#1#3~节}{和第~#2#1#3~节}
  \Crefmultiformat{section}{第~#2#1#3~节}{和第~#2#1#3~节}{,~第~#2#1#3~节}{和第~#2#1#3~节}
  \crefrangemultiformat{section}{第~#3#1#4~-~#5#2#6~节}{和第~#3#1#4~-~#5#2#6~节}{,~ 第~#3#1#4~-~#5#2#6~节}{和第~#3#1#4~-~#5#2#6~节}
  \Crefrangemultiformat{section}{第~#3#1#4~-~#5#2#6~节}{和第~#3#1#4~-~#5#2#6~节}{,~ 第~#3#1#4~-~#5#2#6~节}{和第~#3#1#4~-~#5#2#6~节}

	\crefformat{subsection}{第~#2#1#3~小节}
  \Crefformat{subsection}{第~#2#1#3~小节}
	\crefrangeformat{subsection}{第~#3#1#4~-~#5#2#6~小节}
  \Crefrangeformat{subsection}{第~#3#1#4~-~#5#2#6~小节}
  \crefmultiformat{subsection}{第~#2#1#3~小节}{和第~#2#1#3~小节}{,~第~#2#1#3~小节}{和第~#2#1#3~小节}
  \Crefmultiformat{subsection}{第~#2#1#3~小节}{和第~#2#1#3~小节}{,~第~#2#1#3~小节}{和第~#2#1#3~小节}
  \crefrangemultiformat{subsection}{第~#3#1#4~-~#5#2#6~小节}{和第~#3#1#4~-~#5#2#6~小节}{,~ 第~#3#1#4~-~#5#2#6~小节}{和第~#3#1#4~-~#5#2#6~小节}
  \Crefrangemultiformat{subsection}{第~#3#1#4~-~#5#2#6~小节}{和第~#3#1#4~-~#5#2#6~小节}{,~ 第~#3#1#4~-~#5#2#6~小节}{和第~#3#1#4~-~#5#2#6~小节}

	\crefformat{subsubsection}{第~#2#1#3~项}
  \Crefformat{subsubsection}{第~#2#1#3~项}
	\crefrangeformat{subsubsection}{第~#3#1#4~-~#5#2#6~项}
  \Crefrangeformat{subsubsection}{第~#3#1#4~-~#5#2#6~项}
  \crefmultiformat{subsubsection}{第~#2#1#3~项}{和第~#2#1#3~项}{,~第~#2#1#3~项}{和第~#2#1#3~项}
  \Crefmultiformat{subsubsection}{第~#2#1#3~项}{和第~#2#1#3~项}{,~第~#2#1#3~项}{和第~#2#1#3~项}
  \crefrangemultiformat{subsubsection}{第~#3#1#4~-~#5#2#6~项}{和第~#3#1#4~-~#5#2#6~项}{,~ 第~#3#1#4~-~#5#2#6~项}{和第~#3#1#4~-~#5#2#6~项}
  \Crefrangemultiformat{subsubsection}{第~#3#1#4~-~#5#2#6~项}{和第~#3#1#4~-~#5#2#6~项}{,~ 第~#3#1#4~-~#5#2#6~项}{和第~#3#1#4~-~#5#2#6~项}

	\crefname{table}{表}{表}
  \Crefname{table}{表}{表}
	\creflabelformat{table}{#2#1#3~}
	\crefrangelabelformat{table}{#3#1#4~-~#5#2#6~}
  \crefmultiformat{table}{表~#2#1#3}{和表~#2#1#3}{,~表~#2#1#3}{和表~#2#1#3}
  \Crefmultiformat{table}{表~#2#1#3}{和表~#2#1#3}{,~表~#2#1#3}{和表~#2#1#3}
  \crefrangemultiformat{table}{表~#3#1#4~-~#5#2#6}{和表~#3#1#4~-~#5#2#6}{,~表~#3#1#4~-~#5#2#6}{和表~#3#1#4~-~#5#2#6}
  \Crefrangemultiformat{table}{表~#3#1#4~-~#5#2#6}{和表~#3#1#4~-~#5#2#6}{,~表~#3#1#4~-~#5#2#6}{和表~#3#1#4~-~#5#2#6}

	\crefname{figure}{图}{图}
  \Crefname{figure}{图}{图}
	\creflabelformat{figure}{#2#1#3~}
	\crefrangelabelformat{figure}{#3#1#4~-~#5#2#6~}
  \crefmultiformat{figure}{图~#2#1#3}{和图~#2#1#3}{,~图~#2#1#3}{和图~#2#1#3}
  \Crefmultiformat{figure}{图~#2#1#3}{和图~#2#1#3}{,~图~#2#1#3}{和图~#2#1#3}
  \crefrangemultiformat{figure}{图~#3#1#4~-~#5#2#6}{和图~#3#1#4~-~#5#2#6}{,~图~#3#1#4~-~#5#2#6}{和图~#3#1#4~-~#5#2#6}
  \Crefrangemultiformat{figure}{图~#3#1#4~-~#5#2#6}{和图~#3#1#4~-~#5#2#6}{,~图~#3#1#4~-~#5#2#6}{和图~#3#1#4~-~#5#2#6}

	\crefname{equation}{式}{式}
  \Crefname{equation}{式}{式}
	\creflabelformat{equation}{(#2#1#3)~}
	\crefrangelabelformat{equation}{(#3#1#4)~-~(#5#2#6)~}
  \crefmultiformat{equation}{式~(#2#1#3)}{和式~(#2#1#3)}{,~式~(#2#1#3)}{和式~(#2#1#3)}
  \Crefmultiformat{equation}{式~(#2#1#3)}{和式~(#2#1#3)}{,~式~(#2#1#3)}{和式~(#2#1#3)}
  \crefrangemultiformat{equation}{式~(#3#1#4)~-~(#5#2#6)}{和式~(#3#1#4)~-~(#5#2#6)}{,~式~(#3#1#4)~-~(#5#2#6)}{和式~(#3#1#4)~-~(#5#2#6)}
  \Crefrangemultiformat{equation}{式~(#3#1#4)~-~(#5#2#6)}{和式~(#3#1#4)~-~(#5#2#6)}{,~式~(#3#1#4)~-~(#5#2#6)}{和式~(#3#1#4)~-~(#5#2#6)}

  \crefformat{page}{第~#2#1#3~页}
  \Crefformat{page}{第~#2#1#3~页}
  \crefrangeformat{page}{第~#3#1#4~-~#5#2#6~页}
  \Crefrangeformat{page}{第~#3#1#4~-~#5#2#6~页}
  \crefmultiformat{page}{第~#2#1#3~页}{和第~#2#1#3~页}{,~第~#2#1#3~页}{和第~#2#1#3~页}
  \Crefmultiformat{page}{第~#2#1#3~页}{和第~#2#1#3~页}{,~第~#2#1#3~页}{和第~#2#1#3~页}
  \crefrangemultiformat{page}{第~#3#1#4~-~#5#2#6~页}{和第~#3#1#4~-~#5#2#6~页}{,~ 第~#3#1#4~-~#5#2#6~页}{和第~#3#1#4~-~#5#2#6~页}
  \Crefrangemultiformat{page}{第~#3#1#4~-~#5#2#6~页}{和第~#3#1#4~-~#5#2#6~页}{,~ 第~#3#1#4~-~#5#2#6~页}{和第~#3#1#4~-~#5#2#6~页}



	\newcommand{\crefpairconjunction}{,}
	\newcommand{\crefmiddleconjunction}{,}
	\newcommand{\creflastconjunction}{,}
	\newcommand{\crefrangeconjunction}{-}
	% 加载配置文件
	\AtEndOfClass{\input{../Template/scuthesis.def}}
	\endinput
