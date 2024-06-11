- [x] Add typescript installation to nodejs script
- [x] Add typescript language server setup 
- [x] Add ssh support
- [x] Add support for vim and neovim
- [x] Add keyboard setup
- [ ] Add i3 configuration
- [ ] Document all the install options
- [x] Enable remote desktop with install
- [x] Install a nerdfont (CaskaydiaMono, Hack)
- [ ] Add support for multiple monitors
- [ ] Create a command to trigger the different tags with fzf
- [ ] Document different things that are installed
- [ ] Move work and personal repositories to encrypted files
- [ ] Move personal data to personal repository
- [ ] Add support to i3 to take screenshots
- [ ] Move slack out of productivity tag?
- [ ] Change n install to not require sudo access

- [x] Test if rdp configuration wrorks
- [ ] Add documentation about the variables file
```
git_user: '<git_user>'
git_email: '<git_email>'
```

**Allow RDP through firewall**

Might need to add this to the script
```
sudo ufw allow from any to any port 3389 proto tcp
``` 
