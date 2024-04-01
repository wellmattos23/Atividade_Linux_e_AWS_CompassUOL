#!/bin/bash

service_name="Apache"
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

	if systemctl is-active httpd; then
		echo "Data/Hora: $timestamp - $service_name - Serviço Httpd online" >> "/mnt/efs/wellygnton/status-online.txt"
	else
		echo "Data/Hora: $timestamp - $service_name - Serviço Httpd offline" >> "/mnt/efs/wellygnton/status-offline.txt"
	fi
    