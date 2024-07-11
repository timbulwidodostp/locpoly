{smcl}
{* 20nov2006}{...}
{hline}
help for {hi:locpoly}{right:(SJ6-4: st0053_3; SJ5-2: st0053_2;}
{right:SJ5-1: st0053_1; SJ3-4: st0053)}
{right:dialog: {dialog locpoly}}
{hline}

{title:Kernel-weighted local polynomial regression}

{p 8 17 2}{cmd:locpoly} {it:yvar} {it:xvar} 
[{cmd:if} {it:exp}] [{cmd:in} {it:range}] [{cmd:,} 
{cmdab:d:egree:(}{it:#}{cmd:)} {cmdab:w:idth:(}{it:#}{cmd:)}
{cmd:n(}{it:#}{cmd:)} {cmd:at(}{it:atvar}{cmd:)}
{cmdab:gen:erate:(}[{it:newvarx}] {it:newvary}{cmd:)}
[ {cmdab:ep:anechnikov} | {cmdab:bi:weight} | {cmdab:cos:ine} |
{cmdab:gau:ssian} | {cmdab:par:zen} | {cmdab:rec:tangle} | {cmdab:tri:angle} ]
{cmdab:ado:only} {cmdab:nog:raph} {cmdab:nos:catter}
{cmd:plot(}{it:plot}{cmd:)} {it:line_options} {it:twoway_options}]


{title:Description}

{p 4 4 2}
{cmd:locpoly} produces kernel-weighted local polynomial smooths.


{title:Options}

{p 4 8 2}
{cmd:degree(}{it:#}{cmd:)} specifies the degree of the polynomial to be 
used in the smoothing.  Zero is the default, meaning local mean smoothing.

{p 4 8 2}
{cmd:width(}{it:#}{cmd:)} specifies the halfwidth of the kernel, the
width of the smoothing window around each point.  If {cmd:width()} is not
specified, then the "default" width is used; see {hi:[R] kdensity}.  This 
default is entirely inappropriate for local polynomial smoothing.  
Roll your own.

{p 4 8 2}
{cmd:n(}{it:#}{cmd:)} specifies the number of points at which the
smooth is to be evaluated.  The default is {cmd:min(_N,50)}.

{p 4 8 2}
{cmd:at(}{it:atvar}{cmd:)} specifies a variable that contains the values
at which the smooth should be evaluated.  {cmd:at()} allows you to more
easily obtain smooths for different variables or different
subsamples of a variable and then overlay the estimates for
comparison.

{p 4 8 2}
{cmd:generate(}[{it:newvarx}] {it:newvary}{cmd:)} stores the results of
the estimation.  {it:newvary} will contain the estimated smooth.  
{it:newvarx} will contain the smoothing grid. If 
{cmd:at()} is not specified, then both {it:newvarx} and {it:newvary} must
be specified.  Otherwise, only {it:newvary} is to be specified.

{p 4 8 2}
{cmd:epanechnikov}, {cmd:biweight}, {cmd:cosine}, {cmd:gaussian},
{cmd:parzen}, {cmd:rectangle}, and {cmd:triangle} specify the kernel.
(Actually, {cmd:cosine} specifies the cosine trace as there is no such thing
as a cosine kernel.)  By default, {cmd:epanechnikov}, meaning the Epanechnikov
kernel, is used.

{p 4 8 2}
{cmd:adoonly} suppresses the use of the Stata plugin and instead performs the
necessary regressions entirely using ado code.  That is, the file
{cmd:locpoly.ado} contains a subroutine written in the ado language, and this
subroutine is also implemented as a plugin.  Both produce the same results,
but the plugin is faster.  Thus, the {cmd:adoonly} option provides endless
amusement to those performing speed comparisons.

{p 4 8 2}
{cmd:nograph} suppresses drawing the graph.  This option is often used
in conjunction with {cmd:generate()}.

{p 4 8 2}
{cmd:noscatter} suppresses superimposing a scatterplot of the observed 
data over the smooth.  This option is useful when the number of resulting 
points would be so large so as to clutter the graph.

{p 4 8 2}
{cmd:plot(}{it:plot}{cmd:)} provides a way to add other plots to the generated
graph; see {it:{help plot_option}}.

{p 4 8 2}
{it:line_options} affect the rendition of the plotted line(s); see 
{helpb line}.

{p 4 8 2}
{it:twoway_options} are any of the options documented in 
{it:{help twoway_options}} excluding {cmd:by()}.  These include options for
titling the graph (see {it:{help title_options}}) and options for saving the
graph to disk (see {it:{help saving_option}}).


{title:Examples}

{p 4 8 2}{cmd:. net install locpoly, from("https://raw.githubusercontent.com/timbulwidodostp/locpoly/main/locpoly") replace}

{p 4 8 2}{cmd:. import excel "https://raw.githubusercontent.com/timbulwidodostp/locpoly/main/locpoly/locpoly.xlsx", sheet("Sheet1") firstrow clear}

{p 4 8 2}{cmd:. locpoly accel time, adoonly}

{p 4 8 2}{cmd:. locpoly accel time, degree(3) gaussian width(2) adoonly}

{p 4 8 2}{cmd:. locpoly accel time, degree(2) width(300) generate(xgrid yhat) adoonly}


{title:Also see}

    Manual:  {hi:[R] kdensity}, {hi:[R] lowess}

{p 4 13 2}Online:  {helpb graph}{p_end}
