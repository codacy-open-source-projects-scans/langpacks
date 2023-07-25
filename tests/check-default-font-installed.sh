#!/bin/bash


for pkg in `cat /tmp/langpacks-packages-list.txt`; do
sudo dnf install $pkg -y --quiet
retval=$?
echo $retval
if [ $retval -ne 0 ]; then
	echo "$pkg is not installed"
else
	echo "$pkg is successfully installed"
fi
done

# Check hi language
sudo dnf list installed|grep lohit-devanagari-fonts	
retval=$?
echo $retval
if [ $retval -ne 0 ]; then
	echo "default-fonts-hi failed to install lohit-devanagari-fonts as default font package"
else
	echo "default-fonts-hi installed with default font lohit-devanagari-fonts package"
fi

# Check zh_CN language
sudo dnf list installed|grep google-noto-sans-cjk-vf-fonts
retval=$?
echo $retval
if [ $retval -ne 0 ]; then
        echo "default-fonts-zh_CN failed to install google-noto-sans-cjk-vf-fonts as default font package"
else
        echo "default-fonts-zh_CN installed with default font google-noto-sans-cjk-vf-fonts package"
fi

