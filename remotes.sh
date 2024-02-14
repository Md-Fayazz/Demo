#!/bin/bash

conan remote add test-conan-local https://adeevopps.jfrog.io/artifactory/api/conan/test-conan-local --force --insert=0
conan user -p cmVmdGtuOjAxOjE3Mzc3MjAxMjQ6dHRpV2dHbFRFZzVpRGtidFZaZGh3M2lEY1Fp -r test-conan-local manjur.shaikh@a-devops.com
