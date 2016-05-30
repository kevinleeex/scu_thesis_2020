%%文件名：scuthesis.cls
%%文件描述：以 ctexbook 文档类为基础，定义四川大学学位论文文档类
%%作者：LegendaryLeo
%%参考：pkuthss-1.2beta
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{scuthesis}[2016/05/30 v0.1]


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\LoadClass[fntef, a4paper, fancyhdr, cs4size]{ctexbook}

\RequirePackage{graphicx}

\RequirePackage{geometry}
%%版心：215×145mm
\geometry{a4paper,left=2.5cm,right=2cm,top=2.5cm,bottom=2.5cm,height=215mm,width=145mm}


\fancypagestyle{plain}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE]{\small\songti\rightmark}
\fancyhead[RO]
