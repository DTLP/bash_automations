#! /bin/bash

##################################################################################################
#
# ./bulk_create_jira_tickets.sh
#
#   curl -u : -X POST H Content-Type: application/json https://<your_jira_address>/rest/api/2/issue/ -d {"fields":{"project":{"key":TEST},"summary":Monthly security scan - 2022-02,"description":"","issuetype":{"id":10001},"assignee":{"id":1a2b3c4d5e6f}}}
#   curl -u : -X POST H Content-Type: application/json https://<your_jira_address>/rest/api/2/issue/ -d {"fields":{"project":{"key":TEST},"summary":Monthly pathing - 2022-02,"description":"","issuetype":{"id":10001},"assignee":{"id":1a2b3c4d5e6f}}}
#   curl -u : -X POST H Content-Type: application/json https://<your_jira_address>/rest/api/2/issue/ -d {"fields":{"project":{"key":TEST},"summary":Monthly maintenance - 2022-02,"description":"","issuetype":{"id":10001},"assignee":{"id":1a2b3c4d5e6f}}}
#
#   Done!
#
##################################################################################################

NOW=`date +'%Y-%m'` # Current month

JIRA_LINK="https://<your_jira_address>/rest/api/2/issue/"
USERNAME=""
API_KEY=""

TOPIC=("Monthly security scan" "Monthly pathing" "Monthly maintenance") # Array of ticket topics
PROJECT_KEY="TEST"
ISSUE_ID="10001" # Issue type ID
USER_ID="1a2b3c4d5e6f" # Assign new ticket to this user

for T in "${TOPIC[@]}"; do

  BODY='{"fields":{"project":{"key":'"$PROJECT_KEY"'},"summary":'"$T - $NOW"',"description":"","issuetype":{"id":'"$ISSUE_ID"'},"assignee":{"id":'"$USER_ID"'}}}'

  echo curl -u $USERNAME:$API_KEY -X POST H "Content-Type: application/json" $JIRA_LINK -d $BODY

done

echo -e "\nDone!"
