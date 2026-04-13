trigger AccountRatingTrigger on Account (before insert, before update, after update) {
    if (Trigger.isBefore) {
        AccountHandler.setRatingByRevenue(Trigger.new);
        CustomerSegmentationHandler.segmentByRevenue(Trigger.new);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        AccountHandler.createOpportunityForHotAccounts(
            Trigger.new,
            Trigger.oldMap
        );
    }
}