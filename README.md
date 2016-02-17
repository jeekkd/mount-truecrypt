Purpose
===

The purpose of this script is to make mounting truecrypt
containers simpler and easier. 

While there is TrueCrypt and VeraCrypt GUI programs that
will fulfill this, those who prefer to maintain a light 
system may prefer a script instead or merely prefer a 
simple solution to a simple job.

How to use 
===

**Do the following;**

  - This will make the script readable, writable, and executable to root and your user. Next, open the script in your text editor of choice.

sudo chmod 770 mount_truecrypt.sh 

 - You need to edit the variables in the highlighted variables section near the top.

gedit mount_truecrypt.sh

- Next, you will want to make sure you've saved and then launch the script by doing the following;

sudo bash mount_truecrypt.sh 

> **Notices:**
> 
> - You may need to open your file manager as root to have full access to the mounted container.
> - Make sure you have cryptsetup, most distributions will have this but check just encase.
