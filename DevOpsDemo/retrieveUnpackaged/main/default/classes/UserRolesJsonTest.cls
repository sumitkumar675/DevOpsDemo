@isTest public class UserRolesJsonTest {

    @IsTest
    static void testParseRolesJSON(){
        
        Test.startTest();
        UserRolesJSon.ParseRolesJSON();
        //String strJSONinput = '[{"email" : "crtdebug2@crttech.com","role" : "Branch Manager"}]';
        Test.stopTest();
        
    }
}