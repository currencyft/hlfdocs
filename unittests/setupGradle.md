## Setup Gradle

1. Setup the repositories on the gradle as below:

    ```
    repositories {
        mavenCentral()
        maven {
            url 'https://jitpack.io'
        }
    }

2. ***Note: If not setup as above, the following error might be thrown when adding kulid***
    
    ```Could not find com.github.guepardoapps:kulid:1.1.2.0.```