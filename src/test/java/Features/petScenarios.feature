Feature: List of pet API scenarios

  Background: 
    * url  baseUrl
    * def createPetData = read('classpath:TestData/createPet.json')
    * def placeOrderData = read('classpath:TestData/placeOrderData.json')
    * def MyUtil = Java.type('Utilites.generateRandomValue')

  @addingPet
  Scenario: Adding a pet to store
    * def idVal = MyUtil.randomIntegerGenerarot(5)
    * def categorName = MyUtil.randomStringGenerarot(5)
    Given path '/v2/pet'
    And request createPetData
    * eval karate.set('createPetData','$.id',idVal)
    * eval karate.set('createPetData','$..category.name',categorName)
    When method post
    Then status 200
    And match $.id == idVal
    And match $..category.name contains categorName
    * def IDResponse = $.id
    * def categoryNameResponse = $..category.name

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
