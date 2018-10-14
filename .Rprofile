# enable some unit expensive unit tests and examples with BBMisc function
Sys.setenv(R_EXPENSIVE_EXAMPLE_OK = "TRUE")
Sys.setenv(R_EXPENSIVE_TEST_OK = "TRUE")

options(
  repos = c(CRAN = "https://ftp.gwdg.de/pub/misc/cran/"), 
  BioC_mirror = "http://bioconductor.statistik.tu-dortmund.de",
  browserNLdisabled = TRUE, # better whitespace handling in browser
  deparse.max.lines = 3L, # traceback looks better
  devtools.revdep.libpath = "~/revdep_libs"
)

# create user lib if it does not exist
userlib = Sys.getenv("R_LIBS_USER")
if (userlib != "") {
  if (!file.exists(userlib)) {
    message("Creating empty user lib directory ", userlib)
    dir.create(userlib, recursive = TRUE, mode = "755")
  }
} else {
  message("No user lib")
}

#options(error = function() traceback(2))
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
  library(stringr)
  # do not use colorout, seems to cause problems with testthat
  options(menu.graphics = FALSE)
  loadhistory("~/.Rhistory")
  Sys.setenv(R_HISTSIZE=5000)
  options(digits=4)
  # so rJava does not kill session on CTRL-C
  options(java.parameters="-Xrs")
  # dont use this so we have help pages in vim, well maybe html better
  if (Sys.info()["nodename"] %in% c("x1-lmu", "bischl-x1", "Bischl", "lsweihs-thinkpad", "lwap04", "office-2014", "bischl-NBMSIND", "bischl-x1-5thgen"))
    options(help_type="html")
  ip2 = function(x) {
    install.packages(x)
    lapply(x, require, character.only=TRUE)
    update.packages(instlib=.libPaths()[1])
  }
  messagef("Work dir: %s", getwd())

  testme = function(filter) {
    load_all(".")
    test_dir("tests/testthat/", filter = filter) 
  }
  
  helpme = function(name) {
    roxygenize(".")
    load_all(".") 
    dev_help(name) 
  }
}


