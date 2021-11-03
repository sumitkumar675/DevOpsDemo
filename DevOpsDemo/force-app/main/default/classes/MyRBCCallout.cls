public with sharing class MyRBCCallout {
    
    @AuraEnabled
    public static String getMyRBCCallout(){
        System.debug('call rbc');
        
        String something = 'something';

        
        System.debug('callout to RBC');
        // now call out to rbc using named credentials
        HttpRequest srfclientreq = new HttpRequest();
        
//		srfclientreq.setEndpoint('https://qa-apigw-int.saifg.rbc.com/XQ40/client-demographics/v1/clients/576164362/demographics');
//		srfclientreq.setEndpoint('callout:ApigeeDev/XQ40/client-demographics/v1/clients/576164362/demographics');
		srfclientreq.setEndpoint('callout:ApigeeDev/GCV0/Test-Proxy/v1');
        
		srfclientreq.setMethod('GET');
		Http srfhttp = new Http();
        if (!Test.isRunningTest()) { 
			HTTPResponse srfres = srfhttp.send(srfclientreq);
			System.debug(srfres.getBody());
			something = srfres.getBody();
        }
        System.debug('done callout to RBC');
        
        return something;
    }

}