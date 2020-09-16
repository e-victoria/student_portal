/**
 * This class is created for using 
 * the Google Service APIs from 
 * Salesforce.
 * 
 * @author      Shruti Sridharan
 * @since       18.10.2017
 * @revisions   N/A
 **/
public class GDriveForSalesforceCtrl {
    /**
     * This property is created to for
     * getting the access token.
     **/
    public static String accessToken {
        get {
            Google_Settings__c settings = Google_Settings__c.getOrgDefaults();
            
            Auth.JWT jwt = new Auth.JWT();
            jwt.setAud( settings.Token_Endpoint__c );
            jwt.setIss( settings.Service_Account_Id__c );
            jwt.setAdditionalClaims( new Map<String, Object>{ 'scope' => settings.Scopes__c } );
    
            Auth.JWS jws = new Auth.JWS( jwt, 'GDriveForSalesforce' );
    
            Auth.JWTBearerTokenExchange bearer = new Auth.JWTBearerTokenExchange( settings.Token_Endpoint__c, jws );
    
            return bearer.getAccessToken();
        }
    }
}