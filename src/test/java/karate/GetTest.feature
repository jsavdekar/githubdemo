@features
Feature: fetching User Details

  Background:
    * url 'https://reqres.in/api/'

  Scenario: Validate single User Email ID and validate single user details
    Given path 'users/2'
    When method GET
    Then status 200
    And assert response.data.email == 'janet.weaver@reqres.in'
    And match response == "#object"

  Scenario: Validate List of Resource
    Given path 'unknown'
    When method GET
    Then status 200
    And match response == {"page":1,"per_page":6,"total":12,"total_pages":2,"data":[{"id":1,"name":"cerulean","year":2000,"color":"#98B2D1","pantone_value":"15-4020"},{"id":2,"name":"fuchsia rose","year":2001,"color":"#C74375","pantone_value":"17-2031"},{"id":3,"name":"true red","year":2002,"color":"#BF1932","pantone_value":"19-1664"},{"id":4,"name":"aqua sky","year":2003,"color":"#7BC4C4","pantone_value":"14-4811"},{"id":5,"name":"tigerlily","year":2004,"color":"#E2583E","pantone_value":"17-1456"},{"id":6,"name":"blue turquoise","year":2005,"color":"#53B0AE","pantone_value":"15-5217"}],"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}

  Scenario: Validate Single user Resource id and text message
    Given path 'unknown/2'
    When method GET
    Then status 200
    And assert response.data.id =='2'
    And assert response.support.text == 'To keep ReqRes free, contributions towards server costs are appreciated!'

  Scenario: Validate List of users 2
    Given path "users"
    And param page = "2"
    When method GET
    Then status 200
    And match response.page == 2

  Scenario: Update users details using PATCH methode
    Given path 'users/2'
    And request
    """
    {
    "name": "morpheus",
    "job": "zion resident"
}
    """
    When method PATCH
    Then status 200
    Then print response

  Scenario: Delete User details
    Given path 'users/2'
    When method DELETE
    Then status 204
    And print response
