wget -O webui.sh https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
chmod +x webui.sh
echo 'print("Installation complete.");' >print_done.py
LAUNCH_SCRIPT="../print_done.py" ./webui.sh
