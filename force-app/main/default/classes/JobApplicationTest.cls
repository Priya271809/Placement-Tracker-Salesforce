@isTest
private class JobApplicationTest {

    private static Job_Application__c make(String company, String role, String status) {
        return new Job_Application__c(Name = company + ' ' + role, Company__c = company, Role__c = role, Status__c = status);
    }

    @isTest
    static void setsDefaultAppliedDate() {
        Job_Application__c app = make('Google', 'SDE', 'Applied');
        insert app;
        app = [SELECT Applied_Date__c FROM Job_Application__c WHERE Id = :app.Id];
        System.assertEquals(Date.today(), app.Applied_Date__c, 'Default date should be today');
    }

    @isTest
    static void blocksDuplicateApplication() {
        insert make('Infosys', 'Backend Developer', 'Applied');
        Database.SaveResult res = Database.insert(make('infosys', 'backend developer', 'Applied'), false);
        System.assert(!res.isSuccess(), 'Duplicate should be blocked');
        System.assert(res.getErrors()[0].getMessage().contains('already applied'));
    }

    @isTest
    static void controllerFiltersByStatus() {
        insert new List<Job_Application__c>{ make('TCS', 'Dev', 'Applied'), make('Wipro', 'Dev', 'Offer') };
        System.assertEquals(2, JobApplicationController.getApplications('All').size());
        System.assertEquals(1, JobApplicationController.getApplications('Offer').size());
    }
}
