#!/bin/sh

testBedIP='[fcff:69:50::705]'
#testBedIP='10.69.23.240'
testBed_Port=8081
#testBed_Port=8091
MSISDN=919999123414
DEVICETYPE='X-Mav-Client-Version:OTT_Android_jp.co.rakuten.mobile.rcs_LinkConsumer_0_0.134a_NA_samsung-SM-G973C_NA'


echo "===================================================================================="
echo "============== Select API to be executed ===========================================>"
echo "===================================================================================="
echo "              1. User Create"
echo "              2. Profile Download"
echo "              3. Profile Update"
echo "              4. Profile Delete"
echo "ObjectUrl=2"
echo "===================================================================================="

echo -n "Enter Your Choice = "

read i

if [ $i -eq 1 ]
then
echo =============User Create=============
curl -g -v -X POST -T APIAutomation/testfiles/usercreate.json --header 'Content-Type: application/json' 'https://reqres.in/api/users'

elif [ $i -eq 2 ]
then
echo "Enter Object url="
read objecturl
echo =============Profile Download=============
curl -g -v -X GET 'https://reqres.in/api/users/'$objecturl''

elif [ $i -eq 3 ]
then
echo =============Profile update=============
curl -g -v -X PUT 'https://reqres.in/api/users/2' --header 'Content-Type: application/json' -T APIAutomation/testfiles/userupdate.json 

elif [ $i -eq 4 ]
then
echo =============Profile Pic Upload=============
curl -g -v -X DELETE 'https://reqres.in/api/users/2'


echo "Invalid choice " $i
exit
fi

