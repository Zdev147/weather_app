
# task
Weather App

### Used packages

- flutter_bloc: used for state management
- connectivity_plus: for checking internet connectivity
- cached_network_image: to show network images and cache them
- flutter_svg: to view svg images
- shimmer: used to show loading animation
- dio: used to call apis
- location: to get device location
- geocoding: used to convert string address to lat lng and vice versa



### Application structure

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains static constant class file
    │   └── utils                   - It contains common files and utilities of the application
    ├── presentation                - It contains widgets of the screens 
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```
