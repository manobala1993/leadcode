public with sharing class intrestedpartiescontroller {
    @AuraEnabled
    public static prospectWrapper getSplits(String recordId) {
        List<Prospect__c> ol = [SELECT Id, IsDeleted, Name, RecordTypeId, CreatedDate, CreatedById, LastModifiedDate,
                                LastModifiedById, SystemModstamp, LastActivityDate, Opportunity__c, Contact__c, Internal_Notes__c,
                                Notes__c, Status__c, IP_ContactID__c, Marketing_Details__c FROM Prospect__c 
                                where Marketing_Details__c =: recordId order by createddate desc];
        
        
        
        prospectWrapper sw = new prospectWrapper();
        sw.ips = ol;
        return sw; 
    }
    public class prospectWrapper {
        @AuraEnabled public List<Prospect__c> ips {get; set;}
        
    }
}