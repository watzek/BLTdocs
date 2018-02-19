# Parsl Workflows

## About Parsl

Parsl is a Python-based parallel scripting library that supports development and execution of asynchronous and parallel data-oriented workflows (dataflows). These workflows glue together existing executables (called Apps) and Python functions with control logic written in Python. Parsl brings implicit parallel execution to standard Python scripts. Parsl documentation is available (here)[http://parsl.readthedocs.io/en/latest/].

## Using Parsl

Using parsl is a lot like using plain python. You define scripts that can be run the same way as you would normally run a python script: ```python3 parsl_script.py```. The main difference with parsl scripts is that they don't execute on the machine they are run from. The parsl script will provision itself resources on the worker nodes of the cluster and manage where to run jobs without any human intervention. To accomplish this, instead of returning results directly, parsl returns futures. A future is a promise that a function will return a value, usually of a specific type. The future allows parsl to have an understanding of what will be returned from all of the apps it needs to run. This helps parsl to calculate what apps can be run at the same time.

## Parsl Configuration

Parsl requires a configuration in order to understand what kind of an environment in which it is running. On this system, the configuration should be very similar to the example below:

```
config = {
    "sites": [{
        "site": "Local_IPP",
        "auth": {
            "channel": "local"
        },
        "execution": {
            "executor": "ipp",
            "provider": "sge",
            "script_dir": ".scripts",
            "scriptDir": ".scripts",
            "block": {
                "nodes": 1,
                "taskBlocks": 1,
                "walltime": "00:05:00",
                "initBlocks": 1,
                "minBlocks": YOUR_MIN_CORES_HERE,
                "maxBlocks": YOUR_MAX_CORES_HERE,
                "scriptDir": ".",
                "options": {
                    "partition": "debug"
                }
            }
        }
    }],
    "globals": {"lazyErrors": True},
    "controller": {"profile": "default"},
}
```

The parsl configuration is a python object, so the example can be pasted into your python script at the top, along with the following line of code:

```
dfk = DataFlowKernel(config=config)
```

## Defining a Parsl Workflow

After that, you are ready to start defining your workflow. Here is an example workflow which calculates pi by generating random numbers:

```
@App('python', dfk)
def pi(total):
    # App functions have to import modules they will use.                                            
    import random
    # Set the size of the box (edge length) in which we drop random points                           
    edge_length = 10000
    center = edge_length / 2
    c2 = center ** 2
    count = 0

    for i in range(total):
        # Drop a random point in the box.                                                            
        x, y = random.randint(1, edge_length), random.randint(1, edge_length)
        # Count points within the circle                                                             
        if (x - center)**2 + (y - center)**2 < c2:
            count += 1

    return (count * 4 / total)


@App('python', dfk)
def avg_n(inputs=[]):
    return sum(inputs) / len(inputs)

if __name__ == '__main__':
    # Call the workflow:                                                                                 
    sims = [pi(10**6) for i in range(10)]
    avg_pi = avg_n([task.result() for task in sims])

    # Print the results                                                                                  
    print("Average: {0:.12f}".format(avg_pi.result()))

```

You will notice a couple of things that are different from regular python. First, above each app is a decorator ( ```@App('python', dfk) ```). This tells parsl that the app should be run on a worker machine, and not as a normal python function.

Second, the apps which take inputs have a special reserved parameter (```inputs```), which you can pass parsl futures into. Passing a future into an app will make the app wait for the result of the future before it runs the app.

Another important thing to remember is that all packages you use (anything you would use the ```import``` statement for) must be imported from within the app, otherwise it will not be accessible from the worker. You can see this in the example here with the ```random``` library.

## Running a Parsl Workflow

After you have the proper configuration and workflow definition, you are ready to run your workflow! Make sure the workflow is in a python file on the login node (mayo) and run it like this: ```python3 /path/to/your/workflow/file```

## Video Tutorial

coming soon....
