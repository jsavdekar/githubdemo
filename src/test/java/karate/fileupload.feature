Feature: file upload
  Background:
    #* url 'https://filebin.net'

    Scenario: file upload Testcases
      Given path '/'
      # Telling to karate what we send
      And header Content-Type = 'multipart/form-data'
      And multipart file file =  { read : 'And multipart file file =  { read : 'buddha.jpg' }
      When method POST
      Then status 201

  Scenario: Create new drug
    * print tokenID