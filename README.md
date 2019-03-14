# Creating the VM
---

1. Requires Vagrant to be installed on your computer. Vagrant can be downloaded
from [here.](https://www.vagrantup.com/)

2. Requires VirtualBox to be installed on your computer. VirtualBox can be
downloaded from [here.](https://www.virtualbox.org/)

3. `Vagrantfile` is located at `vagrant-windows` folder

- Vagrantfile contains all the details for creating the VM

- **Line 2** I'm using `opentable/win-2012r2-standard-amd64-nocm` as the base image. You can change the base image to anything listed in the [vagrant website.](https://app.vagrantup.com/boxes/search) (There are several windows and linux distributions available)

- **Line 3** We can ask vagrant to execute bash or powershell scripts after creating the image. I'm installing chrome and notepad++ in `bootstrap.ps1` script to provide an example. Here you can specify which programs needed to be installed and/or which tasks needed to be performed after creating the image.

- **Line 6** You can sepecify which ports need to be opened. I'm only using the RDP port

- **Line 10** Specify memory

- **Line 14** Specify vram

4. Open terminal then navigate to vagrant-windows folder

- Execute the command `vagrant up` to start and provision the vagrant environment
- Execute the command `vagrant halt` to stop the vagrant machine
- Execute the command `vagrant destroy` to stop and delete all traces of the vagrant machine

5. Execute `vagrant up`
6. Now open the VirtualBox and you will see the newly created VM. You can select it to open the RDP viewer.
(optional) `vagrant rdp` command should do the same thing using the default RDP viewer, but you may need to define a hostname in Vagrantfile.

7. (Optional) Install guest additions.

# Packaging (optional)
---

1. After creating the VM you can package it to box file, where you can easily use anytime in the future.

2. Execute `vagrant package --output <some-name>.box` Ex: vagrant package --output win2012r2.box

3. Above command will create a .box file in the working folder. 
This box file can be shared with anyone who needs to use your VM.

4. (The person who's using the box file in a different machine) 
Now you can register the box into vagrant so you can easily use in the future.

- Execute `vagrant box add WIN2012R2 <path to>/win2012r2.box`

5. (In a different folder) Initialise the VM with the identifier used in step 4 above.
- Execute `vagrant init WIN2012R2`

6. Start the VM

- Execute `vagrant up`

# Migrate as Hyper-V (optional)
---
You can directly use .box with Vagrant installed guest machine (recommended). 
But in case vagrant is not installed:

1. The `.box` file contains both
- Open Virtualization Format (OVF)
- Virtual Machine Disk (VMDK)
formats. Inorder to access those files change the `.box` extention to `.zip` and extract the files.

2. Now you can either use those formats directly with VirtualBox or convert them to hyper-v

3. I think you should enable hyper-v in the VM in order to convert the image to hyper-v
[more info](https://www.vagrantup.com/docs/hyperv/)
