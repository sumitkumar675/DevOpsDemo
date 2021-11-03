global class SSORegHandler implements Auth.RegistrationHandler{
    
    global User createUser(Id portalId, Auth.UserData data){
        
        if( data != null ) {
            system.debug(data);
            // check if user already exists
            List<User> existingUsers = [select id, username from user where email = :data.email];
            if( existingUsers.size()==1) {
                system.debug('found existing user.');
                return existingUsers[0];
            }
        }
        system.debug('incoming userdata is null!' );
        return null;
    }
    
    global void updateUser(Id userId, Id portalId, Auth.UserData data){
    }  
}