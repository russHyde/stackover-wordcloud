# Make a wordcloud of a stack-overflow user's "tag"s

This app shows a wordcloud, where the word sizes are scaled according to the
number of times a stack-overflow user has answered questions for a particular
tag.

It was developed to work out how to deploy a shiny app to shinyapps.io

Thanks to the developers of {shiny}, {wordcloud} (for generating the wordcloud
image) and {stackr} (for accessing stackoverflow data)

## Define the environment

Use renv inside a conda env !!!!

Initialised the project to use renv

conda env: "shiny-wordcloud" (cloned from shiny-base)
- already has shiny installed

then on loading R, and attempting to run shiny::runApp(), it complained that
shiny was not installed.

Therefore need to install all deployment packages using renv.

So, used install.packages to add
- shiny
- wordcloud
- remotes
- rsconnect (to allow deployment to shinyapps.io)

and used `remotes::install_github("dgrtwo/stackr")`

(indeed, I could have cloned the rstudio-prereqs environment rather than the
shiny-base environment when making shiny-wordcloud)

Then configured rsconnect for pushing to shinyapps.io:
As described at shinyapps.io (rsconnect::setAccountInfo(blah, secret, ....))

```
library(rsconnect)
rsconnect::deployApp()
```
