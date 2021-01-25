#!/bin/bash
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Delete existing symlinks.
find clusterfuzz/ -type l | xargs rm

ln -s "$(pwd)/../../internal" clusterfuzz/deps/internal

# Symlink config dir.
ln -s $(pwd)/../../../configs/test clusterfuzz/lib-config

rm -rf dist
python setup.py sdist bdist_wheel