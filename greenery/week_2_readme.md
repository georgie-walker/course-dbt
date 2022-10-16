Project answers: week 2

Part 1:
# What is our user repeat rate?
80%

# What are good indicators of a user who will likely purchase again? How would you assess thos.
I would complete exploratory analysis into whether RP% is affected by:
- what product the customer bought latest
- how long delivery takes
- whether they used a promo code with their latest order
- number of previous orders


Part 2:
# What assumptions are made about each model?
- There is at least 1 primary key for each model.
- At least some of the columns shouldn't contain null values.

# Did you find bad data?
Found some duplication caused by myself - I went back into the models to change this and re-ran the tests, which then passed.

Part 3:
# Rerun dbt snapshot - what orders changed?
3 order_ids shipped within the past week: 
    '914b8929-e04a-40f8-86ee-357f2be3a2a2'
    '05202733-0e17-4726-97c2-0520c024ab85'
    '939767ac-357a-4bec-91f8-a7b25edd46c9'

