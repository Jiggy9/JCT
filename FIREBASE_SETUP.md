## Welcome all contributors

## Before starting to contribute in your local repository you should have **Firebase configured in the project**

 **Let's start with the configuration** 

### Check for these files in your cloned/updated repository

*   firebase.json
*   firebase\_options.dart
*   google-services.json

If you find these files delete them from your side **Ohh don't worry** we'll going to set up all these.

          Now let's check do you have Firebase installed in your system!

**Step 1:  Install firebase tools**

 open your terminal and type `firebase --version` if it shows the version it means you have firebase CLI installed. Otherwise, you have to install the Firebase first to install the Firebase CLI run the command `npm install -g firebase-tool` I install the firebase tools globally.

Now you have installed the Firebase and CLI time to log into the Firebase using CLI run `firbase login` it will open the an window login to your account.

### **Step 2:  Install flutterfire cli**

1.  Log into Firebase using your Google account by running the following command:

```diff
firebase login
```

   2. Install the FlutterFire CLI by running the following command from any directory:

```diff
   dart pub global activate flutterfire_cli
```

###    Step 3: Configure your apps to use Firebase

Use the FlutterFire CLI to configure your Flutter apps to connect to Firebase.

From your Flutter project directory, run the following command to start the app configuration workflow:

```diff
flutterfire configure
```

**note: if you are in Windows it will only work in the CMD terminal due to PowerShell privacy concerns**

when running Flutterfire configure its checks for all projects in your repo if there is no firebase.json file then it will create a project for you choose the project name and platform and you are ready to go. for more details  go [here](https://firebase.google.com/docs/flutter/setup?platform=android)

### After your contribution 

> Remeber do not commit you firebase.json, google-services.json and firebase\_options.dart file to Github

Always follow these three things before pulling the main.

```diff
git stash 
```

To stash your Firebase configuration 

```diff
git pull upstream main 
```

This keeps you updated with the base repository

```diff
git stash pop
```

Get back your stash files