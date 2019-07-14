# enable some unit expensive unit tests and examples with BBMisc function
Sys.setenv(R_EXPENSIVE_EXAMPLE_OK = "TRUE")
Sys.setenv(R_EXPENSIVE_TEST_OK = "TRUE")

options(
  menu.graphics=FALSE, #no popups
  useFancyQuotes = FALSE, #no directional quotes
  max.print = 10000, #stop R from crashing because it prints to much sh**t
  digits = 4, #don't print a million digits
  scipen=2, #use scientific notation for values >10^7
  help_type="html", #html help is nicer than the terminal one
  show.signif.stars=FALSE, # evil evil stars
  deparse.max.lines = 3L, # reduce output of traceback
  Ncpus = parallel::detectCores(),
  mc.cores = parallel::detectCores(),
  devtools.revdep.libpath = "~/revdep_libs",
  browserNLdisabled = TRUE, # better whitespace handling in browser
  java.parameters="-Xrs", # so rJava does not kill session on CTRL-C
  languageserver.default_linters = list()  # disable linting in vim, at some point we could do our own
)

### set locales
#tmp = Sys.setlocale("LC_MESSAGES", "en_US.UTF-8")
#tmp = Sys.setlocale("LC_CTYPE", "en_US.UTF-8")
#rm(tmp)

.Last <- function() {
if(interactive())
  try(savehistory("~/.Rhistory"))
}

if (interactive()) {
  library(utils)
  library(BBmisc)
  suppressPackageStartupMessages(library(devtools))
  library(roxygen2)
  library(testthat)
  loadhistory("~/.Rhistory")
  Sys.setenv(R_HISTSIZE=5000)
  options(error = function() traceback(2)) # enable automatic display of traceback

  messagef("Work dir: %s", getwd())
}


