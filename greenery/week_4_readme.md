Project answers: week 4

Part 1:
# Which orders changed from week 3 to 4?
3 order_ids shipped within the past week: 
    '38c516e8-b23a-493a-8a5c-bf7b2b9ea995',
    'd1020671-7cdf-493c-b008-c48535415611',
    'aafb9fbd-56e1-4dcc-b6b2-a3fd91381bb6'


Part 2:
# Which steps in the funnel have largest drop off points?
Using Sigma - https://app.sigmacomputing.com/corise-dbt/workbook/workbook-3W19oKwGAA16LyGY5zhNRu
80% of sessions with a page view (578 sessions) had an add-to-cart event (467 sessions). Of those, 77% had a checkout event (361 sessions).
The difference is marginal, but this indicates that the add-to-cart -> checkout section of the funnel performs marginally worse (3%) than the page view -> add-to-cart section of the funnel.
I would prefer to conduct further analysis to validate these findings before giving any recommendations there.