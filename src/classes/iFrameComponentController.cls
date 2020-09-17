public with sharing class iFrameComponentController {
    @AuraEnabled
    public static List<Module_s_Excercises__c> getRecord(Id recordId) {
        return [SELECT Name, Exercise_link__c FROM Module_s_Excercises__c WHERE Id = :recordId];
    }
}
