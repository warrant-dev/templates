#!/bin/bash

set -e

# Assign warrants
warrant assign developer:fe-dev-1 manager team:frontend-1
warrant assign developer:fe-dev-2 member team:frontend-1
warrant assign developer:fe-dev-3 member team:frontend-1
warrant assign team:frontend-1 owner service:fe-service-a
warrant assign team:frontend-1 owner service:fe-service-b

warrant assign developer:be-dev-1 manager team:backend-1
warrant assign developer:be-dev-2 member team:backend-1
warrant assign team:backend-1 owner service:data-service

# Checks
warrant check developer:fe-dev-1 admin service:fe-service-a -a true
warrant check developer:fe-dev-1 can-access service:fe-service-a -a true
warrant check developer:fe-dev-1 admin service:fe-service-b -a true
warrant check developer:fe-dev-1 can-access service:fe-service-b -a true
warrant check developer:fe-dev-2 admin service:fe-service-a -a false
warrant check developer:fe-dev-2 can-access service:fe-service-a -a true
warrant check developer:fe-dev-3 admin service:fe-service-b -a false
warrant check developer:fe-dev-3 can-access service:fe-service-b -a true
warrant check developer:be-dev-1 can-access service:fe-service-a -a false
warrant check developer:be-dev-1 can-access service:fe-service-b -a false

warrant check developer:be-dev-1 admin service:data-service -a true
warrant check developer:be-dev-1 can-access service:data-service -a true
warrant check developer:be-dev-2 admin service:data-service -a false
warrant check developer:be-dev-2 can-access service:data-service -a true
warrant check developer:fe-dev-1 can-access service:data-service -a false
warrant check developer:fe-dev-1 can-access service:data-service -a false

# Cleanup
warrant object delete team:frontend-1
warrant object delete team:backend-1
warrant object delete service:fe-service-a
warrant object delete service:fe-service-b
warrant object delete service:data-service
warrant object delete developer:fe-dev-1
warrant object delete developer:fe-dev-2
warrant object delete developer:fe-dev-3
warrant object delete developer:be-dev-1
warrant object delete developer:be-dev-2
