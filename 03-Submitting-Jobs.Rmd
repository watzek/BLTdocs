# Submitting Jobs

## Checking Usage

At any time, a user can check what the current availability of the cluster is by typing ```SGE_Avail``` on their command line. The output will look something like this:

```
               #HOST  TOTRAM FREERAM    TOTSLOTS             Q  QSLOTS  QFREESLOTS   QSTATUS     QTYPE
               bacon   503.6   500.3          48         all.q      48          48    normal        BP
             lettuce   503.6   500.2          48         all.q      48          48    normal        BP
              tomato   503.6   500.2          48         all.q      48          48    normal        BP

```


Right now, according to this output, there are 3 hosts running: bacon, lettuce, and tomato. They each have 48 total slots and 48 free slots. They each have 500 GB of free RAM as well.

Additionally, users can check what the job queue looks like. Users can see what jobs are waiting to be run and what jobs are currently running. To do this, run the qstat command. If qstat comes back with no output, it means there are no jobs running at the moment. Here is some example output from the qstat command:

```
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
 -----------------------------------------------------------------------------------------------------------------
     62 0.00000 runtime_test     glick        r     01/26/2018 18:59:00                                    1        
     63 0.00000 runitme_test2    glick        qw    01/26/2018 18:59:02                                    1        
     64 0.00000 runtime_test3    glick        qw    01/26/2018 18:59:04                                    1    
```
There are currently 3 jobs on the cluster, all submitted by the user "glick". They are jobs with ids 62,63, and 64. They each take up one slot (another name for a core). One is running, while the other two have state ```qw```, which is short for "Queued and Waiting". This is usually an indication that either the cluster is busy or the scheduler has not yet scheduled the jobs.

## A Note on Data

The home directories, /local/cluster/bin, and a few other things are mounted remotely to all of the worker nodes. This makes life easy. It means that if your script edits, reads, or otherwise depends on data from your home directory, you do not need to move the data, because the workers can access it directly. However, this also means that if your data edited by multiple jobs, there is no way to ensure that it will always be changed in the same order, so keep that in mind.


## Running Python in Virtual Environments

Beginning in 2021, we now encourage everyone to run any Python scripts using virtual environments. This will keep the main Python from getting too unruly with packages, etc. BLT hero Ben Glick set up a program called `venv_man` for doing this fairly easily. 

The general steps are:
* Create a virtual environment (unless you're using one already created)
* Activate the virtual environment
* Run your job using "SGE_Batch" (more on that below)
* Deactivate the virtual environment

### Should I create a Virtual Environment, or use a pre-existing one?
It depends! If you're part of an ongoing research project, or want to use one specific to a subject (e.g. biology or economics), you may want to use one that already exists. Run the following to see a list of existing environments:
```
venv_man -l
```


### Creating Virtual Environments

### Activating Virtual Environments


### Deactivating Virtual Environments


## Jobs on the BLT Cluster

### Grid Engine

BLT uses the GridEngine scheduler system to schedule HPC jobs. There are good docs available on the SGE toolkit [HERE](https://arc.liv.ac.uk/SGE/)

### Batch Jobs

A Batch job is some set of UNIX command line commands which is executed on a single core of a worker node in serial (one after another). Batch jobs can be submitted by using the following command:

```
SGE_Batch -r "<some runtime id>" -c "<a UNIX command or commands>"
```

### Parallel Jobs

Parallel jobs are just like Batch jobs, except that in a parallel job, multiple cores are reserved, rather than a single core. In order to reserve multiple cores, simply add the ```-P``` flag to the SGE_Batch command like so:

```
SGE_Batch -r "<runtime id>" -c "UNIX command" -P <number of processors>
```

### GPU Jobs

To submit a job to the GPU queue, all you need to do is add the `-q gpu.q` option. This will submit your job to the GPU node, which has 4 NVIDIA GeForce GTX2080 ti accelerators.

An example of this is:

```
SGE_Batch -r "<runtime id>" -c "UNIX command" -P <number of processors> -q gpu.q
```

### Deleting A Job

To delete a job, use the `qdel` command. The syntax is as follows:
```
qdel <JOB ID>
```
The job ID can be found from using `qstat`

**Remember that SGE_Batch will not parallelize your code for you. If your code is not meant to run on multiple cores, then using any more than 1 processor core is a waste.**

### Parsl Workflows

Parsl is a python-based workflow management system that we can use to run jobs on the cluster without having to interact with the scheduler at all. They are run the same way that you would run any script on your local machine, and can orchestrate inter-process communication between almost any kind of application needed. In depth documentation about running parsl jobs is available at the [Parsl Workflows](link) page.
