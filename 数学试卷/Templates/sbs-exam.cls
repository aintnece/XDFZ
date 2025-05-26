% ===== sbs-exam.cls =====
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sbs-exam}[SBS Exam Template]

% 基类继承
\LoadClass[12pt]{article}

% ===== 必选宏包 =====
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{tabularx}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage{enumitem}
\RequirePackage{titling}
\RequirePackage{multirow}
\RequirePackage{amsmath,amssymb}
\RequirePackage{array}
\RequirePackage{ulem}

% ===== 页面布局 =====
\geometry{
  a4paper,
  top=3cm,
  headheight=3cm,
  headsep=5mm,
  bottom=2cm,
  left=2cm,
  right=2cm
}

% ===== 页眉配置 =====
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\includegraphics[width=2cm]{SBS-logo.png}}

% ===== 第一页页眉强制显示 =====
% 重定义plain样式（用于首页）
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[C]{\includegraphics[width=2cm]{SBS-logo.png}}
}
\thispagestyle{plain} % 强制首页样式

\makeatletter
% ===== 考试信息命令 =====
\newcommand{\examtitle}[1]{
  \gdef\@examtitle{#1} % 定义标题
  }


\newcommand{\examsubject}[4]{
  \gdef\@subject{#1}
  \gdef\@examdate{#2}
  \gdef\@duration{#3}
  \gdef\@teacher{#4}
}

\newcommand{\MarksBreakdown}[6]{
  \gdef\@MCQ{#1} % 选择题分数
  \gdef\@MCQNo{#2} % 选择题数量
  \gdef\@SAQ{#3} % 简答题分数
  \gdef\@SAQNo{#4} % 简答题数量
  \gdef\@LAQ{#5} % 大题分数
  \gdef\@LAQNo{#6} % 大题数量
}

\makeatother

% ===== 注意事项环境 =====
\newenvironment{examnotice}{
  \begin{center}
  \setlength{\fboxrule}{2pt}
\fbox{
    \parbox[c]{0.9\textwidth}{

\medskip
\noindent\textbf{IMPORTANT: Read together before beginning the exam.}

\medskip
\noindent Students must complete the assessments to the best of their ability. Any students found cheating during an exam will be given a zero and referred to the Principal for further disciplinary measures. Cheating is a serious offense.

\medskip
\noindent "Cheating" may include any of the following:
\begin{itemize}[leftmargin=*]
    \item Having course papers, notes, unapproved data sheets or other course-related materials in the exam room without the express permission of the subject class teacher in charge of the exam.
    
    \item Using or even having a cellphone or other electronic device in the exam room without the express permission of the subject class teacher in charge of the exam.
    
    \item Attempting to communicate, either verbally or non-verbally with other students during the exam.
    
    \item Having exam-related materials prior to the writing of the exam.
\end{itemize}

    }
}
\end{center}
}

% ===== 填空线命令 =====
\newcommand{\fillline}[1][0.4pt]{% 默认0.4pt线宽
  \leavevmode\leaders\hrule height #1\hfill\kern0pt%
}
\setlength{\extrarowheight}{4pt}  % 所有表格增加行高

% ===== 评分表命令 =====
\newcommand{\makemarksheet}{

\begin{center}
\begin{tabular}{|p{0.5\textwidth}|p{0.35\textwidth}|}
\hline
\multicolumn{1}{|l|}{\bfseries Mark Breakdown:} & \multirow{3}{*}{Student Name: } \\ 
\cline{1-1}
Part 1: Multiple Choice Questions \@MCQ $\times$ \@MCQNo & \\
Part 2: Short Answer Questions \@SAQ $\times$ \@SAQNo & \\
Part 3: Long Answer Questions \@LAQ $\times$ \@LAQNo & \\

\cline{1-1}
\multicolumn{1}{|l|}{Total Score: 100} & Score: \fillline \\
\hline
\end{tabular}
\end{center}
}

% ===== 考试工具说明框 =====
\newcommand{\examtools}{
  \begin{center}
\fbox{
    \parbox[c]{0.9\textwidth}{

\noindent\textbf{Special Instructions/Materials Allowed:}
\begin{itemize}[leftmargin=*, itemsep=1pt]
    \item Pen
    \item Calculator
\end{itemize}
    }
}
\end{center}
}

% ===== 重定义maketitle =====

% 重定义maketitle结构
\renewcommand{\maketitle}{ 
  \begin{center}
  \pretitle{\begin{center}\vspace*{-1.5cm}} % 必须在标题内容前定义
  \posttitle{\end{center}\vspace*{-3cm}}
    {\large Sino Bright School Chongqing \\}
    \vspace{0.5cm}
    {\LARGE\bfseries \@examtitle \\}
    \vspace{1cm}
    \begin{tabular}{ll}
      Subject: & \@subject \\
      Date: & \@examdate \\
      Time: & \@duration \\
      Teacher: & \@teacher \\
    \end{tabular}
  \end{center}
}