$wc = New-Object net.webclient

# Where things will be installed
$TOOLS_PATH = "C:\Tools"
mkdir $TOOLS_PATH
Set-Location $TOOLS_PATH

# Install Chrome
echo "Downloading latest chrome..."
$ChromeInstaller = "$TOOLS_PATH/chrome_installer.exe"
$wc.Downloadfile("http://dl.google.com/chrome/install/375.126/chrome_installer.exe", $ChromeInstaller)
echo "Installing latest chrome..."
Start-Process -FilePath $ChromeInstaller -Args "/silent /install" -Wait -Verbose

# Install Nodepad++
echo "Downloading Notepad++..."
$NodepadInstaller = "$TOOLS_PATH/notepad_installer.exe"
$wc.Downloadfile("https://notepad-plus-plus.org/repository/7.x/7.5.9/npp.7.5.9.Installer.x64.exe", $NodepadInstaller)
echo "Installing Notepad++..."
Start-Process -FilePath $NodepadInstaller -ArgumentList '/S' -Verb runas -Wait -Verbose

# Add additional scripts here