
# WeatherApp

## Description

# WeatherApp is developed using Swift in MVVM architecture with swiftUI screens and swift classes for functionality.

# Features
* Add city name
* list of weather status for 3 days


# Installing
Run the app using XCode 15

# Instructions
Run the app in simulator and you can see Cities screen with "+" button at the top right corner. When you click on it, user can see Addcity screen where user can enter any city name, state code(like TS),country name(like India).
When user taps on save button, user can see list of weather details for 3 days


#screenshots

|![Light](Screenshots/LightMode- citylistscreen.png)|![Dark](Screenshots/DarkMode- citylistscreen.png)|
|:----------------------------:|:------------------------:|
|Home Light Mode| Home Dark Mode |

|![Light](Screenshots/LightMode- Addcity-lightmode.png)|![Dark](Screenshots/DarkMode- Addcity-darkmode.png)|
|:----------------------------:|:------------------------:|
|Home Light Mode| Home Dark Mode |


# Api Source
[Location API] - https://api.openweathermap.org/geo/1.0/direct?q=\(city),\(state),\(country)&limit=5&appid="
[Weather forecast API] - https://api.openweathermap.org/geo/1.0/direct?q=\(city),\(state),\(country)&limit=3&appid=
