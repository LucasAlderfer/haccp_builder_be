[![Build Status](https://travis-ci.com/LucasAlderfer/haccp_builder_be.svg?branch=master)](https://travis-ci.com/LucasAlderfer/haccp_builder_be)

## What Is This?
This repo is the backend for the HACCP plan builder, the front-end repo for which you can find here: https://github.com/benjaminpaige/haccp.  This application aims to help small businesses make their HACCP plans faster and easier so that they can get back to focusing on the real reason they started out on their own.

## TECH
- Rails 5.1.6 (with Ruby 2.4.1)
- Devise
- RSpec
- SimpleCov
- TravisCI

## ENDPOINTS
POST "/signup"
Required Parameters:
```
  {
    user:
      {
        email: 'a string that is an email address',
        password: 'a string'
      }
  }
```
- A successful POST will return:
```
  {
    id: (some integer id of the user),
    email: (the email address of the created user)
  }
```

POST "/login"
```
  {
    user:
      {
        email: 'a string that is an email address',
        password: 'a string'
      }
  }
```
- A successful POST will return:
```
  {
    id: (some integer id of the user)
  }
```
A header with a key of AUTHORIZATION will be returned with a hashed token that should be stored locally to authenticate the user's session.

POST "/api/v1/companies"
This company will be created as belonging to the currently logged in user, a user must be logged in to create a company.
Parameters:
```
  {
    company:
      {
        name: 'a name as a string', (required)
        address: 'an address as a string',
        team_member_1_name: 'string',
        team_member_1_title: 'string'
      }
  }
```
 Successful POST:
 status: 200,
 body:
```
  {
  id: integer
  }
```
 Failed POST:
 status: 500
 
 PUT "/api/v1/companies/:id"
 This action can only be taken by the user that owns the company.
 Parameters:
 ```
  {
    company:
      {
      name: 'a name as a string', (required)
      address: 'an address as a string',
      team_member_1_name: 'string',
      team_member_1_title: 'string'
      }
   }
 ```
 Successful PUT:
 status: 200,
 body:  The company object with the updated attributes
 
 Failed PUT:
 status: 500
 
 POST "/api/v1/companies/:id/products"
 Parameters:
 ```
 {
    product:
            {
              name: 'string'
            }
 }
 ```
 Successful POST:
 status: 200
 body:
 ```
 {
  id: (integer of the new id)
 }
 ```
 Failed POST:
 status: 500
 
 POST "/api/v1/products/:id/ingredients"
 Parameters:
 ```
 {
  ingredient:
    {
      name: string,  (required)
      receiving_from: string, (required)
      receiving_letter: boolean, (defaults to false)
      receiving_dna: boolean, (defaults to false)
      receiving_other: string, (defaults to empty string)
      receiving_hazard_bio: boolean, (defaults to false)
      receiving_hazard_chem: boolean, (defaults to false)
      receiving_hazard_phys: boolean, (defaults to false)
      receiving_hazard_handling: string, (defaults to empty string)
      storage_type: string, (required)
      storage_dna: boolean, (defaults to false)
      storage_other: string, (defaults to empty string)
      storage_hazard_bio: boolean, (defaults to false)
      storage_hazard_chem: boolean, (defaults to false)
      storage_hazard_phys: boolean, (defaults to false)
      storage_hazard_handling: string, (defaults to empty string)
      preparation_method: string, (required)
      preparation_dna: boolean, (defaults to false)
      preparation_other: string, (defaults to empty string)
      preparation_hazard_bio: boolean, (defaults to false)
      preparation_hazard_chem: boolean, (defaults to false)
      preparation_hazard_phys: boolean, (defaults to false)
      preparation_hazard_handling: string (defaults to empty string)
      packaging_method: string, (required)
      packaging_dna: boolean, (defaults to false)
      packaging_other: string, (defaults to empty string)
      packaging_hazard_bio: boolean, (defaults to false)
      packaging_hazard_chem: boolean, (defaults to false)
      packaging_hazard_phys: boolean, (defaults to false)
      packaging_hazard_handling: string (defaults to empty string)
     }
    }
 ```
Successful POST:
status: 200,
body: 
```
      {
        id: ingredient_id (integer)
       }
```
Failed POST:
status: 500,
body: 
```
      {
        error: "Unable to create ingredient"
       }
```
PUT "/api/v1/ingredients/:id"
Parameters: 
```
          {
            ingredient:
                        {
                          name: "new name" (can be any of the listed fields, as many as desired)
                         }
           }
 ```
 Successful PUT:
 status: 200,
 body: 
 ```
      {
        id: ingredient.id
      }
 ```
 Failed PUT:
 status: 500,
 body: 
 ```
        {
          error: "Unable to update ingredient"
        }
  ```
  
  DELETE "/logout"
   - Logs out the user
  status: 204

## Created By
[Tom King](https://github.com/tomkingkong)  
[Ben Paige](https://github.com/benjaminpaige)    
[Lucas Alderfer](https://github.com/LucasAlderfer)  
