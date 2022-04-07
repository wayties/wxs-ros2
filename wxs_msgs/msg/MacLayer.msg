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

# MacLayer.msg
# This message contains information of V2X MAC layer.
# The information can be optionally included in both DSRC and CV2X.

uint8    type         # 0: N/A, 1: DSRC, 2: CV2X
uint16   type_id      # Ether type of DSRC, family id of CV2X
uint8    reserved     # Reserved
uint8    chan_num     # Channel Number 172 .. 184 (Even : 10 Mhz, Odd: 20 Mhz)
uint8    time_slot    # TimeSlot of DSRC (N/A: 0, TimeSlot 0: 1, Time Slot 1: 2, Either: 3),
uint8[6] mac_l2       # MAC address(EUI-48) of DSRC, Layer-2 ID of CV2X (first 3 bytes only)
uint8    data_rate_x2 # X2 Data Rate, 6: 3MBps, 9: 4.5MBps, 12: 6MBps …, 0: N/A
uint8    priority     # Priority, 255: N/A
uint8    cbr          # Latest Channel Busy Ratio, 255: N/A
int8     rssi         # RSSI, 127: N/A

