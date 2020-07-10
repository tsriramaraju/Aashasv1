![Repository Banner](logo_full.svg)
## Table of Contents
- [Project Details](#project-details)
- [Aashas Boutique](#aashas-boutique)
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


# Project Details
An complete ecosystem for Aashas boutique where the could manage all their digital needs in simple touch of a button.

>Version: **1.0**



# Aashas Boutique

**Aasha’s** is a vibrant Couture and ready-to-wear fashion clothing house specializing in women and children’s wear. **Designed in Hyderabad.**

We design, develop and curate our collections at our head quarters in Hyderabad, the city in the confluence of North and South, Old and New, the Rural and Urban divide of India.

Established in 2011, it continues to draw its design and curating inspirations from the elegance, beauty, tenacity, strength, energy, humility, modesty, restraint, sagacious, gracious, sensuous, charming, exquisiteness of a woman.

---

<br>
<br>



# Server Documentation


## API Routes Ref:

The folowing are the rest api endpoints for the URL
>localhost:8000/api/v1

<br>

### **User's** Related API
|      Name       |  Type  | Privacy | End point              |           Payload           |       Response        |
| :-------------: | :----: | :-----: | :--------------------- | :-------------------------: | :-------------------: |
|  Register user  |  POST  | public  | /users/register        |       user JSON data        | user details with jwt |
|   Email login   |  POST  | public  | /users/login-email     |       user JSON data        | user details with jwt |
|  Mobile login   |  POST  | public  | /users/login-mobile    |       user JSON data        | user details with jwt |
| Forgot password |  POST  | public  | /users/forgot-password | user-email/mobile JSON data |          OTP          |
| Password reset  |  POST  | public  | /users/reset-password  |        OTP JSON data        | message- sucess/fail  |
|   Update user   |  POST  | private | /users/update          |       user JSON data        | message- sucess/fail  |
|  Add  address   |  POST  | private | /users/address         |       user JSON data        | message- sucess/fail  |
| Remove  address | DELETE | private | /users/address/:id     |                             | message- sucess/fail  |
|  Remove  user   | DELETE | private | /users/                |                             | message- sucess/fail  |

<br>

### **OTP** Related API
|     Name     | Type  | Privacy | End point     |        Payload        |       Response        |
| :----------: | :---: | :-----: | :------------ | :-------------------: | :-------------------: |
| Generate OTP | POST  | public  | /otp/generate | user-mobile JSON data |          OTP          |
| Verifty OTP  | POST  | public  | /otp/verify   |     OTP JSON data     | user details with JWT |

<br>

### **Product's** Related API
|            Name            |  Type  | Privacy | End point                       |      Payload       |       Response       |
| :------------------------: | :----: | :-----: | :------------------------------ | :----------------: | :------------------: |
|       Create product       |  POST  | private | /products                       | product JSON data  | message- sucess/fail |
|        Get products        |  GET   | public  | /products                       |                    |  Array of  products  |
|       Update product       |  PUT   | private | /products/:id                   | products JSON data | message- sucess/fail |
|       Delete product       | DELETE | private | /products/:id                   |                    | message- sucess/fail |
|    Get trendy products     |  GET   | public  | /products/trend                 |                    |  Array of  products  |
|   Get designer products    |  GET   | public  | /products/designer              |                    |  Array of  products  |
|      Add offer to all      |  PUT   | private | /products/offer-create          |  offer JSON data   | message- sucess/fail |
|   Remove offer from all    |  PUT   | private | /products/offer-remove          |  offer JSON data   | message- sucess/fail |
|   Add offer to category    |  PUT   | private | /products/offer-create-specific |  offer JSON data   | message- sucess/fail |
| Remove offer from category |  PUT   | private | /products/offer-remove-specific |  offer JSON data   | message- sucess/fail |
<br>

### **Custom-Product's** Related API
|          Name          |  Type  | Privacy | End point            |      Payload       |       Response       |
| :--------------------: | :----: | :-----: | :------------------- | :----------------: | :------------------: |
| Request custom product |  POST  | private | /custom-products     | product JSON data  | message- sucess/fail |  |
| Get my custom products |  GET   | private | /custom-products     |                    |  Array of  products  |
| Respond custom product |  PUT   | private | /custom-products/:id | products JSON data | message- sucess/fail |
| Delete custom product  | DELETE | private | /custom-products/:id |                    | message- sucess/fail |
<br>

### **Shopping Cart** Related API
|       Name       |  Type  | Privacy | End point |    Payload     |       Response       |
| :--------------: | :----: | :-----: | :-------- | :------------: | :------------------: |
|   Add to cart    |  POST  | private | /cart     | cart JSON data | message- sucess/fail |
|     Get cart     |  GET   | private | /cart     |                | Array of cart items  |
|    Clear cart    | DELETE | private | /cart     |                | message- sucess/fail |
| Remove from cart | DELTE  | private | /cart/:id |                | message- sucess/fail |
<br>

### **Favourite's** Related API
|       Name        | Type  | Privacy | End point   |       Payload        |       Response       |
| :---------------: | :---: | :-----: | :---------- | :------------------: | :------------------: |
| Toggle favourites | POST  | private | /favourites | favourites JSON data | message- sucess/fail |
|  Get favourites   |  GET  | private | /favourites |                      |  Array of products   |
<br>

### **Sales Banner** Related API
|        Name         |  Type  | Privacy | End point         |     Payload      |       Response       |
| :-----------------: | :----: | :-----: | :---------------- | :--------------: | :------------------: |
| Create sales-banner |  POST  | private | /sales-banner     | banner JSON data | message- sucess/fail |
|  Get sales-banners  |  GET   | private | /sales-banner     |                  |   Array of banners   |
| Remove sales-banner | REMOVE | private | /sales-banner/:id |                  | message- sucess/fail |
<br>

### **Order's** Related API
|           Name            | Type  | Privacy | End point                  |      Payload       |       Response       |
| :-----------------------: | :---: | :-----: | :------------------------- | :----------------: | :------------------: |
|      Get all orders       |  GET  | private | /orders/                   |                    | Array of order items |
|       Get my orders       |  GET  | private | /orders/get                |                    | Array of order items |
|     Get order status      |  GET  | public  | /orders/:id/:mobile        |                    |  order status data   |
|        Place order        | POST  | private | /orders/place              |  order JSON data   | message- sucess/fail |
|    Update order status    |  PUT  | private | /orders/:id                |  order JSON data   | message- sucess/fail |
| Get shipping calculations | POST  | public  | /orders/calculate-shipping | shipping JSON data |   shipping details   |
<br>

### **Designer** Related API
|         Name         |  Type  | Privacy | End point           |      Payload       |       Response       |
| :------------------: | :----: | :-----: | :------------------ | :----------------: | :------------------: |
| Update designer info |  PUT   | private | /designer           | designer JSON data | message- sucess/fail |
|  Get designer info   |  GET   | public  | /designer/          |                    |   designer details   |
|     Create blogs     |  POST  | private | /designer/blogs     |   blog JSON data   | message- sucess/fail |
|      Get blogs       |  GET   | public  | /designer/blogs     |                    |    Array of blogs    |
|     Remove blog      | DELETE | private | /designer/blogs/:id |                    | message- sucess/fail |

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