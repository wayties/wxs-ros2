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

# WxsHeader.msg
# This message contains common information of WXS device.

uint64 nts # Nanoseconds of Unix Timestamp (UTC)
uint32 seq # Sequence Number
uint8  mid # Reserved 
uint8  sid # Reserved, For future use as Source Identifier
uint8  did # Reserved, For future use as Device Identifier
uint8  vid # Reserved 
