public class OmniController {
    @AuraEnabled
    public static string getOmniURL() {
        string ProfileURL = [SELECT OmniURL__c,OrgIdentifier__c  FROM OmniURL__mdt
		WHERE OrgIdentifier__c = :URL.getSalesforceBaseUrl().getHost().toLowercase()].OmniURL__c;
        return ProfileURL;
    }
}