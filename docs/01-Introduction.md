

# About the Cluster


## Cluster Facts

The cluster has one multipurpose login node and three identical worker nodes. It has a total of 144 processing cores and 1500 gigabytes of memory. The login node also functions as the parallel filesystem for all of the workers, with 140TB of RAID-redundant disk space. This means that workers can access data stored in your home directory, which makes input and output staging extremely easy.

The cluster runs the CentOS Linux operating system, version 7.4. You can interact with it as you would with any command line based linux distribution. A full list of installed software packages and modules will be posted on this wiki.

## Interacting with the Login Node

The only machine you should ever need to interact with is the login node, mayo. If you need help getting access to the machine, please see the Getting Connected section.

When you log in to mayo, you will receive a bunch of information, including a system summary and a message from the admins, which is copied below.

```
*   This machine is for transfering files on and off the BLT computational
*   infrastructure. Please DO NOT run any jobs on this machine. Please login 
*   to the server "mayo.blt.lclark.edu" to use the cloud and run
*   jobs from that machine. 
*
*   If we find jobs running on this machine the BLT Admins will kill them to ensure
*   other users will not be effected.
*
*   Users are given 25G of space for free and users can check their usage
*   using the command "quota -s". If you need more space for your project
*   please contact BLT Admins or IT support for details.
```

As this message suggests, please do not run any compute-intensive jobs from the login node. It is intended to be a place to set up workflows to be run, store data files, stage data into and out of the workers, and exist as a human interaction layer so that users don't need to deal with things like scheduler abstraction.

When you log in, you will find a number of hidden files in your home directory. (If you're curious, they can be listed with the command ls -a and will be the files that start with a dot (".")) Please do not remove these files as they store important information that the cluster needs access to. You will also find an empty directory called perl5. If you have specific perl libraries you need, you can install them there. If you are not using perl, you can safely ignore or delete this directory.

Feel free to keep whatever data you need in your home directory. It is important to keep your directory organized in a reasonable way in order to ensure that you (and the worker nodes) will always be able to find the needed data efficiently. Also, feel free to look at what programs are installed in /local/cluster/bin, as these programs will always be able to run from any of the workers.

Once you feel comfortable interacting with the login node and are ready to start to submit compute jobs, please continue to the Submitting Jobs page.
