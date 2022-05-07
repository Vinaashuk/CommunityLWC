public with sharing class CommunityAllTrainingDetailsClass {
    @auraEnabled(cacheable=true)
    public static List<Training__c> communityMethod(String trainingType) {
        List<Training__c> tList = new List<Training__c>();
        if (String.isBlank(trainingType) || trainingType == 'All') {
            tList = [
                SELECT
                    Id,
                    Course_Image__c,
                    Course_Name__c,
                    Course_Source__c,
                    Course_Type__c,
                    Description__c,
                    Status__c,
                    Applicable_for__c,
                    Course_link__c
                FROM Training__c
                WHERE Status__c = 'Active'
                ORDER BY CreatedDate ASC
            ];
            return tList;
        } else {
            tList = [
                SELECT
                    Id,
                    Course_Image__c,
                    Course_Name__c,
                    Course_Source__c,
                    Course_Type__c,
                    Description__c,
                    Status__c,
                    Applicable_for__c,
                    Course_link__c
                FROM Training__c
                WHERE Status__c = 'Active' AND Applicable_for__c = :trainingType
                ORDER BY CreatedDate ASC
            ];
            return tList;
        }
    }
}
