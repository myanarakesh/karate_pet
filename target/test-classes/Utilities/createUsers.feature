Feature: Create a users

  Background: 
    * url  baseUrl
    * def testData = read('./petUser.json')

  @createUser
  Scenario: Create a user with array
    Given path 'v2/user/createWithArray'
    When request testData
    And method post
    Then status 200

  @serachUser
  Scenario: Search user by userID
    Given path 'v2/user/'+testData[1].username
    When method get
    Then status 200
    And match $.username == testData[1].username

  @updateUser
  Scenario: Update a user
    * string userID = testData[1].id
    Given path 'v2/user/'+testData[1].username
    When request testData[1]
    And method put
    Then status 200
    And match $.message == userID

  @userLogin
  Scenario: Validate user login
    Given path 'v2/user/login/'
    And param username = testData[1].username
    And param password = testData[1].password
    And method get
    Then status 200
    And match $.message contains 'logged in user'

  @deleteUser
  Scenario: Delete a user
    Given path 'v2/user/'+testData[1].username
    And method delete
    Then status 200
    And match $.message == testData[1].username
