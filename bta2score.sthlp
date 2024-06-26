{smcl}
{* *! version 1.3 31May2024}{...}
{viewerdialog bta2score "dialog bta2score"}{...}
{viewerjumpto "Syntax" "bta2score##syntax"}{...}
{viewerjumpto "Description" "bta2score##description"}{...}
{viewerjumpto "Options" "bta2score##options"}{...}
{viewerjumpto "Examples" "bta2score##examples"}{...}
{viewerjumpto "Author" "bta2score##authors"}{...}

{p2col:{bf:bta2score}}Beta to score 

{marker syntax}{...}
{title:Syntax}


{phang}{cmd:bta2score} {cmd:,} [{opt name:(string)} {opt dec:imal(numlist)} {opt tab:ulation} {opt keep:cons} {opt replace:} {opt cstat:} {opt dstat:} {opt aic:} {opt bic:} {opt gof:} {opt rsqaure:}]


{marker description}{...}
{title:Description}

{p 10 5 3}
	The bta2score (stands for beta to score) command creates a rounded item score and a total score from regression coefficients to be used as rapid decision-making tool in urgent clinical conditions. It converts post-estimation coefficients derived from regression commands; regress, glm, logistic, logit, ologit and stcox. It is essential to note that when using ordinal logistic regression to construct score items, only one odds ratio for each variable is required. Each regression coefficient will be converted into a discrete integer or with a specific decimal point, such as 0.5. The command adds the item scores into a total score. This approach is designed for bedside evaluation in urgent clinical conditions, to ensure that the score is promptly available for immediate use, without the use of computer or an application. This is very similar and analogous to the well-known tools like Alvarado score, APGAR score, Ottawa ankle rule, and Glasgow Coma Scale.

{p 10 5 3}
The bta2score extracts and rounds regression coefficients (from continuous or indicator (i.), categorical, or binary variables into a discrete integer or with 0.5 score. The algorithm comprises of

{p 10 5 3}
1. Division: dividing each regression coefficient by the smallest number of regression coefficient within the multivariable model, retaining the vector (direction) of the negative coefficient.

{p 10 5 3}
2. Rounding: rounding up (or down) the divided coefficient with a user-specified nearest integer.

{p 10 5 3}
3. Summation: summing the item score to a Newvar variable.

{p 10 5 3}
User-prespecify Newvar can build a wide range of decimal-rounded scores, building many easy-to-calculate scores.

{marker options}{...}
{title:Options}

{p2colset 10 25 25 3}{...}
{p2col:{opt name:(string)}}Specify the score name. Default is score.{p_end}

{p2col:{opt dec:imal}}Specify the item score decimal digits. Default is zero, rounded to an integer.{p_end}

{p2col:{opt tab:ulation}}Tabulate the item scores and the rounded score. Default is no show.{p_end}

{p2col:{opt keep:cons}}Keep the regression constant (_cons) as one of the predictors. Default is excluding the constant term.{p_end}

{p2col:{opt replace:}}Replace the previous sum score variable generated by bta2score. Previous estimation will be deleted and replaced. Default is warning before replacing.{p_end}

{p2col:{opt cstat:}}Report Harrell's C-statistic for binary endpoint. Compatible with regress, glm, logit, logistic, and stcox.{p_end}

{p2col:{opt dstat:}}Report Somer's D-statistic for survival endpoint. Compatible with stcox.{p_end}

{p2col:{opt aic:}}Report Akaike's information criterion.{p_end}

{p2col:{opt bic:}}Report Bayesian information criterion.{p_end}

{p2col:{opt gof:}}Report Hosmer-Lemeshow Goodness-of-fit p-value.{p_end}

{p2col:{opt rsquare:}}Report R-square.{p_end}
{p2colreset}{...}

{marker examples}{...}
{title:Examples}

{p 5 5 3}
Import Hosmer & Lemeshow low birth weight example dataset

{phang2}{stata webuse lbw,clear}

{p 5 5 3}
Estimate logistic regression with potential predictors for low birth weight

{phang2}{stata logistic low i.race smoke i.ht i.ui}

{p 5 5 3}
Immediately do after regression with specify name of the new score “lbwscore” predict the probability of low birth weight on the round-to-0.5 score. Show the score assignment table. Also reports AIC, BIC, C-statistic.

{phang2}{stata bta2score, name(lbwscore) tabulation decimal(0.5) aic bic cstat}

{p 5 5 3}Determine discrimination index with AuROC by roctab

{phang2}{stata roctab low lbwscore, graph detail}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:bta2score} stores the following in {cmd:r()}:

{synoptset 15 tabbed}{...}
{p2col 5 15 15 2: Scalars}{p_end}
{synopt:{cmd:r(cstat)}}Harrell's C-statistic{p_end}
{synopt:{cmd:r(dstat)}}Somer's D-statistic{p_end}
{synopt:{cmd:r(aic)}}Akaike's information criterion{p_end}
{synopt:{cmd:r(bic)}}Bayesian information criterion{p_end}
{synopt:{cmd:r(gof)}}Hosmer-Lemeshow Goodness-of-fit p-value{p_end}
{synopt:{cmd:r(rsquare)}}R-square{p_end}

{p2col 5 15 15 2: Macros}{p_end}
{synopt:{cmd:r(name)}}Score name{p_end}
{synopt:{cmd:r(endpoint)}}Endpoint variable{p_end}

{p2col 5 15 15 2: Matrix}{p_end}
{synopt:{cmd:r(coef)}}Original coefficient matrix{p_end}


{marker author}{...}
{title:Authors}

{p 5 5 3}
Suppachai Lawanaskol, MD{p_end}
{p 5 5 3}
Chaiprakarn hospital, Chiang Mai, Thailand{p_end}
{p 5 5 3}
Email suppachai.lawanaskol@gmail.com{p_end}

{p 5 5 3}
Jayanton Patumanond, MD, DSc{p_end}
{p 5 5 3}
Center of Clinical Epidemiology and Clinical Statistics, Faculty of Medicine, Chiang Mai University, Chiang Mai, Thailand{p_end}
{p 5 5 3}
Email jpatumanond@gmail.com{p_end}
