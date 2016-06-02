% 文件名：scuthesis.cls
% 文件描述：以 ctexbook 文档类为基础，定义四川大学学位论文文档类
% 作者：LegendaryLeo
% 参考：pkuthss-1.2beta
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{scuthesis}[2016/05/30 v0.1]
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
\papersize{26cm}{18.5cm}
% 左边距 1.95cm，右边距 1.95cm，上边距 2.25cm，下边距 2.25cm，版心 215×145mm
\marginsize{1.95cm}{1.95cm}{2.25cm}{2.25cm}


\RequirePackage[outdir=./]{epstopdf}

% 此宏包提供了方便使用的命令用于设置页面布局。
%\RequirePackage{geometry}
% 设定页面布局。左边距 2.5cm，右边距 2cm，上边距 2.5cm，下边距 2.5cm，版心 200×135mm
%\geometry{a4paper,twoside,inner=2.5cm,outer=2cm,height=215mm,width=145mm,headheight=0.5cm,headsep=1.5cm,footskip=1.5cm}
%\geometry{a4paper,twoside,inner=2.5cm,outer=2cm,top=3.35cm,bottom=3.35cm}
%\geometry{a4paper,left=2.5cm,right=2cm,top=2.5cm,bottom=2.5cm,includeheadfoot,headheight=1.5cm}
% 设定页眉、页脚样式。
%\fancypagestyle{plain}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}}
\fancypagestyle{plain}{\pagestyle{fancy}}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[RE]{\zihao{-5}\songti\@title}
\fancyhead[RO]{\zihao{-5}\songti\@title}
\fancyhead[LO,LE]{\zihao{-5}\songti\universityname\thesisname}
\fancyfoot[CO,CE]{\zihao{-5}\thepage}

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
% 此命令用于开始不标号的一章。
% 通过 \matkboth 命令设置相应的页眉内容（尽管可能不显示）。

\setcounter{secnumdepth}{4}
\CTEXsetup[
					format+={\zihao{-3}\rm\heiti\flushleft},
					beforeskip={-1cm},
					afterskip={10pt}
					]{chapter}

\CTEXsetup[
					format+={\zihao{4}\rm\heiti\flushleft},
					beforeskip={10pt},
					afterskip={10pt}
					]{section}

\CTEXsetup[
					format+={\zihao{-4}\rm\heiti\flushleft},
					beforeskip={10pt},
					afterskip={10pt}
					]{subsection}

\CTEXsetup[
					format+={\zihao{-4}\rm\kaishu\flushleft},
					beforeskip={10pt},
					afterskip={10pt},
					]{subsubsection}

\renewcommand{\theparagraph}{(\arabic{paragraph})}
\CTEXsetup[
					name={,},
					number={\theparagraph},
					format+={\zihao{-4}\rm\kaishu\flushleft}
					]{paragraph}

\newcommand{\makechaptertitlecenter}{\CTEXsetup[format+={\center}]{chapter}}
\newcommand{\makechaptertitleleft}{\CTEXsetup[format+={\flushleft}]{chapter}}
% 判断论文类别，定义不同论文名称
\ifthenelse{\equal{\thesistype}{0}}{
																		\def\thesisname{博士学位论文}
																		\def\CHSauthortype{研究生}
																		\def\ENGauthortype{Postgraduate}
																		}{}
\ifthenelse{\equal{\thesistype}{1}}{
																		\def\thesisname{硕士学位论文}
																		\def\CHSauthortype{研究生}
																		\def\ENGauthortype{Postgraduate}
																		}{}
\ifthenelse{\equal{\thesistype}{2}}{
																		\def\thesisname{学士学位论文}
																		\def\CHSauthortype{本科生}
																		\def\ENGauthortype{Undergraduate}
																		}{}


% 此命令用下划线填充指定的空间。
\newcommand{\fillinblank}[2]{\CJKunderline{\makebox[#1]{#2}}}
% 此命令将对象放到页面底部。
\newcommand{\putonbottom}[1]{\begin{figure}[b!]%
	\begin{minipage}{\textwidth}{#1}\end{minipage}\end{figure}}

\newcommand{\maketoc}{\thispagestyle{empty}\tableofcontents\pagenumbering{roman}\thispagestyle{fancy}\addcontentsline{toc}{chapter}{目录}}


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
			{\makebox[1.5cm][s]{\textbf{\label@title}}} &\fillinblank{12cm}{\textbf{\@title}} \\[0.7cm]
			{\makebox[1.5cm][s]{\textbf{\label@author}}} &\fillinblank{4cm}{\textbf{\@author}}
			{\makebox[2cm][s]{\textbf{\label@accomplishdate}}} \fillinblank{5.8cm}{\textbf{\@accomplishdate}}
			\end{tabular}
		}
		\\[2.6cm]
		% 培养单位，指导教师，专业等信息
		{
			\zihao{-3}\kaishu
			\begin{tabular}{cc}
			{\makebox[3.2cm][s]{\textbf{\label@university}}} &\fillinblank{6.2cm}{\textbf{\university}}
			\\[0.8cm]
			{\makebox[3.2cm][s]{\textbf{\label@supervisor}}} &\fillinblank{6.2cm}{\textbf{\@supervisor}}
			\\[0.8cm]
			{\makebox[3.2cm][s]{\textbf{\label@major}}} &\fillinblank{6.2cm}{\textbf{\@major}}
			\\[0.8cm]
			{\makebox[3.2cm][s]{\textbf{\label@direction}}} &\fillinblank{6.2cm}{\textbf{\@direction}}
			\\[0.8cm]
			{\makebox[3.2cm][s]{\textbf{\label@defensedate}}} &\fillinblank{6.2cm}{\textbf{\@defensedate}}
			\end{tabular}
		}
    \end{center}
  \end{titlepage}
	\thispagestyle{empty}
}

\newcommand{\specialchap}[1]{
														\chapter*{#1}\markboth{#1}{}
														\addcontentsline{toc}{chapter}{#1}\phantomsection
														}

\newcommand{\autograph}{
												\begin{center}
													\begin{tabular}{ll}
													学位论文作者签名：\hspace{5cm}                          & 导师签名：\hspace{5cm}                                      \\[1cm]
													签字日期：\hspace{1cm}年\hspace{0.5cm}月\hspace{0.5cm}日 & 签字日期：\hspace{1cm}年\hspace{0.5cm}月\hspace{0.5cm}日
													\end{tabular}
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
	\putonbottom{\textbf{关键词：}\@keywords}
}

\newenvironment{ENGabstract}
{
	\cleardoublepage
	\ \vspace{0cm}\par
	\begin{center}
		\zihao{-2}{\@ENGtitle} \\[0.5cm]
		\zihao{-4}
		{\textbf{{\label@ENGmajor}{: }}}{{\@ENGmajor}} \\[0.5cm]
		{\textbf{{\ENGauthortype}{: }}}{{\@ENGauthor}}
		\quad
		{\textbf{{\label@ENGsupervisor}{: }}}{{\@ENGsupervisor}}
	\end{center}
	\ \vspace{0cm}\par
	%\ \\[-0.5cm]\setlength\parindent{2em}
}
{
	\putonbottom{\textbf{Keywords:} \@ENGkeywords}
}

\newenvironment{reference}
{
	\zihao{-5}
	\setlength{\baselineskip}{12pt}
}
{
	\addcontentsline{toc}{chapter}{参考文献}
	\phantomsection
}

\setlength{\baselineskip}{20pt}
\AtEndOfClass{\input{../Template/scuthesis.def}}
\endinput
