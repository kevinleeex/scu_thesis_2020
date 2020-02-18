% 文件名：scuthesis.cls
% 文件描述：以 ctexbook 文档类为基础，定义四川大学学位论文文档类
% 作者：LegendaryLeo
% 修改人：Kevin T. Lee [hello@lidengju.com]
% 参考：pkuthss-1.2beta
% 修改日期：2020年1月17日
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{../Template/scuthesis}[2020/01/17 v0.1]
% 声明传入参数，定义对应的论文类别，分别对应博士、硕士和学士学位论文。这里由于tex对中文支持不够，因此不能在此定义论文名称。
\def\approval{0}
\def\colortitle{0}
\DeclareOption{doctor}{\def\thesistype{0}}
\DeclareOption{master}{\def\thesistype{1}}
\DeclareOption{approval}{\def\approval{1}}
\DeclareOption{color}{\def\colortitle{1}}
\DeclareOption{academic}{\def\degreetype{0}}
\DeclareOption{professional}{\def\degreetype{1}}
% 将文档类其他参数全部传递给 ctexbook 文档类。
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% 此文档类以 ctexbook 为基础，设定页面尺寸为 A4，默认字号为小四号。
% CJKfntef 宏包提供了 \maketitle 中用到的 \CJKunderline 命令。
% fancyhdr 宏包提供了方便使用的命令用于设置页眉、页脚。
\LoadClass[fntef, a4paper, fancyhdr, cs4size,UTF8,hyperref,twoside,openright]{ctexbook}
% 加入判断支持
\RequirePackage{ifthen}
% 此宏包提供图形支持。
\RequirePackage{graphicx}
% 此包用以避免目录自引用
\usepackage[nottoc]{tocbibind}
%设置字体
\usepackage{xeCJK}
\usepackage{fontspec} 
\setCJKmonofont{SimSun}
\xeCJKEditPunctStyle{quanjiao}{optimize-kerning=true}
\setmainfont{Times New Roman}
% 设置A4页面
% \RequirePackage{anysize}
% \papersize{29.7cm}{21cm}
% % 左边距 2.5cm，右边距 2.5cm，上边距 2.75cm，下边距2.5cm
% \marginsize{2.5cm}{2.5cm}{2.75cm}{2.5cm}

%使用geometry调整边距
\usepackage{geometry}
\geometry{a4paper,papersize={21cm,29.7cm}}
\geometry{left=2.5cm,right=2.5cm,top=2.75cm,bottom=2.5cm,head=0.3cm,headsep=0.25cm,foot=0.75cm}
\setlength{\topskip}{0cm}

