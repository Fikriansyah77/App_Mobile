Java 21 upgrade notes

This project has been updated to target Java 21 in the Android Gradle files.

Manual steps you should perform locally before building:

1. Install JDK 21

   - Download and install a JDK 21 distribution (e.g., Adoptium / Temurin, Oracle, or any distribution you trust).
   - On Windows, set JAVA_HOME to point to the JDK 21 install directory and add `%JAVA_HOME%\bin` to your PATH.

2. Verify the JDK is visible to Gradle

   - Verify `java -version` in PowerShell shows Java 21.
   - If Gradle still uses a different JDK, set `org.gradle.java.home` in `android/gradle.properties` to the JDK 21 path, for example:
     org.gradle.java.home=C:\\Program Files\\Eclipse Adoptium\\jdk-21\\

3. (Optional) Use Gradle toolchain (if needed)

   - Newer Gradle/AGP versions support explicit Java toolchains. If you prefer that, add a toolchain configuration per Gradle docs.

4. Build and test

   - From project root you can run the Gradle wrapper for an Android build (requires Android SDK and emulator/device):

     # In PowerShell

     .\\android\\gradlew.bat assembleDebug

   - Or run Flutter build commands as you normally do:

     flutter clean; flutter pub get; flutter build apk

Notes and troubleshooting

- Gradle distribution used by this project: see `android/gradle/wrapper/gradle-wrapper.properties` (currently configured to a Gradle 8.x distribution which is compatible with Java 21 in most setups).
- If you see Kotlin compilation issues, ensure Kotlin plugin and AGP versions are compatible with Java 21 (plugins in `android/settings.gradle.kts`).

If you'd like, I can:

- Add an `org.gradle.java.home` entry to `android/gradle.properties` pointing to a path you provide.
- Attempt to run a lightweight Gradle task (like `-version`) from the wrapper to confirm the environment (requires your environment to have JDK 21 installed).
- Upgrade Kotlin/AGP versions if tests show incompatibilities.

If you want me to continue, tell me whether to:

- add a `org.gradle.java.home` entry (and give the JDK 21 path), or
- attempt to run the Gradle wrapper `-version` check now.
