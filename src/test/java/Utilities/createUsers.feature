Feature: Create a users

  Background: 
    * url  baseUrl
    * def testData = read('./petUser.json')

  Scenario: Create a user with array
    Given path 'v2/user/createWithArray'
    When request testData
    And method post
    Then status 200

  Scenario: Search user by userID
    Given path 'v2/user/createWithArray'
    And request testData
    And method post
    And path 'v2/user/'+testData[1].username
    When method get
    Then status 200
    And match $.username == testData[1].username

  Scenario: Search user which dosn't exist in a system
    Given path 'v2/user/rajeshmora'
    And method delete
    And path 'v2/user/rajeshmora'
    When method get
    Then status 404

  Scenario: Update a user
    * string userID = testData[0].id
    Given path 'v2/user/'+testData[1].username
    When request testData[0]
    And method put
    Then status 200
    And match $.message == userID

  Scenario: Validate user login
    Given path 'v2/user/login/'
    And param username = 'randomuser'
    And param password = testData[1].password
    And method get
    Then status 200
    And match $.message contains 'logged in user'

  Scenario: Delete a user
    Given path 'v2/user/createWithArray'
    And request testData
    And method post
    And path 'v2/user/'+testData[1].username
    And method delete
    Then status 200
    And match $.message == testData[1].username
