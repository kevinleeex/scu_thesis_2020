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

% 此宏包提供了方便使用的命令用于设置页面布局。
\RequirePackage{geometry}
% 设定页面布局。左边距 2.5cm，右边距 2cm，上边距 2.5cm，下边距 2.5cm，版心 215×145mm
\geometry{a4paper,left=2.5cm,right=2cm,top=2.5cm,bottom=2.5cm,height=215mm,width=145mm}

% 设定页眉、页脚样式。
\fancypagestyle{plain}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[RE]{\zihao{-5}\songti\rightmark}
\fancyhead[RO]{\zihao{-5}\songti\leftmark}
\fancyhead[LO,LE]{\zihao{-5}\songti\label@university\thesisname}
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
\newcommand\defensedate[1]{\def\@defensedate{#1}}
\newcommand\keywords[1]{\def\@keywords{#1}}
\newcommand\ENGkeywords[1]{\def\@ENGkeywords{#1}}
% 判断论文类别，定义不同论文名称
\ifthenelse{\equal{\thesistype}{0}}{\def\thesisname{博士学位论文}}{}
\ifthenelse{\equal{\thesistype}{1}}{\def\thesisname{硕士学位论文}}{}
\ifthenelse{\equal{\thesistype}{2}}{\def\thesisname{学士学位论文}}{}


% 此命令用下划线填充指定的空间。
\newcommand{\fillinblank}[2]{\CJKunderline{\makebox[#1]{#2}}}
% 此命令将对象放到页面底部。
\newcommand{\putonbottom}[1]{\begin{figure}[b!]%
	\begin{minipage}{\textwidth}{#1}\end{minipage}\end{figure}}


% 设定标题页格式。
\renewcommand\maketitle
{
  \cleardoublepage
  \begin{titlepage}
    \begin{center}
    % 校名和论文类别
    {
      \ \\[1.5cm]
      \includegraphics[width=8cm]{../Template/Components/Images/SCU_TITLE}\\[1.5cm]
  		{\makebox[10.5cm][s]{\zihao{-0}\heiti\thesisname}}

    }
    \end{center}
  \end{titlepage}
}

\AtEndOfClass{\input{../Template/scuthesis.def}}
\endinput
