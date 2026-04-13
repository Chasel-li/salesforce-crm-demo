public class CustomerSegmentationHandler {
    public static void segmentByRevenue(List<Account> accounts) {
        for (Account acc : accounts) {
            if (acc.Last_Year_Revenue__c == null || acc.Last_Year_Revenue__c == 0) {
                acc.Customer_Segment__c = 'New';
                acc.Retention_Score__c  = 50;
                continue;
            }
            Decimal decline  = acc.Last_Year_Revenue__c - acc.This_Year_Revenue__c;
            Decimal declinePct = decline / acc.Last_Year_Revenue__c;
            Decimal emailOR  = acc.Email_Open_Rate__c != null ? acc.Email_Open_Rate__c : 0;

            if      (declinePct >= 0.5 || emailOR < 0.1) { acc.Customer_Segment__c = 'Churned';    acc.Retention_Score__c = 10; }
            else if (declinePct >= 0.25 || emailOR < 0.25){ acc.Customer_Segment__c = 'At Risk';   acc.Retention_Score__c = 40; }
            else if (declinePct < 0.1 && emailOR >= 0.5)  { acc.Customer_Segment__c = 'High Value';acc.Retention_Score__c = 90; }
            else                                           { acc.Customer_Segment__c = 'At Risk';   acc.Retention_Score__c = 60; }
        }
    }
}