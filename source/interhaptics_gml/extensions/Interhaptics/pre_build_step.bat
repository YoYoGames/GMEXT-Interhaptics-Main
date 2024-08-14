@echo off
set Utils="%~dp0scriptUtils.bat"
set "ExtensionPath=%~dp0"

:: ######################################################################################
:: Script Logic

:: Always init the script
call %Utils% scriptInit

:: Version locks
call %Utils% optionGetValue "versionStable" RUNTIME_VERSION_STABLE
call %Utils% optionGetValue "versionBeta" RUNTIME_VERSION_BETA
call %Utils% optionGetValue "versionDev" RUNTIME_VERSION_DEV
call %Utils% optionGetValue "versionLTS" RUNTIME_VERSION_LTS

:: SDK Version
call %Utils% optionGetValue "sdkVersion" SDK_VERSION

:: SDK Hash
call %Utils% optionGetValue "iosSdkHash" IOS_SDK_HASH

:: SDK Paths
call %Utils% optionGetValue "iosSdkPath" IOS_SDK_PATH
call %Utils% optionGetValue "gdkSdkPath" GDK_SDK_PATH
call %Utils% optionGetValue "ps4SdkPath" PS4_SDK_PATH
call %Utils% optionGetValue "ps5SdkPath" PS5_SDK_PATH
call %Utils% optionGetValue "switchSdkPath" SWITCH_SDK_PATH

:: VS Paths
call %Utils% optionGetValue "gdkVsPath" GDK_VS_PATH
call %Utils% optionGetValue "ps4VsPath" PS4_VS_PATH
call %Utils% optionGetValue "ps5VsPath" PS5_VS_PATH
call %Utils% optionGetValue "switchVsPath" SWITCH_VS_PATH

:: Error String
set "ERROR_SDK_HASH=Invalid FMOD SDK version, sha256 hash mismatch (expected v%SDK_VERSION%)."

:: Checks IDE and Runtime versions
call %Utils% versionLockCheck "%YYruntimeVersion%" %RUNTIME_VERSION_STABLE% %RUNTIME_VERSION_BETA% %RUNTIME_VERSION_DEV% %RUNTIME_VERSION_LTS%

:: Ensure we are on the output path
pushd "%YYoutputFolder%"

:: Call setup method depending on the platform
:: NOTE: the setup method can be (:setupWindows, :setupMacOS, :setupLinux, :setupAndroid, :setupiOS, :setupXbox, :setupPlaystation, :setupSwitch)
call :setup%YYPLATFORM_name%

popd

exit 0

:: ----------------------------------------------------------------------------------------------------
:setupWindows
    :: Nothing to do here
exit /b 0

:: ----------------------------------------------------------------------------------------------------
:setupMacOS
    :: Nothing to do here
exit /b 0

:: ----------------------------------------------------------------------------------------------------
:setupLinux
    :: Nothing to do here
exit /b 0

:: ----------------------------------------------------------------------------------------------------
:setupAndroid
    :: Nothing to do here
exit /b 0

:: ----------------------------------------------------------------------------------------------------
:setupiOS
    :: Nothing to do here
exit /b 0

:: ----------------------------------------------------------------------------------------------------
:setupXbox
    :: Nothing to do here
exit /b 0

:: ----------------------------------------------------------------------------------------------------
:setupPlaystation
    :: Set building defaults
    set "CONFIGURATION=Release-AutoBuild"
    set "PLATFORM="
    set "LIBRARY_NAME="
    set "PS_SDK_PATH="
    set "PS_VS_PATH="

    :: Check correct version PS4 or PS5
    if "%YYPLATFORM_name%"=="PlayStation 5" (
        set "PLATFORM=Prospero"
        set "LIBRARY_NAME=Interhaptics_ps5.prx"
        set "PS_SDK_PATH=%PS5_SDK_PATH%"
        set "PS_VS_PATH=%PS5_VS_PATH%"
    ) else (
        exit /b 0
    )

    :: Resolve the Fmod SDK path (must exist)
    call %Utils% pathResolveExisting "%YYprojectDir%" "%PS_SDK_PATH%" PS_SDK_PATH

    :: Resolve the Solution path (must exist)
    call %Utils% pathResolveExisting "%YYprojectDir%" "%PS_VS_PATH%" PS_VS_PATH

    :: Call VsDevCmd.bat and build libraries
    call "%YYPREF_visual_studio_path%"
    msbuild "%PS_VS_PATH%" /p:Configuration="%CONFIGURATION%" /p:Platform="%PLATFORM%" /p:ExtPath="%ExtensionPath:~0,-1%" /p:ExtSdkPath="%PS_SDK_PATH%"

    :: Extract the directory part from the full path 
    call %Utils% pathExtractDirectory "%PS_VS_PATH%" PS_VS_DIR 
 
    :: Copy libs to GML project 
    call %Utils% itemCopyTo "%PS_VS_DIR%%PLATFORM%\%CONFIGURATION%\%LIBRARY_NAME%" "%ExtensionPath%\%LIBRARY_NAME%"
exit /b 0

:: ----------------------------------------------------------------------------------------------------
:setupSwitch
    :: Nothing to do here
exit /b 0