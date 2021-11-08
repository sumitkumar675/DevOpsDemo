@isTest
public class RetrieveTokenTest {
	

    @isTest 
    static void testHasToken() {
        // Set mock callout class 
//        Test.setMock(HttpCalloutMock.class, new AccessTokenMock());
        
        RetrieveToken.tokenlist token = RetrieveToken.getAzAccessToken();      
//        System.assertEquals('fakeaccesstoken',token);	
        System.assertEquals('test-token-will-not-be-used',token.firstAccessToken);	
        
     }

}