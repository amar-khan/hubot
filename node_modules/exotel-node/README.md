# Exotel NodeJs Wrapper
A NodeJs wrapper for Exotel APIs. Converts Exotel XML response to Javascript object.

```npm install exotel-node```

### Include and initialize
```javascript
var Exotel = require('exotel-node');
Exotel.init(SID, TOKEN, EXOPHONE);
```

### APIs available
* [Send SMS](#send_sms)
* [Connect call](#connect_call)
* [Get call details](#get_call_details)

### <a name="send_sms"></a>Send SMS
```javascript
Exotel.sendSMS(TO_NUMBER, MESSAGE, function(error, response) {
  if (!error) {
    console.log(response);
  }
});
```

### <a name="connect_call"></a>Connect call (Connect agent to customer)
```javascript
Exotel.connectCall(AGENT_NUMBER, CUSTOMER_NUMBER, function(error, response) {
  if (!error) {
    console.log(response);
  }
});
```

### <a name="get_call_details"></a>Get call details
```javascript
Exotel.getCallDetails(CALL_SID, function(error, response) {
  if (!error) {
    console.log(response);
    console.log(response.DateCreated);  // Date created
    console.log(response.DateUpdated);  // Date updated
    console.log(response.AccountSid);   // Account SID used to create the call
    console.log(response.To);           // Customer number/2nd number in API call
    console.log(response.From);         // Agent number/1st number in API call
    console.log(response.Status);       // Call status
    console.log(response.StartTime);    // Call start time
    console.log(response.EndTime);      // Call end time
    console.log(response.Duration);     // Call duration
    console.log(response.Price);        // Call cost
    console.log(response.RecordingUrl); // Call recording url
  }
});
```
---
### Submit issues
You can raise an issue in this repo or mail me at sidhant@hashexclude.com
