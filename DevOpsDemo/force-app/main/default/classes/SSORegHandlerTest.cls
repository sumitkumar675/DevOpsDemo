@isTest public class SSORegHandlerTest {
    static testMethod void testCreateUserNotNull() {
        SSORegHandler handler = new SSORegHandler();
	    Auth.UserData sampleData = new Auth.UserData('tId', 'testregFirst', 'testregLast',
	   	    'testregFirst testregLast', 'testreguser@example.org', null, 'testreguserlong', 'en_US', 'facebook',
	        null, new Map<String, String>{'language' => 'en_US','site' => 'test', 'full_name' => 'afull aname', 'name' => 'bname', 'firstName' => 'change-me', 'lastName' => 'change-me'});
	    Id portalId = null;
        id profileId = [select Id from profile limit 1].Id;
        
		User usr = new User(LastName = 'testregLast',
                           FirstName='testregFirst',
                           Alias = 'testreg',
                           Email = 'testreguser@example.org',
                           Username = 'testreguser@example.org',
                           ProfileId = profileId,
                           TimeZoneSidKey = 'GMT',
                           LanguageLocaleKey = 'en_US',
                           EmailEncodingKey = 'UTF-8',
                           LocaleSidKey = 'en_US'
                           );     
        insert(usr);
	    User u = handler.createUser(portalId, sampleData);     
	    System.assertEquals('testreguser@example.org', u.username);
    }

    static testMethod void testCreateUserWithNull() {
        SSORegHandler handler = new SSORegHandler();
	    Auth.UserData sampleData = null;
	    Id portalId = null;
	    try {
	        User u = handler.createUser(portalId, sampleData);
	        System.assertEquals(null, u);
	    } catch (Exception e) {
	        System.debug('exception'+ e);
	    }
    }

    static testMethod void testUpdateUser() {
        SSORegHandler handler = new SSORegHandler();
        handler.updateUser(null, null, null);
    }

}