// Copyright 2022 Wayties, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <string>
#include <chrono>
#include <functional>
#include <memory>

#include "rclcpp/rclcpp.hpp"

#include "wxs_msgs/msg/wxs_header.hpp"
#include "wxs_msgs/msg/mac_layer.hpp"
#include "wxs_msgs/msg/ieee1609dot3.hpp"
#include "wxs_msgs/msg/ieee1609dot2.hpp"
#include "wxs_msgs/msg/sae_j2735.hpp"
#include "wxs_msgs/msg/facx_v2x_ind.hpp"

using namespace std::chrono_literals;
using namespace std::placeholders;

using namespace wxs_msgs::msg;

// The constant topic name is WXS protocol. Do not change.
const std::string kTOPIC_FACX_V2X_IND = "/wxs/facx/v2x/ind";

class FacxV2xIndApp: public rclcpp::Node
{
public:
  FacxV2xIndApp()
  : Node("FacxV2xIndApp"), seq_(0)
  {
    // initialize subscriber
    sub_facx_v2x_ind_ = this->create_subscription<FacxV2xInd>(
      kTOPIC_FACX_V2X_IND, 10, std::bind(&FacxV2xIndApp::facx_v2x_ind_app_cb, this, _1));
  }

private:
  /**
   * Callback Function for Facx-V2x.ind
   * 
   * This function receives FacxV2xInd.msg from device.
   */
  void facx_v2x_ind_app_cb(const FacxV2xInd::SharedPtr ind) const
  {
    RCLCPP_INFO(this->get_logger(), 
    "[WXS_HEADER] NTS: %.9lf, SEQ: %d, MID: %d, SID: %d, DID: %d, VID: %d", 
                (double)ind->wxs_header.nts * 1e-9, 
                ind->wxs_header.seq,
                ind->wxs_header.mid,
                ind->wxs_header.sid,
                ind->wxs_header.did,
                ind->wxs_header.vid);
    RCLCPP_INFO(this->get_logger(), 
    "[MAC_LAYER]  TYPE: %d, TYPE_ID: %d, MAC: %x:%x:%x:%x:%x:%x, CHAN: %d, DATA_RATE: %.1f, PRIORITY: %d",
                ind->mac_layer.type,
                ind->mac_layer.type_id,
                ind->mac_layer.mac_l2[0],
                ind->mac_layer.mac_l2[1],
                ind->mac_layer.mac_l2[2],
                ind->mac_layer.mac_l2[3],
                ind->mac_layer.mac_l2[4],
                ind->mac_layer.mac_l2[5],
                ind->mac_layer.chan_num,
                (double)ind->mac_layer.data_rate_x2 * 0.5,
                ind->mac_layer.priority);
    RCLCPP_INFO(this->get_logger(), 
    "[IEEE_DOT3]  SUB_TYPE: %d, VERSION: %d, TPID: %d, PSID: %d",
                ind->ieee_dot3.sub_type,
                ind->ieee_dot3.version,
                ind->ieee_dot3.tpid,
                ind->ieee_dot3.psid);
    RCLCPP_INFO(this->get_logger(), 
    "[IEEE_DOT2]  VERSION: %d, CONTENT_TYPE: %d, IDENTIFIER_TYPE: %d",
                ind->ieee_dot2.protocol_version,
                ind->ieee_dot2.content_type,
                ind->ieee_dot2.signer_identifier_type);
    RCLCPP_INFO(this->get_logger(), 
    "[SAE_J2735]  MSG_ID: %d, MSG_LEN: %d",
                ind->sae_j2735.msg_id,
                ind->sae_j2735.msg_frame.size());
    RCLCPP_INFO(this->get_logger(), "");
                
  }

  // member variable for ROS2 Subscriber
  rclcpp::Subscription<FacxV2xInd>::SharedPtr sub_facx_v2x_ind_;
  uint64_t seq_;
};

int main(int argc, char *argv[])
{
  // ROS2 environment initialize
  rclcpp::init(argc, argv);
  // ROS2 execute main thread
  rclcpp::spin(std::make_shared<FacxV2xIndApp>());
  // ROs2 shutdown main thread 
  rclcpp::shutdown(); 

  return EXIT_SUCCESS;
}
