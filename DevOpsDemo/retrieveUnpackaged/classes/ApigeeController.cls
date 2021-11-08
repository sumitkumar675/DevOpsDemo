public class ApigeeController {
    @AuraEnabled
    public static string ApigeeRestMethod() {
        HttpRequest httpRequest = new HttpRequest();  
        httpRequest.setEndpoint('https://apigw-int.devfg.rbc.com/GCV0/Test-Proxy/v1/hi');
        httpRequest.setMethod('GET');

        string idAzure = '0SO0n0000004DSD'; //CRTdebug: ChangeMe
        string tokenValue = Auth.AuthToken.getAccessToken(idAzure, 'AzureSSO');
        httpRequest.setHeader('Authorization', 'Bearer ' + tokenValue);                  

        httpRequest.setHeader('Content-Type','application/xml'); 

        String strResponse = null;
        try {  
          Http http = new Http();   
                HttpResponse httpResponse = http.send(httpRequest);  
                if (httpResponse.getStatusCode() == 200 ) {  
                    strResponse = httpResponse.getBody();  
                } 
                else {  
                    throw new CalloutException(httpResponse.getBody());  
                } 
             
            } 
            catch(Exception ex) {  
                throw ex;  
            } 
         if(!String.isBlank(strResponse)) {
                return strResponse;
            }else{
                return null;
            }
    }
}