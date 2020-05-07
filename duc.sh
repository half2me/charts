#!/bin/sh

system_ip=`curl -s ${IP4_URL}`
echo "System IP: $system_ip"

url="${DO_API_BASE_URL}/domains/${DO_DOMAIN}/records/${DO_RECORD_ID}"

CheckRecord () {
    # Get record IP
    record_ip=`curl -s -X GET -H "Content-Type: application/json" -H "Authorization: Bearer ${DO_TOKEN}" ${url} | jq -r ".domain_record.data"`

    if [ $record_ip == "null" ]; then
        echo "Error: The record doesn't hold a valid IP!"
        exit 2
    else
        echo "Record IP: $record_ip"
        if [ $record_ip == $system_ip ]; then
            # record is up to date
            return 0
        else
            # record is not up to date
            return 1
        fi
    fi
}

UpdateRecord () {
    new_ip=`curl -s -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer ${DO_TOKEN}" -d "{\"data\": \"${system_ip}\"}" ${url} | jq -r ".domain_record.data"`
    if [ $new_ip != $system_ip ]; then
        echo "Record update failed"
        exit 3
    fi
}

CheckRecord

if [ $? == 0 ]; then
    echo "Record is already up to date!"
    return 0
else
    echo "Record is outdated!"
    if [ $1 == "update" ]; then
        UpdateRecord
    elif [ $1 == "verify" ]; then
        exit 1
    fi
fi