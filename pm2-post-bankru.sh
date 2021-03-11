#!/bin/sh

# Start at 06:00 am

pm2 delete post-bankru
CRON="00 06 * * *" pm2 start post-bankru.js --name post-bankru
pm2 save