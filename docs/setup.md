@title Setting Up

# Setup

This guide shows how to set up the Interhaptics extension for Gamemaker.

## Downloading the SDK

[[Note: Before you can access the GitHub repository with the SDK releases you'll be asked to provide some required information.]]

1. Go to https://www.interhaptics.com/download/ to download the **Game Engine SDK**.
2. On the Download page, under the **Game Engine SDK** option, click **GitHub**.
3. Enter the required information, then click **Download on GitHub**.
4. On the GitHub page that opens next, click the latest release link under Releases.
5. On the next page, under `Assets`, download the `Source code (zip)` package.
6. Extract the zip contents to `GMEXT-Interhaptics/source/interhaptics_sdk`.

After extracting the SDK contents to the folder, the folder's contents should look as follows: 

![Windows SDK location on disk](assets/sdk_location_explorer.png)

## Setting Up GameMaker

Download the [latest release](https://www.github.com/YoYoGames/GMEXT-Interhaptics-Main/releases/latest) of the extension.

In GameMaker, open an existing project or create a new one. Next add the extension to the project and configure paths in the [Extension Options](https://manual.gamemaker.io/monthly/en/The_Asset_Editors/Extensions.htm#extension_options):

![Extension Options](assets/extension_options.png)

The Windows SDK should be set to the correct relative folder path: `../interhaptics_sdk/interhaptics_windows`.

If you have access to the DualSense provider, you can set the path under **DualSense Provider**. This pust must be set to the directory that contains the DLL files.

If you are developing for PS5, the **PS5 Interhaptics SDK** should be set to the path where you installed the SDK. The **PS5 Interhaptics VS** should be set to the directory that contains the Visual Studio solution (`*.sln`) file.