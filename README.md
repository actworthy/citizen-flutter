# ActWorthy
This is the ActWorthy app for citizen users (anyone who is not an organization or activist). 


## What is ActWorthy?
Our mission is to help people deepen their relationship with their community through action. ActWorthy is social media for social change. We are creating the platform that makes people feel compelled to take action in their community. "Action" might include donating, volunteering, or any community-oriented action you can think of. At its core, ActWorthy is a feed of actions you can take to impact the issues you care about in the community you live in.

## Why social media for social change?
The current media ecosystem is designed for collective consumption, not collective action. It is designed for decentralized friend groups, families, and colleagues. ActWorthy is facilitating collective action in your city, district, county, and state. Social change requires new ways of communicating and coordinating action. We want ActWorthy to be the platform for that.

## What makes people want to take action to make their community better?
- Discovering what actions they can take
- Having empathy for people impacted by a cause or issue (often from personal experience)
- Believing that their action makes a difference
- Seeing friends, family, and community members taking action
- Viewing the action as simple, achievable, and frictionless
- Knowing the impact of previous actions
- Gaining appreciation and social cache for taking action
- Receiving rewards or credit for taking action
 
> We are building the platform that reinforces these dynamics. We need your help to make these real. We want your ideas for how to encourage more action.

## Why is this an open source project?
ActWorthy is about building community. We believe the best way to build community is through a community of developers who want to help people make change. As developers, we know that code is our preferred way of contributing. ActWorthy is a great way to work together to **make change through code**.


#### If you're interested in contributing, feel free to join the contributors [Slack](https://join.slack.com/t/actworthycontributors/shared_invite/enQtMzg3OTAwMDI0NTY3LWEzYjFkZWNmNThmZTc0NWM0NDFmODQ4NDNkNzRhMTMzN2I4YTUyMjg3MDY1MTY3OTJhZGQ4NjViMWNhZTQzODI) channel!

## Tech stack
**Flutter (Dart 2) and Redux**

This is a cross platform app built with Google's [Flutter](https://flutter.io/) SDK. Flutter is a reactive framework that is modeled after Facebook's React. With that in mind Redux, makes sense for handling the fairly complex state this app entails.

## App architecture

If there are better names and structures, feel free to mention them in an issue, these are not hard and fast this early in project development!

- `android` - native Android code. Has the same directory structure as a vanilla Android project
- `assets` - image and other raw assets (ex: json)
    - `fonts` - icon and type fonts
- `build` the output for builds! Autogenerated.
- `ios` - native iOS code
- `lib` - this is where the flutter code lives
    - `constants` - Dart constants. For example: icon constants live here
    - `middleware` - Redux middleware. Middleware are called just before the Reducers
    - `models` - Plain old Dart objects representing data models
    - `reducers` - Redux Reducers. These take in changes to the state and produce a new app state from those changes
    - `redux-actions` - The Redux Actions that Reducers use to determine how to alter state
    - `ui` - User Interface classes
        - `partials` - maller than screens and views, these widgets are reusable components. Ex: stylized `AppBar` or special checkboxes
        - `screens` - Widgets that take up the entire phone viewport from top to bottom. Usually a `Scaffold` at top level
        - `views` - Widgets that take up _most_ of a screen. Typically inside of the `body` parameter of a `Scaffold`
- `test` - Tests in here.


## Resources

- **UI Mockups**
    - These can be found in the [UI Design PDF](https://github.com/actworthy/citizen-flutter/blob/master/mobile-design.pdf)

- **Flutter**:
    - [documentation](https://flutter.io/docs/)

- **Redux & Flutter**:
    - redux.dart [homepage](https://github.com/johnpryan/redux.dart)
    - Brian Egan's [talk](https://www.youtube.com/watch?v=zKXz3pUkw9A) at DartConf detailing why and how 
    - [Example repo](https://github.com/brianegan/flutter_architecture_samples/tree/master/example/redux)
    - [A simple howto](https://hackernoon.com/flutter-redux-how-to-make-shopping-list-app-1cd315e79b65)

## Filing Issues
At least for now, there aren't any strict guidelines about this. Just try to be specific and clear, and file away :) One of the contributors will get to it and respond to or tag it. 

If you'd like, feel free to write the fix yourself once a contributor approves the issue for fixing (by tagging it with the `up for grabs` label). For more information on contributing, see the [contributing](https://github.com/actworthy/citizen-flutter/blob/master/CONTRIBUTING.md) guide! 

Thank you for your help!