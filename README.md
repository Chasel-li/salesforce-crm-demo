# Salesforce CRM Revenue Recovery Demo

A full end-to-end CRM automation demo built on Salesforce Developer Org,
simulating a real revenue decline analysis and recovery workflow.

## Business Case
Identified a $480k YoY revenue decline across 16 customer accounts.
Built an automated segmentation and reporting system to diagnose the
root cause and prioritize re-engagement efforts.

## What It Does
| Step | What | Why |
|---|---|---|
| Data Model | 8 custom fields on Account | Enable funnel + segmentation analysis |
| SOQL Queries | Funnel, region, revenue analysis | Identify where decline is happening |
| Auto Segmentation | Apex Trigger + Handler | Classify customers at scale |
| Opportunity Automation | Trigger on rating change | Auto-create follow-up when account turns Hot |
| Dashboard | 4-chart revenue recovery view | Deliver insights to stakeholders |

## Key Insight
14 At Risk accounts = $480k revenue at risk.
Average email open rate for Churned segment: 0.1% vs 0.6% for High Value.
→ Email re-engagement campaign is the recommended first intervention.

## Tech Stack
- Salesforce Apex (Trigger + Handler pattern)
- SOQL (funnel and segmentation analysis)
- Salesforce Lightning Reports & Dashboards
- Custom Object Fields (data model extension)

## Files
- `triggers/` — AccountRatingTrigger
- `classes/` — AccountHandler, CustomerSegmentationHandler
- `queries/` — SOQL analysis queries