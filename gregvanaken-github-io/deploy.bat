ECHO OFF
CALL ng build --prod
CALL ngh --message=%1
CALL ngh --branch=master
CALL ngh

