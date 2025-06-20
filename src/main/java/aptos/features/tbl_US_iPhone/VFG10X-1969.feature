@VFG10X-1969 @Regression @GiftCard

Feature: VFG10X-1969 Gift Card _Top up by manually entering the gift card Number_ Existing Customer

  Scenario: Gift Card _Top up by manually entering the gift card Number_ Existing Customer

  # Login to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

  # Top-Up Gift Card
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on gift card button
    And the sales assistant clicks on existing gift card button
    And the sales assistant enters gift card number from index 2
    And the sales assistant enters gift card amount "100.00"
    And the sales assistant clicks on add value button

  # Payment transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application