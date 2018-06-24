# Thank you for considering contributing!
This project is about community, so your prescence and consideration mean a lot!

## Getting starting
1. [Install Flutter](https://flutter.io/get-started/install/)!
2. Install or configure your IDE of choice. The Flutter [docs](https://flutter.io/get-started/editor/#androidstudio) describe how to configure Android Studio and VSCode with the proper Dart & Flutter Plugins. If you are new to Android development, Android Studio is recommended as it will provide you with the Android SDK out of the box and simplify set up.
3. If you need to install the Android SDK manually you can find it on the Android Studio [website](https://developer.android.com/studio/) under the "Command Line tools only" section at the bottom of the page.
4. Run `flutter doctor` to ensure IDE and flutter installations are good to go.
5. Make sure you have an emulator running. For Android this can either be done within Android Studio or by navigating to the emulator directory within the Android SDK tools location and running it with the `-avd` option followed by the device name. For example, I have a bash alias setup so that I can simply run `android pixel2` to start up a Pixel 2 emulator. My alias looks like this: `alias android='c:/Users/Samantha/AppData/Local/Android/sdk/tools/emulator -avd'`. Note that you will need to create and name an emulator through the avd before you can run one.
6. Run `flutter run`!


## This is a baby project
We don't have crazy contributing guidelines (yet). For now, follow this process:
1. Create or select an issue. If you select one, choose one that's tagged `up for grabs`. If you create an issue, wait for a contributor to mark it with the `up for grabs` tag, or to respond with a comment.
2. Once you've chosen the issue you'd like to work on, mark it with the `in progress` label and leave a comment that you'll be the one contributing so that others know it's being worked on.
3. Write failing tests for the new feature/fix (if this is a new feature or if the existing tests are lacking). Test coverage is very important to ensure that we can make changes safely in the future. 
4. Write the code! Try to follow the [Flutter style guidelines](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo), the [Dart guidelines](https://www.dartlang.org/guides/language/effective-dart/style), and the general style of the repo itself. A contributor may request changes if the style is too inconsistent from these guidelines.
5. Run the tests. Make sure you get that satisfying green pass for your new feature or fix.
6. Create a pull request! Mention the related issue in the pull request (ex: "fixes #112"). 
7. A contributor will review the pull request. They may request some changes, or may simply accept the PR. 
8. Once your PR is accepted, you will be added to the AUTHORS file for your hard work!
9. Thank you, you're awesome!
