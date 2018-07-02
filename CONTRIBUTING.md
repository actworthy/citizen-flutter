# Thank you for considering contributing!
This project is about community, so your presence and consideration mean a lot!

## Getting starting
1. [Install Flutter](https://flutter.io/get-started/install/)!
2. Install or configure your IDE of choice. The Flutter [docs](https://flutter.io/get-started/editor/#androidstudio) describe how to configure Android Studio and VSCode with the proper Dart & Flutter Plugins. If you are new to Android development, Android Studio is recommended as it will provide you with the Android SDK out of the box and simplify set up.
    > If you need to install the Android SDK manually you can find it on the Android Studio [website](https://developer.android.com/studio/) under the "Command Line tools only" section at the bottom of the page.
3. Run `flutter doctor` to ensure IDE and flutter installations are good to go.
4. Make sure you have an emulator running. For Android this can either be done within Android Studio or by navigating to the emulator directory within the Android SDK tools location and running it with the `-avd` option followed by the device name. For example, I have a bash alias setup so that I can simply run `android pixel2` to start up a Pixel 2 emulator. My alias looks like this: `alias android='c:/Users/Samantha/AppData/Local/Android/sdk/tools/emulator -avd'`. Note that you will need to create and name an emulator through the avd before you can run one.
5. Run `flutter run`!


## Making changes
This is a baby project, so we don't have crazy contributing guidelines (yet). For now, follow this process:

1. Create or select an issue. If you select one, choose one that's tagged `up for grabs` & try to be sure no one else has claimed it in the comments. If you create an issue, wait for a contributor to respond with a comment and mark it with the `up for grabs` tag.
2. Once you've chosen the issue you'd like to work on, leave a comment that you'll be the one contributing so that others know it's being worked on.
3. Fork the project with the plan to make a pull request into the `development` branch once your code is complete.
4. Write failing tests for the new feature/fix (if this is a new feature or the existing tests are just lacking). Test coverage is very important to ensure that we can make changes safely in the future. 
5. Write the code! Try to follow the [Flutter style guidelines](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo), the [Dart guidelines](https://www.dartlang.org/guides/language/effective-dart/style), and the general style of the repo itself. A contributor may request changes if the style is too inconsistent from these guidelines.
6. Add yourself to the AUTHORS file to be recognized there for your hard work!
7. Run the tests. Make sure you get that satisfying green pass for your new feature or fix.
8. Create a pull request into the `development` branch! Mention the related issue in the pull request (ex: "fixes #112"). 
9. A contributor will review the pull request. They may request some changes, or may simply accept the PR. 
10. Thank you, you're awesome!
