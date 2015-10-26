#!/bin/bash

#### Change to correct path ####
export GAIADIR=/home/irishsiao/Work/gaia

#### Makefile #########
sed -i 's/fxos\.telemetry\.mozilla\.org/fxos-telemetry-mozilla-org-fw81a67t0so2\.runscope\.net/g' $GAIADIR/Makefile
echo "====Makefile===="
sed -n "157,158p" $GAIADIR/Makefile

#### app_usage_metrics.js###########
sed -i 's/AUM.DEBUG = false/AUM.DEBUG = true/g' $GAIADIR/apps/system/js/app_usage_metrics.js
sed -i 's/fxos\.telemetry\.mozilla\.org/fxos-telemetry-mozilla-org-fw81a67t0so2\.runscope\.net/g' $GAIADIR/apps/system/js/app_usage_metrics.js
#change AUM.REPORT_INTERVAL to 5 minutes
sed -i 's/AUM.REPORT_INTERVAL = 14 \* 24 \* 60 \* 60 \* 1000/AUM.REPORT_INTERVAL = 5 \* 60 \* 1000/g' $GAIADIR/apps/system/js/app_usage_metrics.js
#change AUM.RETRY_INTERVAL to 1 minute
sed -i 's/AUM.RETRY_INTERVAL = 60 \* 60 \* 1000/AUM.RETRY_INTERVAL = 60 \* 1000/g' $GAIADIR/apps/system/js/app_usage_metrics.js
#change idle time to 60 seconds
sed -i 's/AUM.IDLE_TIME = 5/ AUM.IDLE_TIME = 60/g' $GAIADIR/apps/system/js/app_usage_metrics.js

echo "====app_usage_metrics.js===="
sed -n "125,163p" $GAIADIR/apps/system/js/app_usage_metrics.js

####advanced_telemetry.js#################
sed -i 's/AT.DEBUG = false/AT.DEBUG = true/g' $GAIADIR/apps/system/js/advanced_telemetry.js
sed -i 's/AT.LOGINFO = false/AT.LOGINFO = true/g' $GAIADIR/apps/system/js/advanced_telemetry.js
#sed -i 's/incoming\.telemetry\.mozilla\.org/incoming-telemetry-mozilla-org-fw81a67t0so2\.runscope\.net/g' $GAIADIR/apps/system/js/advanced_telemetry.js
sed -i 's/https\:\/\/incoming\.telemetry\.mozilla\.org/http\:\/\/10\.247\.25\.98\:10001/g' $GAIADIR/apps/system/js/advanced_telemetry.js
#change REPORT_INTERVAL to 4 minutes
sed -i 's/AT.REPORT_INTERVAL = 14 \* 24 \* 60 \* 60 \* 1000/AT.REPORT_INTERVAL = 4 \* 60 \* 1000/g' $GAIADIR/apps/system/js/advanced_telemetry.js
#unchange REPORT_TIMEOUT, 20 seconds
sed -i 's/AT.REPORT_TIMEOUT = 20 \* 1000/AT.REPORT_TIMEOUT = 20 \* 1000/g' $GAIADIR/apps/system/js/advanced_telemetry.js
#change RETRY_INTERVAL to 1 minute
sed -i 's/AT.RETRY_INTERVAL = 60 \* 60 \* 1000/AT.RETRY_INTERVAL = 60 \* 1000/g' $GAIADIR/apps/system/js/advanced_telemetry.js
#change MERGE_INTERVAL to 2 minute
sed -i 's/AT.MERGE_INTERVAL = 60 \* 60 \* 1000/AT.MERGE_INTERVAL = 2 \* 60 \* 1000/g' $GAIADIR/apps/system/js/advanced_telemetry.js
#change idle time to 60 seconds
sed -i 's/AT.IDLE_TIME = 5/AT.IDLE_TIME = 60/g' $GAIADIR/apps/system/js/advanced_telemetry.js

echo "====advanced_telemetry.js===="
sed -n "64,65p" $GAIADIR/apps/system/js/advanced_telemetry.js
sed -n "124,145p" $GAIADIR/apps/system/js/advanced_telemetry.js
#### ftu_ping.js ##################
sed -i 's/DEBUG = false/DEBUG = true/g' $GAIADIR/apps/system/js/ftu_ping.js
#change AUM.DEFAULT_TRY_INTERVAL to 15 seconds
sed -i 's/DEFAULT_TRY_INTERVAL = 60 \* 60 \* 1000/DEFAULT_TRY_INTERVAL = 15 \* 1000/g' $GAIADIR/apps/system/js/ftu_ping.js

echo "====ftu_ping.js===="
sed -n "13,23p" $GAIADIR/apps/system/js/ftu_ping.js

#### telemetry.js ##################
sed -i 's/TR.DEBUG = false/TR.DEBUG = true/g' $GAIADIR/shared/js/telemetry.js

echo "====telemetry.js===="
sed -n "14,15p" $GAIADIR/shared/js/telemetry.js 
echo "===================="

echo "done!"
echo "Don't forget to copy gaia/shared/js/advanced_telemetry_helper.js & settings_listener.js to your app/www/shared/js"
