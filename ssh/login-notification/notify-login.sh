#!/bin/bash

##
# User Configuration
##

WEBHOOK_URL="##CHANGE_ME##" # Change this to your "incoming webhooks" url
INTEGRATION_USERNAME="SSH Login Notifier" # You can change this if you want

# --- do not change past this line ----------------------------------------------------------------------

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

LOG_USER="$PAM_USER"
LOG_DATE="$( date "+%Y-%m-%d %H:%M:%S" )"
OUT_WHO="$( who )"
LOG_IP="$PAM_RHOST"

WHOIS_INFO=`whois -h whois.cymru.com " -f -t -n $LOG_IP"`
AS_NUMBER=`echo "$WHOIS_INFO" | awk -F "|" '{gsub (/ /, ""); print $1}'`
AS_NAME=`echo "$WHOIS_INFO" | awk -F "|" '{gsub (/ /, ""); print $3}'`

IP_INFO="$LOG_IP (AS$AS_NUMBER / $AS_NAME)"

MESSAGE="### :lock: New Login detected :male_detective:

**Host:** $(cat /etc/hostname)
**User:** ${LOG_USER}
**IP:** ${IP_INFO}
**Service:** ${PAM_SERVICE}
**Date:** ${LOG_DATE}
**Uptime:** $(uptime -p)"

http POST $WEBHOOK_URL username="$INTEGRATION_USERNAME" text="$MESSAGE" -j
