# Funcx On BLT

## What is Funcx?

## BLT Funcx Offerings
JOIN HPC SLACK IF NOT SURE
CHOOSE ENDPOINT FOR WHAT YOU NEED

The current BLT endpoints available are as follows:
```
+---------------+-------------------------------------------------------+
| Endpoint Name |  Description   |             Endpoint ID              |
+===============+=======================================================+
| blt_small     | 1 core         | 3c3f0b4f-4ae4-4241-8497-d7339972ff4a |
+---------------+-------------------------------------------------------+
| blt_medium    | 4 cores        | a145aa44-abfa-4ff8-8131-2097dcdb90e9 |
+---------------+-------------------------------------------------------+
| blt_large     | 8 cores        | f197c41b-95c3-44ae-8218-35b682319a64 |
+---------------+-------------------------------------------------------+
| blt_xlarge    | 16 cores       | b89de769-d0ce-446c-ae04-bdc19266b566 |
+---------------+-------------------------------------------------------+
| blt_wholenode | 48 cores       | d937af25-8a7e-46e7-a241-68ef4e86b576 |
+---------------+-------------------------------------------------------+
| blt_gpu       | 1 core + 1 gpu | 6d542cd1-140d-47c7-a26a-c0873ec15818 |
+---------------+-------------------------------------------------------+
```

## How to Use Funcx on BLT
TALK ABOUT WHAT YOU'RE DOING IN CODE


VIRTUAL ENVIRONMENT   MAKE FIRST TIME, ACTIVATE NEXT

First, you will need to install the funcx module for Python. 
```
pip[3] install funcx ONLY HAPPENS FIRST TIME
```
PYTHON3.6+ ONLY
Next, run Python3 or ipython3 in a terminal and enter in the following lines:
```
from funcx.sdk.client import FuncXClient    
fxc = FuncXClient()   INITIALIZING CONNECTION TO FUNCX
```
Here, you will be given a URL. Copy and paste the URL into a web browser, and follow the instructions. *lOG IN WITH LC CREDS* Once you log in, it will output an authorization code. Copy and paste it back into the terminal. GLOBUS GROUP*https://app.globus.org/groups/c1f52348-140b-11eb-b43d-0ebeaabad955/about* [link](https//:link.com)    ONLY HAPPENS FIRST TIME (POSSIBLE YOU NEED TO LOG IN AGAIN)

The next step is to define a function containing the program you would like to run. As an example:
```
def your_program():
  return "This is your program!"
```
On the next line, you will register your function with Funcx. Enter in the name of the function you defined where it says "your_program":
```
func_uuid = fxc.register_function(your_program)   REGISTERING FUNCTION AND GETTING AN ID FOR IT
```
Next, you will define which endpoint you will be using for you work. From the list available and activated endpoints, select the one which will best suit your needs. Once chosen, copy and Endpoint ID and replace "your_endpoint_id" with the ID: LIST IN DIFFEENT SECTINO OF DOCUMENT SEE LIST
```
blt_ep = "your_endpoint_id"   EACH HAVE UNIQUE IDENTIFIER
/* For example: blt_ep = "8e1bc858-feda-42b3-8b7a-5a058c0ef6ec" */
```
The second to last step is to send your program to BLT:
```
res = fxc.run(endpoint_id=blt_ep, function_id=func_uuid)    RUNNING FUNCTION ON ENDPOINT ON BLT
```
It may take several minutes for BLT to prepare your results. After waiting, enter in the final line of code:
```
print(fxc.get_result(res))    OBTAINING THE RESULT
```

EXCEPTION IS NORMAL (COPY AND PASTE EXCEPTION)

CONGRATS
## External Links
