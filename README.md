Purpose
===

The purpose of this script is to make mounting truecrypt containers simpler and easier. 

While there is TrueCrypt and VeraCrypt GUI programs that will fulfill this, those who prefer to maintain a 
light system may prefer a script instead or merely prefer a simple solution to a simple job.

Pictures
===

![daulton.ca](https://daulton.ca/lib/exe/fetch.php/bash_script_pictures:truecrypt.png?cache=)

How to use 
===

- Lets get the source

```
git clone https://github.com/jeekkd/mount-truecrypt.git && cd mount-truecrypt
```

- This will make the script readable, writable, and executable to root and your user. Next, open the script in your text editor of choice.

```
sudo chmod 770 mount_truecrypt.sh 
```

- You need to edit the variables in the highlighted variables section near the top.

```
gedit mount_truecrypt.sh
```

- Next, you will want to make sure you've saved and then launch the script by doing the following;

```
sudo bash mount_truecrypt.sh 
```

> **Notices:**
> 
> - You may need to open your file manager as root to have full access to the mounted container.
> - Make sure you have cryptsetup, most distributions will have this but check just encase.

Additionally here is how you can add the script to be globally callable from anywhere. This is super convenient 
since you can merely type something such as the following and have the script run:

```
sudo mount_truecrypt
```

Here's how we can do this:

```
# Syntax of doing so:

sudo ln <script location/script name> /usr/local/bin/<name you want to type to launch the script>

# Realistic example:

sudo ln /home/<user>/lazyGit.sh /usr/local/bin/mount_truecrypt
```
