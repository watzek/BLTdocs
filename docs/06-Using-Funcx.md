# Funcx On BLT

## What is Funcx?

## BLT Funcx Offerings
If you ever need any help, feel free to join the HPC Slack Channel to ask questions: INSERT INVITE HERE

Choose the endpoint that best suits your need. The current BLT endpoints available are as follows:
```
+---------------+----------------+--------------------------------------+
| Endpoint Name |  Description   |             Endpoint ID              |
+===============+================+======================================+
| blt_small     | 1 core         | 3c3f0b4f-4ae4-4241-8497-d7339972ff4a |
+---------------+----------------+--------------------------------------+
| blt_medium    | 4 cores        | a145aa44-abfa-4ff8-8131-2097dcdb90e9 |
+---------------+----------------+--------------------------------------+
| blt_large     | 8 cores        | f197c41b-95c3-44ae-8218-35b682319a64 |
+---------------+----------------+--------------------------------------+
| blt_xlarge    | 16 cores       | b89de769-d0ce-446c-ae04-bdc19266b566 |
+---------------+----------------+--------------------------------------+
| blt_wholenode | 48 cores       | d937af25-8a7e-46e7-a241-68ef4e86b576 |
+---------------+----------------+--------------------------------------+
| blt_gpu       | 1 core + 1 gpu | 6d542cd1-140d-47c7-a26a-c0873ec15818 |
+---------------+----------------+--------------------------------------+
```

## How to Use Funcx on BLT
We recommend that you setup a virtual environment. This step is optional and only a suggestion.
```
pip[3] install virtualenv
virtualenv funcx
source funcx/bin/activate
```
You can name your virtual environment whatever you like. Once you either setup a virtual environment or not, continue on to running your program. Before you do so, you will need to install the funcx module for Python. You will only have to do this on your first time (NOTE: requires at least Python 3.6):
```
pip[3] install funcx
```
Next, run Python3 or ipython3 in a terminal and enter in the following lines:
```
from funcx.sdk.client import FuncXClient    
fxc = FuncXClient()
```
Here, you are initializing your connection to funcx. After you enter these lines of code, you will be given a URL. Copy and paste the URL into a web browser, and follow the instructions. When prompted to, log in with your Lewis & Clark credentials. Once you log in, it will output an authorization code. Copy and paste it back into the terminal. Next, you will need to Globus Group using [this](https://app.globus.org/groups/c1f52348-140b-11eb-b43d-0ebeaabad955/about) link. Both of these actions will only have to be completed on your first time. However, it is possible you may need to log in again.

The next step is to define a function containing the program you would like to run. As an example:
```
def your_program():
  return "This is your program!"
```
On the next line, you will register your function with Funcx and get an ID for your function. Enter in the name of the function you defined where it says "your_program":
```
func_uuid = fxc.register_function(your_program)
```
Next, you will define which endpoint you will be using for you work. From the list of available endpoints (see above), select the one which will best suit your needs. Once chosen, copy and paste the Endpoint ID and replace "your_endpoint_id" with the unique ID:
```
blt_ep = "your_endpoint_id"
```
For example:
```
blt_endpoint = "8e1bc858-feda-42b3-8b7a-5a058c0ef6ec"
```
The second to last step is to send your program to BLT. Doing this will run your function on the selected Endpoint:
```
res = fxc.run(endpoint_id=blt_endpoint, function_id=func_uuid)
```
NOTE:
An exception will occur, and this is normal. This does not mean that something went wrong and this should happen. It will look something like this:
```
GlobusHTTPResponse({'status': 'Success', 'task_uuid': '185f1bc7-33c8-450f-aea0-f8d865af6eec', 'task_uuids': ['185f1bc7-33c8-450f-aea0-f8d865af6eec']})
```
It may take several minutes for BLT to prepare your results. After waiting, enter in the final line of code to obtain your result:
```
print(fxc.get_result(res))
```
Congrats! You just ran a program on BLT!
## External Links
