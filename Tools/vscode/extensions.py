from subprocess import check_output
import os 

extension_list = check_output("code --list-extensions",shell=True, universal_newlines=True).split("\n")
extension_to_install = ["ms-vscode.cmake-tools","ms-vscode.cpptools","formulahendry.code-runner","ms-python.python","eamodio.gitlens"]

for ext in extension_to_install:
    if ext not in extension_list:
        os.system(f"code --install-extension {ext}")
