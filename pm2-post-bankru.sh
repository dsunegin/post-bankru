#!/bin/sh

# Start at 8:05 am

pm2 delete post-bankru
pm2 start post-bankru.js --name post-bankru --cron "5 11 * * *"
pm2 save