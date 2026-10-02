trigger JobApplicationTrigger on Job_Application__c (before insert, before update) {
    JobApplicationTriggerHandler.run(Trigger.new);
}
