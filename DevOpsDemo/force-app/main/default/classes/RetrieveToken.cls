public with sharing class RetrieveToken {
    
    //retrieving azure token

    public class tokenlist{
        @AuraEnabled
        public string firstAccessToken;
        @AuraEnabled
        public string secondAccessToken;
        @AuraEnabled
        public map<string,string> mapOutput;
    }
    @AuraEnabled
    public static tokenlist getAzAccessToken(){
        System.debug('Retreive Token');

        String authProviderID = '0SO5Y000000Xf6h';
        String providerType = 'Open ID Connect';
        tokenlist tokenlist = new tokenlist();
        tokenlist.mapOutput = new map<string,string>();
        
        if (!Test.isRunningTest()) { 
            tokenlist.firstAccessToken = Auth.AuthToken.getAccessToken(authProviderID,providerType);
            tokenlist.mapOutput = Auth.AuthToken.refreshAccessToken(authProviderID,providerType,tokenlist.firstAccessToken);
        } else { 
            tokenlist.firstAccessToken = 'test-token-will-not-be-used';
            tokenlist.mapOutput.put('AccessToken','abcd'); 
        }
        tokenlist.secondAccessToken = tokenlist.mapOutput.get('AccessToken');
        
        System.debug('callout to RBC');
        // now call out to rbc using named credentials
        HttpRequest req = new HttpRequest();
		req.setEndpoint('callout:ApigeeDev/XQ40/client-demographics/v1/clients/576164362/demographics');
		req.setMethod('GET');
		Http http = new Http();
        if (!Test.isRunningTest()) { 
//			HTTPResponse res = http.send(req);
//			System.debug(res.getBody());
        }
        System.debug('done callout to RBC');
        
        return tokenlist;
    }


}