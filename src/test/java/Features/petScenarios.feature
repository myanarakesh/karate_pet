Feature: List of pet API scenarios

  Background: 
    * url  baseUrl
    * def createPetData = read('classpath:TestData/createPet.json')
    * def placeOrderData = read('classpath:TestData/placeOrderData.json')

  @addingPet
  Scenario: Adding a pet to store
    * def idVal = 551100
    Given path '/v2/pet'
    And request createPetData
    * eval karate.set('createPetData','$.id',idVal)
    When method post
    Then status 200
    And match $.id == idVal
    * def IDResponse = $.id
    * def CategoryResponse = $..category.name

  @petOrder
  Scenario: Place an pet order
    * def idVal = 6
    Given path '/v2/store/order'
    And request placeOrderData
    * eval karate.set('placeOrderData','$.id',idVal)
    When method post
    Then status 200
    And match $.id == idVal
    * def petId = $.id
