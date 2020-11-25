Feature: List of Pet API scenarios

  Background: 
    * url  baseUrl
    * def createPetData = read("file:src/test/resources/TestData/createPet.json")
    * def placeOrderData = read('file:src/test/resources/TestData/placeOrderData.json')
    * def MyUtil = Java.type('Utilites.generateRandomValue')

  @addingPet @new
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

  Scenario: Searh ing a added pet
    * def orderPet = call read('pet.feature@addingPet')
    * def getID = orderPet.IDResponse
    * def getCategory = orderPet.categoryNameResponse
    Given path '/v2/pet/findByStatus'
    And param status = 'available'
    When method Get
    Then status 200
    And match $.*.id contains getID
    And match $..category.name contains getCategory
