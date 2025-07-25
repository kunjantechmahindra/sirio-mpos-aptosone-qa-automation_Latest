@VFG10X-153 @Regression @GiftCard
Feature: VFG10X-153 Gift Card _ Issue of New Gift Card by swiping the gift card_ Payment by Credit card

  Scenario: Gift Card _ Issue of New Gift Card by swiping the gift card_ Payment by Credit card

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card amount "50.00"
    And the sales assistant clicks on swipe button
    And the sales assistant clicks on Skip button

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application


