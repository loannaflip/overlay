```
                    $$\               $$\           $$\           
                    \__|              \__|          \__|          
$$\   $$\ $$$$$$$\  $$\ $$$$$$\$$$$\  $$\ $$$$$$$\  $$\ $$$$$$$\  
$$ |  $$ |$$  __$$\ $$ |$$  _$$  _$$\ $$ |$$  __$$\ $$ |$$  __$$\ 
$$ |  $$ |$$ |  $$ |$$ |$$ / $$ / $$ |$$ |$$ |  $$ |$$ |$$ |  $$ |
$$ |  $$ |$$ |  $$ |$$ |$$ | $$ | $$ |$$ |$$ |  $$ |$$ |$$ |  $$ |
\$$$$$$  |$$ |  $$ |$$ |$$ | $$ | $$ |$$ |$$ |  $$ |$$ |$$ |  $$ |
 \______/ \__|  \__|\__|\__| \__| \__|\__|\__|  \__|\__|\__|  \__|
                                                                  
                                                                  
                                                $$\                     
                                                $$ |                    
         $$$$$$\ $$\    $$\  $$$$$$\   $$$$$$\  $$ | $$$$$$\  $$\   $$\ 
        $$  __$$\\$$\  $$  |$$  __$$\ $$  __$$\ $$ | \____$$\ $$ |  $$ |
        $$ /  $$ |\$$\$$  / $$$$$$$$ |$$ |  \__|$$ | $$$$$$$ |$$ |  $$ |
        $$ |  $$ | \$$$  /  $$   ____|$$ |      $$ |$$  __$$ |$$ |  $$ |
        \$$$$$$  |  \$  /   \$$$$$$$\ $$ |      $$ |\$$$$$$$ |\$$$$$$$ |
         \______/    \_/     \_______|\__|      \__| \_______| \____$$ |
                                                              $$\   $$ |
                                                              \$$$$$$  |
                                                               \______/  
```

## Using This Repository
There are two main methods for making use of this repository, discussed in the sections below.

### Local Repository
For the [local repository](https://wiki.gentoo.org/wiki/Handbook:Parts/Portage/CustomTree#Defining_a_custom_repository) method, create a `/etc/portage/repos.conf/uniminin.conf` file and add the following:-
```
[uniminin-overlay]
priority = 50
location = /var/db/repos/uniminin-overlay
sync-type = git
sync-uri = https://github.com/Uniminin/uniminin-overlay.git
auto-sync = Yes
```
Then run `<superuser> emaint -r uniminin-overlay sync`, Portage should now find and update the repository.

### Layman
You can also use the Layman tool to add and sync the repository. Execute the following:-
```
<superuser> layman -o https://raw.githubusercontent.com/Uniminin/uniminin-overlay/master/repository.xml -f -a uniminin-overlay
```
