#!/bin/bash
set -e

echo "📲 Setting up Android SDK..."
mkdir -p $ANDROID_HOME/cmdline-tools
cd $ANDROID_HOME
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip commandlinetools-linux-*.zip -d cmdline-tools
rm commandlinetools-linux-*.zip
mv cmdline-tools/cmdline-tools cmdline-tools/latest

# Accept licenses
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses

# Install required SDK components
$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"
