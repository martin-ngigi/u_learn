# u_learn

Introduction to BloC state management.

## Getting Started

- [Dbestech Documentation](https://www.dbestech.com/tutorials/online-learning-course-app-tutorial)

## Add App to firebase.
- [Firebase documentation] (https://firebase.google.com/docs/flutter/setup?platform=ios)
- Steps:
1. Install the required command line tools
2. If you haven't already, install the Firebase CLI.
```
$ curl -sL firebase.tools | upgrade=true bash
or
$ sudo npm -g i firebase-tools
or 
$ sudo npm install -g firebase-tools --unsafe-perm
```
- Then:
```
$ firebase login
$ dart pub global activate flutterfire_cli
```
4. Configure your apps to use Firebase
```
$ flutterfire configure
```


# SHA-1 Generation for android Method 1 (NB: MOST RECOMMENDED WAY)
1. Right click on 'gradlew' and go to 'Open in Terminal' This file is found under {{YOUR PROJECT}}/android/gradlew
   1.1 Or Change directory to "android" i.e. cd android
2. Type in the following command.
```
gradlew signingReport
```
- or If did not work first try second command(on windows):
```
./gradlew signingReport
```
