@VFG10X-24 @SaleTransaction @Regression @GiftCard @Card
Feature: VFG10X-24 Sale Transaction _Single Item with Tax Override and Coupon Applied_ Payment by Gift card & Cash

  Scenario: Sale Transaction _Single Item with Tax Override and Coupon Applied_ Payment by Gift card & Cash

  # Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "Coupon-10%" product to the basket without customer

  # Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-10%"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% with coupon" is applied to item

  # Apply Tax override
    Given the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 3
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 3%" is applied to item

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 3
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 3
    And the sales assistant validate the partial payment by gift card
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application

  # E-receipt Validation
    And the sales assistant launch the browser and navigate to YOP mail
    And the sales assistant validate the payment details on e-receipt
    And the sales assistant validate details "10% with coupon" in E-receipt
    And the sales assistant validate details "Tax 3%" in E-receipt
    And the sales assistant validate details "GiftCard" in E-receipt
    And the sales assistant validate details "Cash" in E-receipt
    And the sales assistant closes the browser window.

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Gift Card" in EJ
    And the sales assistant validate details "Cash" in EJ
    And the sales assistant validate details "3%" in EJ
    And the sales assistant logout from EJViewer