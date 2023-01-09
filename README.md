<!--[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)-->

<!--# macOS Installer Builder
Generate macOS installers for your applications and products from one command.

For more detailed process please refer medium blog about the macOS installer builder: https://medium.com/swlh/the-easiest-way-to-build-macos-installer-for-your-application-34a11dd08744-->

<!--<p align="center"> 
  <img src="https://cdn.dribbble.com/users/1161517/screenshots/7896076/apple-logo-animation.gif" width="600" height="450" />
</p>-->

<!--Please suggest any modifications that will improve these implementations by reporting an issue. Happy to help you!

Cheers!! 🍺-->

# My notes
**Based on [article](https://medium.com/swlh/the-easiest-way-to-build-macos-installer-for-your-application-34a11dd08744) and observations**

# You need maven & ballerina

```sh
./maven_ballerina.sh
```

# Steps

1) Clone macos-installer-builder repository to your local machine...

2) Copy your application's distribution files (which you need to be copied after the installation) to application directory which located at:

```sh
<REPO_HOME>/macOS-x64/application
```

3) Modify welcome.html, conclusion.html, and banner.png with your application's information. You can find these resource files in the following location.

```sh
<REPO_HOME>/macOS-x64/darwin/Resources/
```

4) Add your modifications to the post-installation script file. This script will run automatically after the installation, and you can add your needed functionalities to this file. The file is located at:

```sh
<REPO_HOME>/macOS-x64/darwin/scripts/postinstall
```

As an example &ndash; in their postinstall file, they added a shortcut creation function which creates a shortcut to their application's executable file. In WSO2 API Manager, we need to run `wso2server.sh` to start the server.

You can set the following parameter to your application distribution's executable file and create a shortcut.

```sh
APPLICATION_FILE_PATH=<PATH_TO_EXECUTABLE_FILE>
```

5) Run the following command to build your macOS installer.

```sh
./macOS-x64/build-macos-x64.sh myAwesomeProject 1.1.1
```

```sh
./macOS-x64/build-macos-x64.sh [APPLICATION_NAME] [APPLICATION_VERSION]
```

**Note:** You should provide an application name and application version.

In addition, application version should be `[0–9].[0–9].[0–9]` pattern. ( Example: `2.6.0` ).

Your stuff will be created here:

```sh
macOS-x64/target/package/myAwesomeProject.pkg
macOS-x64/target/pkg/myAwesomeProject-macos-installer-x64-1.1.1.pkg
```
