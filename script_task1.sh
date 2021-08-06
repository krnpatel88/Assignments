#!/bin/bash

#Notes:
#We have used ubuntu 20.4.
#We consider that git is already installed on the machine where this script will run.
#Before running this script make sure you give executable permission to this file and home folder should be /home/ubuntu because we have used absolute path.

#We are creating custome date format for log filename.
today=`date '+%d%m%Y'`;

#We are creating task1 folder under /home/ubuntu.
sudo mkdir /home/ubuntu/task1
cd /home/ubuntu/task1

#We will clone Task1 repository from github with default checkout to develop branch to task1 folder.
git clone --branch develop https://github.com/krnpatel88/Task1.git .

#We will write last 5 commmit logs which contains only Author and file name into gitlog_date.log file.
git log -p -5 --pretty=format:"Author: %an %nFilename: " --name-only develop > /home/ubuntu/gitlog_$today.log

#At last we will delete clonned repository, Please note, we are removing only .git not all the files.
rm -rf .git

#To run this script in cron jobs. follow below steps.
#type crontab -e
#add line at botton: 0 15 * * * /bin/bash /home/ubuntu/script_task1.sh
#cron job will be run every day at 3 PM and generates the log file with last 5 commit logs details.



