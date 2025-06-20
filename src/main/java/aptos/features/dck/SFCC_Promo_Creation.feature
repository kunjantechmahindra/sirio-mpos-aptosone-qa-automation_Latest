@SFCC @PrerequisiteRequired

Feature:SFCC-Create SFCC Promotion with coupon

  Scenario: SFCC-Create SFCC Promotion with coupon

    # Login and select site
    Given the sales assistant launches SFCC application
    And the sales assistant login to SFCC application
    And the sales assistant selects "TBL POS" as site

    # Create Compaign
    And the sales assistant selects campaigns from merchant tools
    And the sales assistant wait for the page to visible
    And the sales assistant clicks on new button
    And the sales assistant enter the compaign name "13022025"
    And the sales assistant enter the promotion description "10% off with coupon"
    And the sales assistant select start date "10-Jan-2024"
    And the sales assistant select end date "12-Jan-2025"
    And the sales assistant click on source codes button
    And the sales assistant select the source codes "200178"
    And the sales assistant enter the coupon code "14020000"
    And the sales assistant select the compaign currency "US"
    And sales assistant clicks on apply button in campaign page

    # Create new promotion
    And sales assistant selects promotions from merchant tools
    And the sales assistant wait for the page to visible
    And the sales assistant clicks on new button in promotion
    And the sales assistant enter the Promotion ID
    And the sales assistant enter the promotion name
    And the sales assistant set the exclusivity
    And the sales assistant enter apply button
    And the sales assistant select the promotion class
    And the sales assistant select the discount Rule
    And sales assistant update the UPC's for the promotion
    And sales assistant select the SKU for "Promo-with-coupon-category"
    And sales assistant clicks on Apply button in promotion page

    # combine compaign and promotion
    And the sales assistant selects campaigns from merchant tools
    And the sales assistant enter the compaign ID for combining
    And the sales assistant clicks in Add Experience Button
    And the sales assistant clicks on Add Promotion Button
    And the sales assistant enter the promotion ID for combining
    And sales assistant clicks on apply button in campaign page

   #Run the Job
    And sales assistant clicks on Jobs from administration tab
    And sales assistant clicks on export promotion JSON for "TBL"
    And sales assistant clicks on Schedule and History Tab
    And sales assistant clicks on run button
    And sales assistant quit the browser