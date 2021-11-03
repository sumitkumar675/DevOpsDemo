@isTest
global class AccessTokenMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        
        //System.assertEquals('', req.getHeader('Authorization')); //CRTdebug-Fail
        //CRTdebug: System.assertEquals('https://login.microsoftonline.com/073c2450-9568-47ef-8d75-e15dd021d2ad/oauth2/token', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"access_token":"fakeaccesstoken"}');
        res.setStatusCode(200);
        return res;
    }
}