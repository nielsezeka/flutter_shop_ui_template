# flutter_shop_ui_template_for_sale

A flutter UI template for sales

# 1. Techincal Note

## 1.1 About libraries.
Important notes below

Rxdart is from google bloc state management suggest in their official flutter conference(along with provider and redux. Other options may not good enough for production.), reference:

- https://www.youtube.com/watch?v=RS36gBEp8OI&ab_channel=GoogleDevelopers (Google I/O '18)
- https://www.youtube.com/watch?v=d_m5csmrf7I&ab_channel=Flutter (Google I/O'19)


## 1.2 About structures.


### 1.2.1 UI setup.

Widget splitted in to 2 seperated folder under `./presentationals`.

- screens: contains all screen in your app.
- widgets: contains the simple widget, that you can use to build their own screen if need. 

### 1.2.2 Bloc setup.

Splitted in to 2 folders:

- global:  the global bloc scope, control all the app(example, hold the data we fetch from api for caching, the user information about token...).
- screens: the screen scope, only use to control the state for targeted screen(example: validate text field, tikcking button...)

