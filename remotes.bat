@echo off

cmd /c conan remote add test-conan-local https://adevooops.jfrog.io/artifactory/api/conan/test-conan-local --force --insert=0
cmd /c conan user -p cmVmdGtuOjAxOjE3Mzg5MDYyNDA6djFMU2hBRlowcWxQbFhXTDNRUm5nMlJiQnB3 -r test-conan-local hussain.shaikh@a-devops.com
