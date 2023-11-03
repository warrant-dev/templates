#!/bin/bash

set -e

# Assign warrants
warrant assign user:acme-dev-1 owner tenant:acme-corp
warrant assign user:acme-dev-2 member tenant:acme-corp
warrant assign user:acme-dev-3 member tenant:acme-corp

warrant assign tenant:acme-corp parent team:acme-frontend
warrant assign user:acme-dev-2 member team:acme-frontend

warrant assign tenant:acme-corp parent team:acme-backend
warrant assign user:acme-dev-3 member team:acme-backend

warrant assign team:acme-frontend owner application:nextjs-app
warrant assign team:acme-backend owner application:golang-app

# Checks
warrant check user:acme-dev-1 editor application:nextjs-app -a true
warrant check user:acme-dev-1 editor application:golang-app -a true

warrant check user:acme-dev-2 editor application:nextjs-app -a false
warrant check user:acme-dev-2 editor application:golang-app -a false
warrant check user:acme-dev-2 viewer application:nextjs-app -a true

warrant check user:acme-dev-3 editor application:nextjs-app -a false
warrant check user:acme-dev-3 editor application:golang-app -a false
warrant check user:acme-dev-3 viewer application:golang-app -a true

# Cleanup
warrant object delete tenant:acme-corp
warrant object delete team:acme-frontend
warrant object delete team:acme-backend
warrant object delete user:acme-dev-1
warrant object delete user:acme-dev-2
warrant object delete user:acme-dev-3
warrant object delete application:nextjs-app
warrant object delete application:golang-app
