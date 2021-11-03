public class AccessToken {

    public static String getAzureAccessToken() {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:ApigeeDev');
        req.setMethod('POST');
//        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setHeader('Accept', 'application/json');
//        req.setBody('grant_type=client_credentials&scope=https://graph.microsoft.com/.default&client_id=c084f210-fdd5-484b-ad9d-471043bda47b&client_secret=vj2OQio~~fL8sRQELC-baj_dbbTdL080l0');
        HttpResponse res = h.send(req);
        if(res.getStatusCode()!=200) {
        }
		System.debug('res is>>'+res.getBody());
        
        return res.getBody();
    }

    
    public static HttpResponse getAzAccessToken() {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:ApigeeDev');
        req.setMethod('POST');
        req.setHeader('Authorization', 'OAuth {!$Credential.OAuthToken}');
        system.debug('req ' + req.getHeader('Authorization'));
        req.setHeader('Accept', 'application/json');
        HttpResponse res = h.send(req);
        if(res.getStatusCode()!=200) {
        }
		System.debug('res is>>'+res.getBody());
        
        return res;
    }

    @AuraEnabled
    public static String gettheAzAccessToken() {
        String res = getAzureAccessToken();
        
        // TODO later change to get the actual token
        return res;
    }
    
}