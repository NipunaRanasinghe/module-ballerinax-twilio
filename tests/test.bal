// Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.package tests;

package tests;

import ballerina/io;
import ballerina/log;
import ballerina/test;
import twilio;

endpoint twilio:TwilioEndpoint twilioEP {
    accountSid:ACCOUNT_SID,
    authToken:AUTH_TOKEN,
    uri:BASE_URL
};

@test:Config {
    groups:["network-calls"]
}
function testAccountDetails () {
    log:printInfo("twilioEndpoint -> getAccountDetails()");
    var details = twilioEP -> getAccountDetails();
    match details {
        json accountDetails => {
            io:println(details);
        }
        error err => test:assertFail(msg = err.message);
    }
}
