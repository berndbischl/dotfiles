cluster.functions = makeClusterFunctionsSLURM(
  template = "/home/hpc/ua341/di69fop/bernd/BatchJobs/examples/cfSLURM/lmu_lrz.tmpl",
  list.jobs.cmd = c("squeue", "--clusters=serial", "-h", "-o %i", "-u $USER")
)
mail.start = "none"
mail.done = "none"
mail.error = "none"
default.resources = list(walltime = 3600, memory = 500)
