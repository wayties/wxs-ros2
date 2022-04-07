# Copyright 2022 Wayties, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Ieee1609dot2.msg
# This message contains Security information of IEEE 1609.2 standard.

uint8 protocol_version       # Current Version of Protocol: 3
uint8 content_type           # 0: Unsecured, 1: Signed
uint8 signer_identifier_type # 0: Digest, 1: Certificate, 2: Self (Signed content type Only)
uint8 signer_verified        # 0: N/A, 1: Failure, 2: Success (Signed content type Only)
