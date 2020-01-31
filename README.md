# Overall Idea
The idea of this project is to automatically adjust the source of the official [WhatsApp Sticker project](https://github.com/WhatsApp/stickers/|) to a custom usage. This then can be used for new packages, but also for source updates.
Because if the source is adjusted automatically an update is as easy as running this tool suite.

# Components
## Initial script
The base script is createNew.sh this checks the current sources from github and replaces folders and strings.

## Additional Files
for the final build things links Docker images and Jenkins files are needed, they are in the folder `additionalFiles` and are copied to the project by createNew.sh.

# Signing APK
You need a [keystore](https://docs.oracle.com/cd/E19509-01/820-3503/ggfen/index.html) there is a nice UI for this [ KeyStore Explorer](https://keystore-explorer.org/).
Create a new keystore or create an existing one, after that, create a new key pair by rightclicking.
* RSA 2048 bit
* changev alid period to 20 years **don't forget to press APPLY**
* edit name, enter your Information
* confirm and enter an alias, this will be used later, e.g. whatsapp-mynicestickers

Now create a file `android_keystore_mystickers.properties`
```properties
mynicestickers_storeFile=/builddir/android.jks
mynicestickers_storePassword=yourpassword
mynicestickers_keyAlias=whatsapp-mynicestickers
mynicestickers_keyPassword=yourpassword
mynicestickers_track=alpha
mynicestickers_releaseStatus=inProgress
mynicestickers_serviceAccountCredentials=/builddir/android_service_account.json
```
The paths will be used inside the docker image, so don't worry no adjustment needed.

# Google Playstore

# Create new Application
Open the [All Application](https://play.google.com/apps/publish/) overview and create new application.
* enter title

