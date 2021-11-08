@isTest
global class AccessToken2Mock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        
        System.assertEquals('https://login.microsoftonline.com/073c2450-9568-47ef-8d75-e15dd021d2ad/oauth2/v2.0/token', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"access_token":"fakeaccesstokenv2"}');
        res.setStatusCode(200);
        return res;
    }
}