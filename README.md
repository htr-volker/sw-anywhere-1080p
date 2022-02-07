# HyperV Ubuntu VM in 1080p

This is a simple script that will change your Ubuntu VM's native resolution from a tiny 4:3 ratio to full 1080p.

You don't even have to clone it down! Simply run:

```bash
sudo apt update && sudo apt install curl
curl https://raw.githubusercontent.com/htr-volker/sw-anywhere-1080p/main/ten-eighty-p.sh > 1080p.sh
sudo ./1080p.sh
```

**Note** that it will reboot your VM, so make sure you don't have any important processes running.
