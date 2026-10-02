import { LightningElement, wire } from 'lwc';
import getApplications from '@salesforce/apex/JobApplicationController.getApplications';

const COLUMNS = [
    { label: 'Company', fieldName: 'Company__c' },
    { label: 'Role', fieldName: 'Role__c' },
    { label: 'Status', fieldName: 'Status__c' },
    { label: 'Applied On', fieldName: 'Applied_Date__c', type: 'date' },
    { label: 'Package (LPA)', fieldName: 'Package_LPA__c', type: 'number' }
];

export default class JobApplicationList extends LightningElement {
    columns = COLUMNS;
    status = 'All';
    applications;
    error;
    options = ['All', 'Applied', 'Interview', 'Offer', 'Rejected'].map((v) => ({ label: v, value: v }));

    @wire(getApplications, { status: '$status' })
    wiredApps({ data, error }) {
        if (data) {
            this.applications = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body ? error.body.message : 'Something went wrong';
            this.applications = undefined;
        }
    }

    handleChange(event) {
        this.status = event.detail.value;
    }
}
