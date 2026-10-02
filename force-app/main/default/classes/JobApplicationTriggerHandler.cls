public with sharing class JobApplicationTriggerHandler {

    // 1) Applied Date blank ho to aaj ki date daal do
    // 2) Same Company + Role ki duplicate application block karo
    public static void run(List<Job_Application__c> newList) {
        Set<String> companies = new Set<String>();
        for (Job_Application__c app : newList) {
            if (app.Applied_Date__c == null) {
                app.Applied_Date__c = Date.today();
            }
            companies.add(app.Company__c);
        }

        Map<String, Id> existing = new Map<String, Id>();
        for (Job_Application__c e : [SELECT Id, Company__c, Role__c FROM Job_Application__c WHERE Company__c IN :companies]) {
            existing.put(key(e), e.Id);
        }

        Set<String> seenInBatch = new Set<String>();
        for (Job_Application__c app : newList) {
            String k = key(app);
            Boolean dupInDb = existing.containsKey(k) && existing.get(k) != app.Id;
            if (dupInDb || seenInBatch.contains(k)) {
                app.addError('You have already applied for this role at ' + app.Company__c);
            }
            seenInBatch.add(k);
        }
    }

    private static String key(Job_Application__c a) {
        return (a.Company__c + '|' + a.Role__c).toLowerCase();
    }
}
