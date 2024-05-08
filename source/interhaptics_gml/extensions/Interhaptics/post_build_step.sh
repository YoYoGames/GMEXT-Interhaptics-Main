#!/bin/bash

sed -i -e 's/\r$//' "$(dirname "$0")/scriptUtils.sh"
chmod +x "$(dirname "$0")/scriptUtils.sh"
source "$(dirname "$0")/scriptUtils.sh"

# ######################################################################################
# Script Functions

# ----------------------------------------------------------------------------------------------------
setupmacOS() {
    # Nothing to do here
    :
}

# ----------------------------------------------------------------------------------------------------
setupLinux() {
    # Nothing to do here
    :
}

# ----------------------------------------------------------------------------------------------------
setupAndroid() {    
    # Nothing to do here
    :
}

# ----------------------------------------------------------------------------------------------------
setupiOS() {
    # Nothing to do here
    :
}

# ----------------------------------------------------------------------------------------------------
setupXbox() {
    # Nothing to do here
    :
}

# ----------------------------------------------------------------------------------------------------
setupPlaystation() {
    # Nothing to do here
    :
}

# ----------------------------------------------------------------------------------------------------
setupSwitch() {
    # Nothing to do here
    :
}

# ######################################################################################
# Script Logic

# Always init the script
scriptInit

# Version locks
optionGetValue "versionStable" RUNTIME_VERSION_STABLE
optionGetValue "versionBeta" RUNTIME_VERSION_BETA
optionGetValue "versionDev" RUNTIME_VERSION_DEV
optionGetValue "versionLTS" RUNTIME_VERSION_LTS

# SDK Version
optionGetValue "sdkVersion" SDK_VERSION

# SDK Hash
optionGetValue "winSdkHash" WIN_SDK_HASH

# SDK Paths
optionGetValue "winSdkPath" WIN_SDK_PATH

# Error String
ERROR_SDK_HASH="Invalid Interhaptics SDK version, sha256 hash mismatch (expected v$SDK_VERSION)."

# Checks IDE and Runtime versions
versionLockCheck "$YYruntimeVersion" $RUNTIME_VERSION_STABLE $RUNTIME_VERSION_BETA $RUNTIME_VERSION_DEV $RUNTIME_VERSION_LTS

# Ensure we are on the output path
pushd "$YYoutputFolder" >/dev/null

# Call setup method depending on the platform
# NOTE: the setup method can be (:setupmacOS or :setupLinux)
setup$YYPLATFORM_name

popd >/dev/null

exit 0
