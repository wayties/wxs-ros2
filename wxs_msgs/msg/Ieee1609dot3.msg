# Copyright 2023 Wayties, Inc.
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

# Ieee1609dot3.msg
# This message contains WSMP information of IEEE 1609.3 standard.

uint8  sub_type # Null-networking Protocol: 0
uint8  version  # WSMP Version: 3
uint8  reserved # Reserved
uint8  tpid     # Transport Protocol ID: 0
uint32 psid     # Provider Service Identifier (PSID value, not p-encoded)
uint16 src_port # Source ITS port
uint16 dst_port # Destination ITS port
