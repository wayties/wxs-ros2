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

# SaeJ2735.msg
# This message contains message information of SAE J2735 standard.

uint16  msg_id    # Message ID, 20: BSM, 26: PVD, 34: PPD(extension) ...
uint8[] msg_frame # SAE J2735 MessageFrame as Message ID
