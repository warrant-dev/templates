#!/bin/bash

set -e

# Assign warrants
warrant assign user:jane owner folder:resumes
warrant assign folder:resumes parent document:resume-amy
warrant assign folder:resumes parent document:resume-jim
warrant assign user:blaine editor document:financial-forecast

# Checks
warrant check user:jane owner document:resume-amy -a true
warrant check user:jane viewer document:resume-amy -a true
warrant check user:jane editor document:resume-jim -a true
warrant check user:blaine viewer document:resume-jim -a false

warrant check user:jane editor document:financial-forecast -a false
warrant check user:blaine editor document:financial-forecast -a true

# Cleanup
warrant object delete user:jane
warrant object delete user:blaine
warrant object delete folder:resumes
warrant object delete document:resume-amy
warrant object delete document:resume-jim
warrant object delete document:financial-forecast
