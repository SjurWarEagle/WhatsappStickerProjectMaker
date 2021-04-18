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
* change valid period to 20 years **don't forget to press APPLY**
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
## Copying
**From** tkunkel.de: `scp -i /home/torsten/.ssh/id_rsa_root_tkunkel.de root@tkunkel.de:/portable/jenkins/jenkins_home/android/android.jks .`

**To** tkunkel.de: `scp -i /home/torsten/.ssh/id_rsa_root_tkunkel.de android.jks root@tkunkel.de:/portable/jenkins/jenkins_home/android/`

# Google Playstore

# Create new Application
Open the [All Application](https://play.google.com/apps/publish/) overview and create new application.
* enter title, e.g. ``Inzaynia - Sticker``
* optional: Switch language to German
* 

# Communication
Text den Vorschlag zu unterbreiten:
```text
Hey :) Ich habe da mal eine Frage. Hast du etwas dagegen, wenn ich deine Twitch-Emotes als Sticker für WhatsApp/Telegram bereitstelle? 
Für Raupling und ein paar mache ich das schon z.B. https://play.google.com/store/apps/details?id=de.tkunkel.whatsapp.sticker.raupling Wäre nur für Android da es für iOS geld kostet. 
Aufwand für dich: keiner. 
Warum will ich das machen? Zum Einen weil ich die Sticker mag,  zum Anderen ist es für mich ein wenig das zurückgeben an die Community bei all der ARbeit die du dir machst. Da ich das schon für andere mache ist es kaum Arbeit für mich, habe viel automatisiert.
Technisch würde ich die Emotes von https://twitchemotes.com/ abgreifen, dadurch hast du keine Arbeit neue Emotes zuzusenden.
Denk doch bitte mal drüber nach und gib mir eine kleine Info wie du dich entschieden hast, wenn du irgendwelche Fragen hast, nur zu, ich beantworte gerne alle.
```
why only Android?
```
Android and Apple require the app to be uploaded in the store and you need to register for this. for android this costs 20$ one time for a lifetime, I did this years ago, for apple this costs 99$ each year. in addition to this apple apps can only be build with a mac, you need this to compile the app, even you acan write all source code you cannot compile it without an mac. I just am not willing to invest this money for such a project. What I advice apple users is to contact a android user that has the app and get the sticker sent, then inside whatsapp you can save them. a bit annyoying but the best I can do. for telegram it's all web  based so independend of the platform
```
