#!/bin/bash

set -e

# Assign warrants
warrant assign employee:jane admin organization:human-resources
warrant assign employee:nick member organization:human-resources
warrant assign employee:ben member organization:human-resources

warrant assign employee:paula admin organization:engineering
warrant assign employee:amanda member organization:engineering
warrant assign employee:rob member organization:engineering
warrant assign employee:allen member organization:engineering

warrant assign organization:human-resources org team:payroll
warrant assign employee:jane manager team:payroll
warrant assign employee:nick member team:payroll
warrant assign employee:ben member team:payroll

warrant assign organization:engineering org team:backend
warrant assign employee:paula manager team:backend
warrant assign employee:amanda member team:backend

warrant assign organization:engineering org team:frontend
warrant assign employee:rob manager team:frontend
warrant assign employee:allen member team:frontend

warrant assign team:payroll owner application:rippling
warrant assign team:backend owner application:mixpanel
warrant assign team:frontend owner application:sentry

# Checks
warrant check employee:jane admin application:rippling -a true
warrant check employee:jane viewer application:rippling -a true
warrant check employee:nick admin application:rippling -a false
warrant check employee:nick viewer application:rippling -a true
warrant check employee:paula viewer application:rippling -a false
warrant check employee:rob viewer application:rippling -a false

warrant check employee:paula admin application:mixpanel -a true
warrant check employee:paula viewer application:mixpanel -a true
warrant check employee:amanda admin application:mixpanel -a false
warrant check employee:amanda viewer application:mixpanel -a true
warrant check employee:jane viewer application:mixpanel -a false
warrant check employee:allen viewer application:mixpanel -a false

warrant check employee:rob admin application:sentry -a true
warrant check employee:rob viewer application:sentry -a true
warrant check employee:allen admin application:sentry -a false
warrant check employee:allen viewer application:sentry -a true
warrant check employee:nick viewer application:sentry -a false
warrant check employee:amanda viewer application:sentry -a false

# Cleanup
warrant object delete organization:human-resources
warrant object delete organization:engineering
warrant object delete team:payroll
warrant object delete team:backend
warrant object delete team:frontend
warrant object delete application:rippling
warrant object delete application:mixpanel
warrant object delete application:sentry
warrant object delete employee:jane
warrant object delete employee:nick
warrant object delete employee:ben
warrant object delete employee:paula
warrant object delete employee:amanda
warrant object delete employee:rob
warrant object delete employee:allen
