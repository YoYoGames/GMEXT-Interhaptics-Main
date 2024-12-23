@echo off
set Utils="%~dp0scriptUtils.bat"
set ExtensionPath="%~dp0"

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
call %Utils% optionGetValue "winSdkHash" WIN_SDK_HASH
call %Utils% optionGetValue "macosSdkHash" MACOS_SDK_HASH
call %Utils% optionGetValue "linuxSdkHash" LINUX_SDK_HASH
call %Utils% optionGetValue "iosSdkHash" IOS_SDK_HASH
call %Utils% optionGetValue "androidSdkHash" ANDROID_SDK_HASH
call %Utils% optionGetValue "xboxOneSdkHash" XBOX_ONE_SDK_HASH
call %Utils% optionGetValue "xboxSeriesSdkHash" XBOX_SERIES_SDK_HASH
call %Utils% optionGetValue "ps4SdkHash" PS4_SDK_HASH
call %Utils% optionGetValue "ps5SdkHash" PS5_SDK_HASH
call %Utils% optionGetValue "switchSdkHash" SWITCH_SDK_HASH

:: SDK Paths
call %Utils% optionGetValue "winSdkPath" WIN_SDK_PATH
call %Utils% optionGetValue "macosSdkPath" MACOS_SDK_PATH
call %Utils% optionGetValue "linuxSdkPath" LINUX_SDK_PATH
call %Utils% optionGetValue "iosSdkPath" IOS_SDK_PATH
call %Utils% optionGetValue "androidSdkPath" ANDROID_SDK_PATH
call %Utils% optionGetValue "gdkSdkPath" GDK_SDK_PATH
call %Utils% optionGetValue "ps4SdkPath" PS4_SDK_PATH
call %Utils% optionGetValue "ps5SdkPath" PS5_SDK_PATH
call %Utils% optionGetValue "switchSdkPath" SWITCH_SDK_PATH

:: Error String
set "ERROR_SDK_HASH=Invalid FMOD SDK version, sha256 hash mismatch (expected v%SDK_VERSION%)."

:: Checks IDE and Runtime versions (NOT NECESSARY SHOULD BE DONE IN 'pre_build_step')
:: call %Utils% versionLockCheck "%YYruntimeVersion%" %RUNTIME_VERSION_STABLE% %RUNTIME_VERSION_BETA% %RUNTIME_VERSION_DEV% %RUNTIME_VERSION_LTS%

:: Ensure we are on the output path
pushd "%YYoutputFolder%"

:: Call setup method depending on the platform
:: NOTE: the setup method can be (:setupWindows, :setupMacOS, :setupLinux, :setupAndroid, :setupiOS, :setupXbox, :setupPlaystation, :setupSwitch)
call :setup%YYPLATFORM_name%

popd

exit 0

:: ----------------------------------------------------------------------------------------------------
:setupWindows
    :: Resolve the SDK path (must exist)
    call %Utils% pathResolveExisting "%YYprojectDir%" "%WIN_SDK_PATH%" SDK_PATH

    :: Get library file paths
    set SDK_ENGINE="%SDK_PATH%\bin\HapticEngine\x64\HAR.dll"
    set SDK_GAMEINPUT_PROVIDER="%SDK_PATH%\bin\HapticProviders\GameInput\Interhaptics.GameInputProvider.dll"
    set SDK_SENSA_PROVIDER="%SDK_PATH%\bin\HapticProviders\Sensa\x64\Interhaptics.RazerProvider.dll"
    
    :: Asset hash match
    :: call %Utils% assertFileHashEquals %SDK_CORE_SOURCE% %WIN_SDK_HASH% "%ERROR_SDK_HASH%"

    echo "Copying Windows (64 bit) dependencies"

    :: Base
    if not exist "HAR.dll" call %Utils% itemCopyTo %SDK_ENGINE% "HAR.dll"
    if not exist "Interhaptics.GameInputProvider.dll" call %Utils% itemCopyTo %SDK_GAMEINPUT_PROVIDER% "Interhaptics.GameInputProvider.dll"
    if not exist "Interhaptics.RazerProvider.dll" call %Utils% itemCopyTo %SDK_SENSA_PROVIDER% "Interhaptics.RazerProvider.dll"

    setlocal enabledelayedexpansion

    :: Dual Sense
    call %Utils% optionGetValue "winProviderDualSensePath" WIN_PROVIDER_PATH
    if not "%WIN_PROVIDER_PATH%" == "" (
        call %Utils% pathResolveExisting "%YYprojectDir%" "%WIN_PROVIDER_PATH%" WIN_PROVIDER_PATH
        if not exist "Interhaptics.DualSensePCProvider.dll" call %Utils% itemCopyTo "!WIN_PROVIDER_PATH!\Interhaptics.DualSensePCProvider.dll" "Interhaptics.DualSensePCProvider.dll"
        if not exist "libScePad.dll" call %Utils% itemCopyTo "!WIN_PROVIDER_PATH!\libScePad.dll" "libScePad.dll"
        if not exist "portaudio_x64.dll" call %Utils% itemCopyTo "!WIN_PROVIDER_PATH!\portaudio_x64.dll" "portaudio_x64.dll"
    )

    endlocal

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
    :: Check correct version PS4 or PS5
    if "%YYPLATFORM_name%"=="PlayStation 4" (
        exit /b 0
    ) else (
        set PS_SDK_PATH=%PS5_SDK_PATH%
        set PS_SDK_HASH=%PS5_SDK_HASH%
    )

    :: Resolve the SDK path (must exist)
    call %Utils% pathResolveExisting "%YYprojectDir%" "%PS_SDK_PATH%" SDK_PATH

    :: Get library file paths
    set SDK_ENGINE="%SDK_PATH%\bin\SDK7\HapticEngine\Prospero\libHAR.prx"
    set SDK_DUALSENSE_PROVIDER="%SDK_PATH%\bin\SDK7\HapticProviders\DualSense\libProvider_DualSensePS5.prx"

    :: Asset hash match
    :: call %Utils% assertFileHashEquals %SDK_CORE_SOURCE% %PS_SDK_HASH% "%ERROR_SDK_HASH%"

    echo "Copying %YYPLATFORM_name% dependencies"
    call %Utils% itemCopyTo %SDK_ENGINE% "libHAR.prx"
    call %Utils% itemCopyTo %SDK_DUALSENSE_PROVIDER% "libProvider_DualSensePS5.prx"
exit /b 0

:: ----------------------------------------------------------------------------------------------------
:setupSwitch
    :: Nothing to do here
exit /b 0