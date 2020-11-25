Feature: List of Store API scenarios

  Background: 
    * url  baseUrl
    * def testData = read('file:src/test/resources/TestData/petUser.json')
    * def placeOrderData = read('file:src/test/resources/TestData/placeOrderData.json')
    * def MyUtil = Java.type('Utilites.generateRandomValue')

  @petOrder
  Scenario: Place an pet order
    * def idVal = MyUtil.randomIntegerGenerarot(5)
    Given path '/v2/store/order'
    And request placeOrderData
    * eval karate.set('placeOrderData','$.id',idVal)
    When method post
    Then status 200
    And match $.id == idVal
    * def petIdValue = $.id

  Scenario: Get orderd pet details
    * def petOrder = call read('store.feature@petOrder')
    * def petOrderId = petOrder.petIdValue
    Given path '/v2/store/order/'
    And path petOrderId
    When method get
    Then status 200
    And match $.id == petOrderId
