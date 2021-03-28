# Overlay
loannaflip's portage overlay for Gentoo Linux providing ebuilds for various packages

## Using This Repository
There are two main methods for making use of this repository, discussed in the sections below.

### Local Repository
For the [local repository](https://wiki.gentoo.org/wiki/Handbook:Parts/Portage/CustomTree#Defining_a_custom_repository) method, create a `/etc/portage/repos.conf/loannaflip` file and add the following:-
```
[uniminin-overlay]
priority = 50
location = /var/db/repos/loannaflip
sync-type = git
sync-uri = git://github.com/loannaflip/overlay.git
auto-sync = Yes
```
Then run `<superuser> emerge --sync loannaflip`. Portage should now find and update the repository.

### Layman
You can also use the Layman tool to add and sync the repository. Execute the following:-
```
<superuser> layman -o https://raw.githubusercontent.com/loannaflip/overlay/master/repository.xml -f -a loannaflip
```
