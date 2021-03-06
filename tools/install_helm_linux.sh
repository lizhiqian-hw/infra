#!/bin/bash

##############################################################################
# Copyright (c) 2020 Huawei Technologies Co., Ltd.
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
##############################################################################

set -x

# Install Helm server
wget https://get.helm.sh/helm-v3.2.0-linux-amd64.tar.gz

tar -zxvf helm-v3.2.0-linux-amd64.tar.gz

mv linux-amd64/helm /usr/local/bin/helm

# Install Helm client
kubectl create -f ../config/tiller-rbac-config.yaml

helm init --service-account tiller

# Initialize the official Helm stable charts repo (optional)
# helm repo add stable https://kubernetes-charts.storage.googleapis.com/
