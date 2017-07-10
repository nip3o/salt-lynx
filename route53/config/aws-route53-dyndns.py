#!/usr/bin/python
import re

import boto3
import requests

ZONE_ID = '{{ pillar["route53"]["zone_id"] }}'
DOMAIN_NAME = '{{ pillar["route53"]["domain_name"] }}'

new_ip = re.sub('[\s+]', '', requests.get('http://checkip.amazonaws.com').text)

# Make some kind of sanity checks before hitting the AWS API.
assert re.match(r'^\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b$', new_ip)
assert ZONE_ID
assert DOMAIN_NAME

route53 = boto3.client('route53')
route53.change_resource_record_sets(
    HostedZoneId=ZONE_ID,
    ChangeBatch={
        'Changes': [{
            'Action': 'UPSERT',
            'ResourceRecordSet': {
                'Name': DOMAIN_NAME,
                'Type': 'A',
                'TTL': 300,
                'ResourceRecords': [{
                    'Value': new_ip,
                }]
            }
        }]
    }
)
