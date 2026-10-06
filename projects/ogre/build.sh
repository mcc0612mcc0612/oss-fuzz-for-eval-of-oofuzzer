# Copyright 2023 Google LLC
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
#
################################################################################

mkdir -p build
cd build
cmake -DOGRE_STATIC=TRUE -DOGRE_BUILD_FUZZERS=TRUE -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
  -DOGRE_BUILD_DEPENDENCIES=FALSE -DOGRE_BUILD_SAMPLES=FALSE  ..
make -j$(nproc)

# copy the fuzzers
for fuzzer in image_fuzz stream_fuzz zip_fuzz ogre_deep_fuzz script_fuzz dds_fuzz; do
  cp bin/${fuzzer} $OUT/${fuzzer}
done
