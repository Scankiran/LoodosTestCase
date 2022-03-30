
# Loodos Test Case

This app created for Loodos Test Case task. In this application users can search movies and check movies detail informations.

## Architecture
* When developing the app, I choose MVVM architecture because there are two screens at all, and a kinda small application. MVVM played an important role in making the code simpler. If VIPER was used instead of MVVM, some complexity and crowding could occur in the code.

* For image cache mechanism, Kingfisher pod used.

* Push Notifications implemented. Ready to use.

* Firebase Analytics Log Event mechanism implemented.

* I added a custom Gesture Handler to handle tap, double-tap, swipe left and swipe right. 

* I added custom Constants class to fetch strings and other constant properties. 

* I preferred XiB to create views and used auto layout. If there will be a complicated view, I will be preferred SnapKit or classical programmatic view.

* I added a custom `BaseTableViewCell` and custom extension methods to TableView to make easier register cells and use cells on table view delegate function.

* Checked memory leaks, no issue.

* Tested on iPhone 12 Mini - iOS 15.4

## Installation
If you want to clone and build project, you has to `pod install`.

## Screens

 There are three screen. Main View, Detail View and Splash View. Let's check these out;
 
### Splash View
On Splash View, first checks the internet connection. If there is no connection, an alert show to user. 'Okey' button on alert check internet connection again and again if clicked. 

If there is a connection, FirebaseRemoteConfigManager fetch remote configs then show a message which is 'Loodos'. After 3 second of showed this message, app will navigated to Main View.

### Main View
On Main View, users can search movies. The search mechanism works 0.8 seconds after the user stops typing. This prevent uncessary search requests. 

After search, if there is an error, ProgressHud shows an alert with error description. If search result return successfully, base movie data shows on Main View. 

### Movie Detail View
On Detail View, users can see details of movie with bigger poster image. In this page, movie base informations logged to Firebase Analytics.

## Demo Video

You can demo video of application with this link;
https://www.youtube.com/watch?v=9VM1Oot_rl0
