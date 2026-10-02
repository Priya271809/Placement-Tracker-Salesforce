public with sharing class JobApplicationController {

    @AuraEnabled(cacheable=true)
    public static List<Job_Application__c> getApplications(String status) {
        if (String.isBlank(status) || status == 'All') {
            return [SELECT Id, Name, Company__c, Role__c, Status__c, Applied_Date__c, Package_LPA__c
                    FROM Job_Application__c WITH USER_MODE
                    ORDER BY Applied_Date__c DESC LIMIT 200];
        }
        return [SELECT Id, Name, Company__c, Role__c, Status__c, Applied_Date__c, Package_LPA__c
                FROM Job_Application__c WHERE Status__c = :status WITH USER_MODE
                ORDER BY Applied_Date__c DESC LIMIT 200];
    }
}
