![Repository Banner](logo_full.svg)
## Hello Codedamm

plz watch with video to know the project :-

https://youtu.be/V-L3nmxSCAY

This application is a complete ecommerce suite for clothing boutique. where all the heavy work is done in server coding and mobile flutter app.The website isn't very complex it's a simple website.

This is my first project, i would like to know how my coding standards are. thank you

(just added this part in github readme :))




## Table of Contents
- [Project Details](#project-details)
- [Aashas Boutique](#aashas-boutique)
- [Android APP Documentation](#android-app-documentation)
- [Server Documentation](#server-documentation)
  - [API Routes Ref:](#api-routes-ref)
    - [**User's** Related API](#users-related-api)
    - [**OTP** Related API](#otp-related-api)
    - [**Product's** Related API](#products-related-api)
    - [**Custom-Product's** Related API](#custom-products-related-api)
    - [**Shopping Cart** Related API](#shopping-cart-related-api)
    - [**Favourite's** Related API](#favourites-related-api)
    - [**Sales Banner** Related API](#sales-banner-related-api)
    - [**Order's** Related API](#orders-related-api)
    - [**Designer** Related API](#designer-related-api)
  - [Common **error messages** and **status code**](#common-error-messages-and-status-code)

<!-- >https://cdn.clipart.email/1c0dc2d792b273f08d5d43d370a8e347_batman-head-sketch-by-mike-zeck-in-malvin-vs-the-batman-_863-1224.jpeg -->

# Project Details
An complete ecosystem for Aashas boutique where the could manage all their digital needs in simple touch of a button.

>**Tech Stack :**<br>
>Hosting: **[HEROKU]()** <br>
>Backend: **[Node.JS](), [Express.JS]()**<br>
>Frontend-Web: **[React]()**<br>
>Frontend-Mobile: **[Flutter]()**<br>
>Database: **[Mongo DB]()**<br>
>Libraries: **[Redux](), [Node Mailer](), [Bcrypt](), [Express-Validator](), [Axios](), [JSON Web Token](), [Mongoose](), [Colors]()**<br>
>Version: **1.0**<br>




# Aashas Boutique

**Aasha’s** is a vibrant Couture and ready-to-wear fashion clothing house specializing in women and children’s wear. **Designed in Hyderabad.**

We design, develop and curate our collections at our head quarters in Hyderabad, the city in the confluence of North and South, Old and New, the Rural and Urban divide of India.

Established in 2011, it continues to draw its design and curating inspirations from the elegance, beauty, tenacity, strength, energy, humility, modesty, restraint, sagacious, gracious, sensuous, charming, exquisiteness of a woman.

---

<br>
<br>
# Android APP Documentation
The mobile is built with flutter
<br>



# Server Documentation



## API Routes Ref:

The folowing are the rest api endpoints for the URL
>[aashas.herokuapp.com/api/v1/](https://aashas.herokuapp.com/)

<br>

Postman Api Documentation link 
>[Postman Documentation](https://documenter.getpostman.com/view/12012771/T17NaQWj?version=latest)

### **User's** Related API
|      Name       |  Type  | Privacy | End point              |           Payload           |       Response       |
| :-------------: | :----: | :-----: | :--------------------- | :-------------------------: | :------------------: |
|  Register user  |  POST  | public  | /users/register        |       user JSON data        |      JWT Token       |
|   Email login   |  POST  | public  | /users/login-email     |       user JSON data        |      JWT Token       |
|  Mobile login   |  POST  | public  | /users/login-mobile    |       user JSON data        |      JWT Token       |
|    Get user     |  GET   |  user   | /users                 |                             |     User details     |
| Forgot password |  POST  | public  | /users/forgot-password | user-email/mobile JSON data |         OTP          |
| Password reset  |  POST  | public  | /users/reset-password  |        OTP JSON data        | message- sucess/fail |
|   Update user   |  POST  |  user   | /users/update          |       user JSON data        | message- sucess/fail |
|  Add  address   |  POST  |  user   | /users/address         |       user JSON data        | message- sucess/fail |
| Remove  address | DELETE |  user   | /users/address/:id     |                             | message- sucess/fail |
|  Remove  user   | DELETE |  user   | /users                 |                             | message- sucess/fail |

<br>

### **OTP** Related API
|     Name     | Type  | Privacy | End point |        Payload        |       Response        |
| :----------: | :---: | :-----: | :-------- | :-------------------: | :-------------------: |
| Generate OTP |  GET  | public  | /otp      | user-mobile JSON data |          OTP          |
| Verifty OTP  | POST  | public  | /otp      |     OTP JSON data     | user details with JWT |

<br>

### **Product's** Related API
|            Name            |  Type  | Privacy | End point                       |      Payload       |       Response       |
| :------------------------: | :----: | :-----: | :------------------------------ | :----------------: | :------------------: |
|       Create product       |  POST  |  admin  | /products                       | product JSON data  | message- sucess/fail |
|        Get products        |  GET   | public  | /products                       |                    |  Array of  products  |
|       Update product       |  PUT   |  admin  | /products/:id                   | products JSON data | message- sucess/fail |
|       Delete product       | DELETE |  admin  | /products/:id                   |                    | message- sucess/fail |
|    Get trendy products     |  GET   | public  | /products/trend                 |                    |  Array of  products  |
|   Get designer products    |  GET   | public  | /products/designer              |                    |  Array of  products  |
|      Add offer to all      |  PUT   |  admin  | /products/offer-create          |  offer JSON data   | message- sucess/fail |
|   Remove offer from all    |  PUT   |  admin  | /products/offer-remove          |  offer JSON data   | message- sucess/fail |
|   Add offer to category    |  PUT   |  admin  | /products/offer-create-specific |  offer JSON data   | message- sucess/fail |
| Remove offer from category |  PUT   |  admin  | /products/offer-remove-specific |  offer JSON data   | message- sucess/fail |
<br>

### **Custom-Product's** Related API
|          Name          |  Type  | Privacy | End point            |      Payload       |       Response       |
| :--------------------: | :----: | :-----: | :------------------- | :----------------: | :------------------: |
| Request custom product |  POST  |  user   | /custom-products     | product JSON data  | message- sucess/fail |  |
| Get my custom products |  GET   |  user   | /custom-products     |                    |  Array of  products  |
| Respond custom product |  PUT   |  admin  | /custom-products/:id | products JSON data | message- sucess/fail |
| Delete custom product  | DELETE |  admin  | /custom-products/:id |                    | message- sucess/fail |
<br>

### **Shopping Cart** Related API
|       Name       |  Type  | Privacy | End point |    Payload     |       Response       |
| :--------------: | :----: | :-----: | :-------- | :------------: | :------------------: |
|   Add to cart    |  POST  |  user   | /cart     | cart JSON data | message- sucess/fail |
|     Get cart     |  GET   |  user   | /cart     |                | Array of cart items  |
|    Clear cart    | DELETE |  user   | /cart     |                | message- sucess/fail |
| Remove from cart | DELTE  |  user   | /cart/:id |                | message- sucess/fail |
<br>

### **Favourite's** Related API
|       Name        | Type  | Privacy | End point   |       Payload        |       Response       |
| :---------------: | :---: | :-----: | :---------- | :------------------: | :------------------: |
| Toggle favourites | POST  |  user   | /favourites | favourites JSON data | message- sucess/fail |
|  Get favourites   |  GET  |  user   | /favourites |                      |  Array of products   |
<br>

### **Sales Banner** Related API
|        Name         |  Type  | Privacy | End point         |     Payload      |       Response       |
| :-----------------: | :----: | :-----: | :---------------- | :--------------: | :------------------: |
| Create sales-banner |  POST  |  admin  | /sales-banner     | banner JSON data | message- sucess/fail |
|  Get sales-banners  |  GET   | public  | /sales-banner     |                  |   Array of banners   |
| Remove sales-banner | REMOVE |  admin  | /sales-banner/:id |                  | message- sucess/fail |
<br>

### **Order's** Related API
|           Name            | Type  | Privacy | End point                  |      Payload       |       Response       |
| :-----------------------: | :---: | :-----: | :------------------------- | :----------------: | :------------------: |
|      Get all orders       |  GET  |  admin  | /orders                    |                    | Array of order items |
|       Get my orders       |  GET  |  user   | /orders/get                |                    | Array of order items |
|     Get order status      |  GET  | public  | /orders/:id/:mobile        |                    |  order status data   |
|        Place order        | POST  |  user   | /orders                    |  order JSON data   | message- sucess/fail |
|    Update order status    |  PUT  |  admin  | /orders/:id                |  order JSON data   | message- sucess/fail |
| Get shipping calculations | POST  | public  | /orders/calculate-shipping | shipping JSON data |   shipping details   |
<br>

### **Designer** Related API
|         Name         |  Type  | Privacy | End point           |      Payload       |       Response       |
| :------------------: | :----: | :-----: | :------------------ | :----------------: | :------------------: |
| Update designer info |  PUT   |  admin  | /designer           | designer JSON data | message- sucess/fail |
|  Get designer info   |  GET   | public  | /designer           |                    |   designer details   |
|     Create blogs     |  POST  |  admin  | /designer/blogs     |   blog JSON data   | message- sucess/fail |
|      Get blogs       |  GET   | public  | /designer/blogs     |                    |    Array of blogs    |
|     Remove blog      | DELETE |  admin  | /designer/blogs/:id |                    | message- sucess/fail |

<br>

---
---

## Common **error messages** and **status code**

Every error JSON response consists of same format.

```javascript
[
    {
      ...
        "msg": "Error Message",
    },
    {
      ...
        "msg": "Error Message",
]
```

| Status codes |      Error Type       |
| :----------: | :-------------------: |
|     307      |     Temp Redirect     |
|     400      |      Bad Request      |
|     401      |     Unauthorized      |
|     404      |       Not found       |
|     500      | Internal Server error |

>Unfound routes are redirected to a common error page.
