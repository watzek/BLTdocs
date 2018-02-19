# Getting Connected

## Accounts
In order to gain access to the cluster, you first need an account. Contact the BLT Admins to request an account.

NOTE: Once you receive a temporary password, please reset it within 5 days of gaining access to the system.

## Getting on the network

The BLT cluster is quite isolated from LC's public-facing infrastructure. In order to connect to it, you will need a copy of Cisco AnyConnect secure mobility client, which is available to LC students, faculty, and staff HERE.

If you are using Linux to connect to the cluster, the current version of Cisco AnyConnect will fail to install. Luckily, there is an open-source equivalent called OpenConnect, which installs as a menu option for debian and redhat based OSes. You will need to open your network settings and click the green plus button to add a new connection, and then select VPN when prompted. After that, put in ```vpn.lclark.edu``` for the gateway option and the same root CA certificate as you used when setting up LC secure. After you click save, it will ask for your LC id and password.

After you have installed and started AnyConnect:

1. Start a VPN session by typing ```vpn.lclark.edu``` in the text box and clicking "connect"
2. When prompted, put in your LC username and password for access
Now, your computer is connected to the same virtual network as the cluster.


## Logging In

NOTE: In order to log in, you will need an SSH client. If you are using a Mac or Linux machine, you already have one. If you are using Windows, you will need to install PuTTY or similar.

1. Open your SSH client
  + On Mac Press the space bar and command key at the same time. then type "Terminal" and hit return
  + On Linux Open a terminal window
  + On Windows Open PuTTY
2. Log In!
  + On Mac or Linux type ```ssh <lclark username>@mayo.blt.lclark.edu``` and type your password when prompted
  + On Windows Open PuTTY, set "Host Name" to mayo.blt.lclark.edu and click "Open", and follow the prompt.
Congratulations! You have logged in to the BLT cluster! See Using the Cluster for more information about what you can do.
