Public class UserRolesJson {

    public class UserRoleInput{
        public string email;
        public string role;
    }

    public static void ParseRolesJSON(){
        // Call from DevConsole -->   UserRolesJSon.ParseRolesJSON();
        //String strJSONinput = '[{"email" : "crtdebug2@crttech.com","role" : "Branch Manager"}]';
        
        //DEV
        //String strJSONinput = '[{"email" : "tony.ramos@rbc.com.invalid","role" : "Branch Manager"},{"email" : "udaya.garikimukkula@rbc.com.invalid","role" : "Bank Advisor"},{"email" : "chris.adams@rbc.com.invalid","role" : "Assistant Branch Manager"},{"email" : "Henry.Li@rbc.com.invalid","role" : "Financial Advisor"},{"email" : "Ruairi.Flynn@rbc.com.invalid","role" : "Client Advisor"},{"email" : "Aarchit.Gupta@rbc.com.invalid","role" : "Banking Advisor Intern"}]';

        //QAT
        String strJSONinput = '[{"email" : "Tony.Ramos@sterbc.com","role" : "Branch Manager"},{"email" : "udaya.garikimukkula@sterbc.com","role" : "Bank Advisor"},{"email" : "chris.adams@sterbc.com","role" : "Assistant Branch Manager"},{"email" : "Henry.Li@sterbc.com","role" : "Financial Advisor"},{"email" : "Ruairi.Flynn@sterbc.com","role" : "Client Advisor"},{"email" : "Aarchit.Gupta@sterbc.com","role" : "Banking Advisor Intern"}]';

        //List<UserRole> parsedroleslist = JSON.deserializeStrict( strJSONinput, UserRole.class);
        List<UserRoleInput> parsedroles = (List<UserRoleInput>)JSON.deserializeStrict( strJSONinput, List<UserRoleInput>.class);
        for(UserRoleInput ur : parsedroles){
            system.debug(ur);
            try {   // CRTdebug - toBulkify
                User UserForRole = [SELECT Id, UserRoleId FROM User WHERE email = :ur.email LIMIT 1];
                UserForRole.UserRoleId=[select Id from UserRole where Name = :ur.role].Id;
                update UserForRole;                    
            } catch (Exception e) {
                system.debug('ParseRolesJSON Error: ' + e.getMessage());
            }
        }
    }
}