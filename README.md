# iRippleCodingTest
TECHNICAL EXAM - JEAN
Exam: iOS app for Imonggo API

Create a simple iOS application that logs in an Imonggo user and displays all the Products.
Here are the specs:

1. On application launch, display a login screen with three fields and a login button
    - account_name
    - email
    - password

Test account:
        Account name: kawali
    Email: kawali@test.com
    Password: kawali

2. Upon tapping login, the app should fetch the url using the following API

https://secure.imonggo.com/system/api_url?account_id=<account_name>

3. Once you have the url, fetch the token using the following API

<url>/api/tokens.json?account_name=<account_name>&email=<email>&password=<password>

Use the token to authenticate proceeding API calls (Basic authentication):
Username: <token>
Password: x

4. Proceed with displaying all the products on a TableView

- Endpoints: 

<url>/api/products.json?q=count
Returns the total number of products

<url>/api/products.json?page=1
Retrieves list of products (50 products per page)






    - Product properties to display:
        - Thumbnail
        - Name
        - Stock number
        - Retail Price
        - Tags
        - Description (if available)

Additional Specs:
1. Use Swift 5
2. Supports iOS 10 and above
3. Portrait and Landscape (iPhone and iPad)
4. Tableview cells must be dynamic in height

You may use any frameworks/libraries needed.
You may refer to http://support.imonggo.com/help/kb/api/introduction-to-imonggo-api for Imonggo API documentation


Bonus points:
* Upload your project to a repository of your choice.
* Use MVVM or VIPER as architecture
* Use Moya or Alamofire for network requests
* Save products to CoreData and data are available offline
