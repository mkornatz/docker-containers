#!/bin/bash
#
source /etc/apache2/envvars

killall apache2
exec apache2 -D FOREGROUND
