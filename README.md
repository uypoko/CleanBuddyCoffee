# CleanBuddyCoffee
BuddyCoffee is a food delivery application in which users can order drinks from a coffee shop.
## Features
* Display the list of available items
* Add items to a cart
* Display the cart
* Submit the order
## Roadmap
* View order history
* Get user-friendly location on map to quickly set address while ordering
* Sign in an active account and sign up a new account
* Upload users profile picture
* Update users information
* Update users password
## Prerequisites
* Install Xcode 10.1 or later.
* Install CocoaPods 1.4.0 or later.

If cocoapods has not been installed, run the following command from the terminal.
```bash
$ sudo gem install cocoapods
```
## Installation
### Step 1: Add the Firebase configuration file
  Move the GoogleService-Info.plist file into the root of the BuddyCoffee project.
### Step 2: Install necessary dependencies

Open a terminal and cd to the directory containing the Podfile.
```bash
$ cd <path-to-project>/BuddyCoffee/
```

Run the pod install command. This will install the SDKs specified in the Podspec, along with any dependencies they may have.
```bash
$ pod install
```

### Step 3: Open the app's .xcworkspace file to launch Xcode
## Built with
* [VIPER](https://www.objc.io/issues/13-architecture/viper/) - App architecture
* [Cocoapods](https://cocoapods.org/) - Dependency Management
* [Firebase](https://firebase.google.com/) - The back end
## Acknowledgments
* [Validators](https://github.com/Arrlindii/AAValidators) - Form Validation
* [Multiple Storyboards](https://medium.com/@gurdeep060289/clean-code-for-multiple-storyboards-c64eb679dbf6)
