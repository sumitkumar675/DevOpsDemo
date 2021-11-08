public class TokenHelper {

    public string AcccessToken{
        get{
            return GetToken();
        }
            } 
    public static string GetToken(){
        System.debug('---Calling AuthToken.getAccessToken() ---');
        string idAzure = '0SO0n0000004DSD'; //CRTdebug: ChangeMe
        string tokenValue = Auth.AuthToken.getAccessToken(idAzure, 'AzureSSO');
        System.debug('TokenLen: '+  tokenValue.length());
        System.debug('Token: '+ tokenValue);
        System.debug('---Done ---');
        return tokenValue; 
    }
}