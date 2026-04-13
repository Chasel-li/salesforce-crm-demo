public class AccountHandler {
    public static void setRatingByRevenue(List<Account> accounts) {
        for (Account acc : accounts) {
            if (acc.AnnualRevenue == null) continue;
            if      (acc.AnnualRevenue >= 1000000) acc.Rating = 'Hot';
            else if (acc.AnnualRevenue >= 100000)  acc.Rating = 'Warm';
            else                                   acc.Rating = 'Cold';
        }
    }

    public static void createOpportunityForHotAccounts(
        List<Account> newAccounts,
        Map<Id, Account> oldMap
    ) {
        List<Opportunity> oppsToCreate = new List<Opportunity>();
        for (Account acc : newAccounts) {
            Account oldAcc = oldMap.get(acc.Id);
            Boolean justBecameHot = acc.Rating == 'Hot' && oldAcc.Rating != 'Hot';
            if (justBecameHot) {
                oppsToCreate.add(new Opportunity(
                    Name      = acc.Name + ' - Auto Opportunity',
                    AccountId = acc.Id,
                    StageName = 'Prospecting',
                    CloseDate = Date.today().addDays(90),
                    Amount    = acc.AnnualRevenue * 0.1
                ));
            }
        }
        if (!oppsToCreate.isEmpty()) insert oppsToCreate;
    }
}