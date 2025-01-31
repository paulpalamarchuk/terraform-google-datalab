/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/***********************************************
  Template for the startup script
 ***********************************************/
data "template_file" "startup_script" {
  template = "${file("${path.module}/templates/startup_script.tpl")}"

  vars = {
    datalab_docker_image = var.datalab_docker_image
    disk_name            = var.datalab_disk_name
    datalab_enable_swap  = var.datalab_enable_swap
  }
}

/***********************************************
  Main cloud config template
 ***********************************************/
data "template_file" "cloud_config" {
  template = "${file("${path.module}/templates/${var.cloud_config}")}"

  vars = {
    datalab_docker_image      = var.datalab_docker_image
    datalab_enable_backup     = var.datalab_enable_backup
    datalab_console_log_level = var.datalab_console_log_level
    datalab_user_email        = var.datalab_user_email
    datalab_idle_timeout      = var.datalab_idle_timeout
    fluentd_docker_image      = var.fluentd_docker_image
    gpu_device                = var.gpu_device_map["gpu_device_${var.gpu_count}"]
  }
}