% 这些命令用于设定各项文档信息的具体内容。
% 加入封面标题命令，添加副标题，自行排版
\newcommand\unitid[1]{\def\@unitid{#1}}
\newcommand\STUnumber[1]{\def\@STUnumber{#1}}
\newcommand\CoverTitle[1]{\def\@CoverTitle{#1}}
\newcommand\CoverSubTitle[1]{\def\@CoverSubTitle{#1}}
% \newcommand\title[1]{\def\@title{#1}}
\newcommand\ENGtitle[1]{\def\@ENGtitle{#1}}
\newcommand\school[1]{\def\@school{#1}}
\newcommand\ENGschool[1]{\def\@ENGschool{#1}}
% \newcommand\author[1]{\def\@author{#1}}
\newcommand\ENGauthor[1]{\def\@ENGauthor{#1}}
\newcommand\supervisor[1]{\def\@supervisor{#1}}
\newcommand\ENGsupervisor[1]{\def\@ENGsupervisor{#1}}
\newcommand\degreeclass[1]{\def\@degreeclass{#1}}
\newcommand\ENGdegreeclass[1]{\def\@ENGdegreeclass{#1}}
\newcommand\major[1]{\def\@major{#1}}
\newcommand\ENGmajor[1]{\def\@ENGmajor{#1}}
\newcommand\hasmajor[1]{\def\@hasmajor{#1}}
\newcommand\defensedate[1]{\def\@defensedate{#1}}
\newcommand\grantdate[1]{\def\@grantdate{#1}}
\newcommand\accomplishdate[1]{\def\@accomplishdate{#1}}
\newcommand\statementdate[1]{\def\@statementdate{#1}}
\newcommand\direction[1]{\def\@direction{#1}}
\newcommand\ENGdirection[1]{\def\@ENGdirection{#1}}
\newcommand\keywords[1]{\def\@keywords{#1}}
\newcommand\ENGkeywords[1]{\def\@ENGkeywords{#1}}
\newcommand\university[1]{\def\@university{#1}}
\newcommand\ENGuniversity[1]{\def\@ENGuniversity{#1}}

% 判断论文类别，定义不同论文名称
\ifthenelse{\equal{\thesistype}{0}}{
	\def\thesisname{博士研究生学位论文}
	\def\CHSauthortype{研究生}
	\def\ENGauthortype{Postgraduate}
  	\def\TypeAbbr{PhD Degree}
	}{}
\ifthenelse{\equal{\thesistype}{1}}{
	\def\thesisname{硕士研究生学位论文}
	\def\CHSauthortype{研究生}
	\def\ENGauthortype{Postgraduate}
  	\def\TypeAbbr{MSc Degree}
	}{}
\ifthenelse{\equal{\degreetype}{0}}{
	\def\proffieldname{学科专业}
	\def\degreename{学术学位}
	}{}
\ifthenelse{\equal{\degreetype}{1}}{
	\def\proffieldname{领域名称}
	\def\degreename{专业学位}
	}{}

	%定义字体格式
	\newcommand{\fontq}{
		\zihao{-3}\heiti
	}
	\newcommand{\fonta}{
		\zihao{3}\songti
	}
\newcommand{\makescucoverhead}
{
	\ifthenelse{\equal{\approval}{0}}{
			\zihao{-4}\songti
			\begin{tabular}{cl}
				{\makebox[2.2cm][s]{\textbf{单位代码：}}}  & \hspace{-10pt}\textbf{\@unitid}\\
				{\makebox[2.2cm][s]{\textbf{学号：}}}       & \hspace{-10pt}\textbf{\@STUnumber}
			\end{tabular}
		}{}
	\ifthenelse{\equal{\approval}{1}}{
			\zihao{-4}\songti
			\begin{tabular}{cl}
				{\makebox[2.2cm][s]{\textbf{单位代码：}}}  & \hspace{-10pt}\textbf{\@unitid}\\
				{\makebox[2.2cm][s]{\textbf{送审编号：}}}       & \hspace{-10pt}\textbf{\@STUnumber}
			\end{tabular}
			
		}{}
	\\[30pt]
}

\newcommand{\makescucoverimage}
{
		\ifthenelse{\equal{\colortitle}{0}}{
			\includegraphics[width=10cm]{./Template/Components/Images/SCU_TITLE_BW}
		}{}
	\ifthenelse{\equal{\colortitle}{1}}{
			\includegraphics[width=8cm]{./Template/Components/Images/SCU_TITLE}
		}{}
	\\[0cm]
	{\makebox[9cm][s]{\zihao{1}\heiti\textbf{\thesisname}}}
	\\[18pt]
	{\makebox[5cm][c]{\zihao{3}\songti\text{（}\degreename\text{）}}}
	\\[47pt]
}



\newcommand{\makescucovertitle}
{
	\begin{tabular}{lc}
		{\heiti\zihao{3}\makebox[1.25cm][s]{\textbf{题目：}}}  & \hspace{-10pt}\fillinblank{10.5cm}{\heiti\zihao{3}\textbf{\@CoverTitle}}
		\\[25pt]
		{\makebox[2cm][s]{}}       & \hspace{-10pt}\fillinblank{10.5cm}{\heiti\zihao{3}\textbf{\@CoverSubTitle}}
	\end{tabular}
	\\[45pt]
}

\newcommand{\makescucovercontent}
{
	%非送审版本
	\ifthenelse{\equal{\approval}{0}}{
		
		\begin{tabular}{cc}
			{\hspace{-0.7cm}\fontq\makebox[2.8cm][l]{培养单位：}}  & \hspace{-0.7cm}\fonta\fillinblank{8cm}{\@school}
			\\[17pt]
			{\hspace{-0.7cm}\fontq\makebox[2.8cm][l]{作者姓名：}}  & \hspace{-0.7cm}\fonta\fillinblank{8cm}{\@author}
			\\[17pt]
			{\hspace{-0.7cm}\fontq\makebox[2.8cm][l]{指导教师：}}       & \hspace{-0.7cm}\fonta\fillinblank{8cm}{\@supervisor}
			\\[17pt]
			{\hspace{-0.7cm}\fontq\makebox[2.8cm][l]{学位类别：}}   & \hspace{-0.7cm}\fonta\fillinblank{8cm}{\@degreeclass}
			\\[17pt]
			{\hspace{-0.7cm}\fontq\makebox[2.8cm][l]{\proffieldname ：}} & \hspace{-0.7cm}\fonta\fillinblank{8cm}{\@major}
		\end{tabular}
		\\[48pt]
		\zihao{3}\songti
		{\makebox[12cm][c]{\text{论文答辩时间：}\@defensedate}}
		\\[12pt]
		{\makebox[12cm][c]{\text{学位授予时间：}\@grantdate}}
		}{}
	%送审版本
	\ifthenelse{\equal{\approval}{1}}{
		\zihao{-3}\kaishu
		\begin{tabular}{cl}
			{\hspace{-0.7cm}\fontq\makebox[2.8cm][l]{学位类别：}}   & \hspace{-0.7cm}\fonta\fillinblank{8cm}{\@degreeclass}
			\\[14pt]
			{\hspace{-0.7cm}\fontq\makebox[2.8cm][]{\proffieldname ：}} & \hspace{-0.7cm}\fonta\fillinblank{8cm}{\@major}
		\end{tabular}
		\\[48pt]
		\zihao{3}\songti
		{\makebox[9cm][s]{\text{论文完成时间}}}
		\\[12pt]
		{\makebox[9cm][c]{\@accomplishdate}}
		}{}
}


% 设定页眉、页脚样式。
% \fancypagestyle{plain}{\fancyhf{}\renewcommand{\headrulewidth}{0.8pt}}
\newcommand{\makefancyhdr}{
	\fancypagestyle{plain}{\pagestyle{fancy}}
	\pagestyle{fancy}
	\fancyhf{}
	\renewcommand{\headrulewidth}{0.8pt}
	\fancyhead[CE]{\zihao{-5}\songti
	   % The chapter title for even page
	   四川大学\thesisname}
	
	\renewcommand{\headrulewidth}{0.8pt}
	\fancyhead[CO]{\zihao{-5}\songti
		% The chapter title for odd page
		\leftmark}
	\fancyfoot[CO,CE]{\zihao{-5}\thepage}
}

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

% 设置标题深度为4
\setcounter{secnumdepth}{4}
% CTEX设置各级标题对齐方式，字号，字体及前后段间距
% “章节”标题，小三号黑体，左对齐，前后段间距为10pt
\CTEXsetup[
	format+={\zihao{3}\rm\heiti\flushleft},
	number={\arabic{chapter}},
	numberformat={\bfseries},
	% 设置序号和各级标题之间为一个空格，这里范例和写作说明不一致
	aftername={\ \ },
	beforeskip={0pt},
	afterskip={18pt}
]{chapter}
% “节”标题，四号黑体，左对齐，前后段间距为10pt
\CTEXsetup[
	format+={\zihao{4}\rm\heiti\flushleft},
	% 设置序号和各级标题之间为两个空格，这里范例和写作说明不一致
	aftername={\ \ },
	beforeskip={10pt},
	afterskip={10pt}
]{section}
% “小节”标题，小四号黑体，左对齐，前后段间距为10pt
\CTEXsetup[
	format+={\zihao{-4}\rm\heiti\flushleft},
	% 设置序号和各级标题之间为一个空格，这里范例和写作说明不一致
	aftername={\ \ },
	beforeskip={10pt},
	afterskip={10pt}
]{subsection}
% “次小节”标题，小四号楷体，左对齐，前后段间距为10pt
\CTEXsetup[
	format+={\zihao{-4}\rm\kaishu\flushleft},
	% 设置序号和各级标题之间为一个空格，这里范例和写作说明不一致
	aftername={\ \ },
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


% 定义\fillinblank命令，用下划线填充指定的空间。
\newcommand{\fillinblank}[2]{
	\CJKunderline[thickness=0.8pt,depth=0.5em]{\makebox[#1]{#2}}
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
\renewcommand\contentsname{目\ 录}
\renewcommand{\cfttoctitlefont}{\hfill\zihao{3}\rm\heiti}
\renewcommand{\cftchapfont}{\zihao{-4}\rm\heiti}
\renewcommand{\cftsecfont}{\zihao{-4}\rm\songti}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforetoctitleskip}{24pt}
\renewcommand{\cftaftertoctitleskip}{10pt}
% 定义引导线格式，为点，点距0.5，章节标题也使用引导线
\renewcommand{\cftdot}{.}
\renewcommand{\cftdotsep}{0.5}
\renewcommand{\cftchapdotsep}{\cftdotsep}
% 定义章节目录项前后距
\setlength{\cftbeforechapskip}{6pt}

% 定义\maketoc命令，将自动生成符合要求的目录。
\newcommand{\maketoc}{
	\cleardoublepage
	\tableofcontents
	\thispagestyle{fancy}
}

% 设定封面页格式。
\renewcommand\maketitle{
	\cleardoublepage
	\begin{titlepage}
		\makescucoverhead
		\begin{center}
			% 校名和论文类别、“四川大学”字样
			\makescucoverimage
			
			%封面论文标题
			\makescucovertitle

			%封面主要内容
			\makescucovercontent

			\end{center}
		\end{titlepage}
		\thispagestyle{empty}
}

%设置英文内页
\newcommand{\makestatement}{
	\ifthenelse{\equal{\approval}{0}}{
		\begin{ENGinner}
		\end{ENGinner}
		\thispagestyle{empty}
		\newpage
		\thispagestyle{empty}
		{
			\makechaptertitlecenter
			\setlength{\baselineskip}{20pt}
			\chapter*{声\ 明}
		本人声明所呈交的学位论文是本人在导师指导下（或联合培养导师组合作指导下）进行的研究工作及取得的研究成果。据我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得四川大学或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。

		本学位论文成果是本人在四川大学读书期间在导师指导下（或联合培养导师组合作指导下）取得的，论文成果归四川大学所有（或联合培养单位共有），特此声明。
		\vspace{4cm}
		\autograph
		}
		\thispagestyle{empty}
		\newpage
		\thispagestyle{empty}
	}{}
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
				\hspace{1.6em}学位论文作者签名：& 导师签名：\\[1cm]
				\hspace{1.6em}签字日期：\quad 年 \quad 月 \quad 日 & 签字日期：\quad 年 \quad 月 \quad 日
			\end{tabular*}
		\end{center}
	}

	\newenvironment{ENGinner}
	{
		\cleardoublepage
		\renewcommand{\baselinestretch}{1.5}

		\begin{center}
			\ \\[12pt]
			\zihao{3}\rm
			\makebox[12cm][c]{
				\textbf{\@ENGtitle}
			}
			\\[5cm]
		\textbf{A dissertation submitted to Sichuan University} \\
		\textbf{in partial fulfillment of the requirements} \\
		\textbf{for the degree of } \\[14pt]
		\textbf{\@ENGdegreeclass} \\
		\ifthenelse{\equal{\@hasmajor}{1}}{
			\textbf{in \@ENGmajor}
		}
		\ \\[29pt]
		\textbf{By} \\
		\textbf{\@ENGauthor}\\
		\textbf{Supervisor: \@ENGsupervisor}\\[3.4cm]
		\textbf{\@ENGschool, Sichuan University, Chengdu, China}\\[0.8cm]
		\textbf{\@statementdate}
		\end{center}
		\ \vspace{0cm}\par
	}{}


	% 定义中文摘要环境
	\newenvironment{CHSabstract}
	{
		\cleardoublepage
		\ \vspace{0cm}\par
		\begin{center}
			\textbf{摘要}
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
			\textbf{Abstract}
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
	% \renewcommand{\baselineskip}{20pt}
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
	\AtEndOfClass{\input{./Template/scuthesis.def}}
	\endinput
