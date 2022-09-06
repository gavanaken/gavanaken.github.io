ECHO OFF
CALL npm install -g angular-cli-ghpages
CALL ng build --prod
CALL ngh --message=%1
CALL ngh --branch=master
CALL ngh

