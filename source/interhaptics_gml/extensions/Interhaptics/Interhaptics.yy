{
  "$GMExtension":"",
  "%Name":"Interhaptics",
  "androidactivityinject":"",
  "androidclassname":"",
  "androidcodeinjection":"",
  "androidinject":"",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":false,
  "androidsourcedir":"",
  "author":"",
  "classname":"",
  "copyToTargets":576460752303423552,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"0.0.1",
  "files":[
    {"$GMExtensionFile":"","%Name":"","constants":[
        {"$GMExtensionConstant":"","%Name":"PreGraphicsInitialisationArgument","hidden":false,"name":"PreGraphicsInitialisationArgument","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"YYArgumentFromMacros",},
      ],"copyToTargets":576460752303423552,"filename":"Interhaptics.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"interhaptics_init","argCount":0,"args":[],"documentation":"","externalName":"interhaptics_init","help":"interhaptics_init()","hidden":false,"kind":1,"name":"interhaptics_init","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_quit","argCount":0,"args":[],"documentation":"","externalName":"interhaptics_quit","help":"interhaptics_quit()","hidden":false,"kind":1,"name":"interhaptics_quit","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_add_hm","argCount":0,"args":[1,],"documentation":"","externalName":"interhaptics_add_hm","help":"interhaptics_add_hm(content)","hidden":false,"kind":1,"name":"interhaptics_add_hm","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_update_hm","argCount":0,"args":[2,1,],"documentation":"","externalName":"interhaptics_update_hm","help":"interhaptics_update_hm(material_ref, content)","hidden":false,"kind":1,"name":"interhaptics_update_hm","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_play_event","argCount":0,"args":[2,2,2,2,],"documentation":"","externalName":"interhaptics_play_event","help":"interhaptics_play_event(material_ref, vibration_offset, texture_offset, stiffness_offset)","hidden":false,"kind":1,"name":"interhaptics_play_event","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_stop_event","argCount":0,"args":[2,],"documentation":"","externalName":"interhaptics_stop_event","help":"interhaptics_stop_event(material_ref)","hidden":false,"kind":1,"name":"interhaptics_stop_event","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_add_target_to_event_multiplatform","argCount":0,"args":[2,1,],"documentation":"","externalName":"interhaptics_add_target_to_event_multiplatform","help":"interhaptics_add_target_to_event_multiplatform(material_ref, buff_args)","hidden":false,"kind":1,"name":"interhaptics_add_target_to_event_multiplatform","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_remove_target_from_event_multiplatform","argCount":0,"args":[2,1,],"documentation":"","externalName":"interhaptics_remove_target_from_event_multiplatform","help":"interhaptics_remove_target_from_event_multiplatform(material_ref, buff_args)","hidden":false,"kind":1,"name":"interhaptics_remove_target_from_event_multiplatform","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_remove_all_targets_from_event","argCount":0,"args":[2,],"documentation":"","externalName":"interhaptics_remove_all_targets_from_event","help":"interhaptics_remove_all_targets_from_event(material_ref)","hidden":false,"kind":1,"name":"interhaptics_remove_all_targets_from_event","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_compute_all_events","argCount":0,"args":[2,],"documentation":"","externalName":"interhaptics_compute_all_events","help":"interhaptics_compute_all_events(current_time)","hidden":false,"kind":1,"name":"interhaptics_compute_all_events","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_update_event_positions_multiplatform","argCount":0,"args":[2,1,2,2,],"documentation":"","externalName":"interhaptics_update_event_positions_multiplatform","help":"interhaptics_update_event_positions_multiplatform(material_ref, buff_args, texture_position, stiffness_position)","hidden":false,"kind":1,"name":"interhaptics_update_event_positions_multiplatform","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_set_event_offsets","argCount":0,"args":[2,2,2,2,],"documentation":"","externalName":"interhaptics_set_event_offsets","help":"interhaptics_set_event_offsets(material_ref, vibration_offset, texture_offset, stiffness_offet)","hidden":false,"kind":1,"name":"interhaptics_set_event_offsets","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_clear_inactive_events","argCount":0,"args":[],"documentation":"","externalName":"interhaptics_clear_inactive_events","help":"interhaptics_clear_inactive_events()","hidden":false,"kind":1,"name":"interhaptics_clear_inactive_events","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_clear_active_events","argCount":0,"args":[],"documentation":"","externalName":"interhaptics_clear_active_events","help":"interhaptics_clear_active_events()","hidden":false,"kind":1,"name":"interhaptics_clear_active_events","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_clear_event","argCount":0,"args":[2,],"documentation":"","externalName":"interhaptics_clear_event","help":"interhaptics_clear_event(material_ref)","hidden":false,"kind":1,"name":"interhaptics_clear_event","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_set_global_intensity","argCount":0,"args":[2,],"documentation":"","externalName":"interhaptics_set_global_intensity","help":"interhaptics_set_global_intensity(intensity)","hidden":false,"kind":1,"name":"interhaptics_set_global_intensity","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_get_global_intensity","argCount":0,"args":[],"documentation":"","externalName":"interhaptics_get_global_intensity","help":"interhaptics_get_global_intensity()","hidden":false,"kind":1,"name":"interhaptics_get_global_intensity","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_add_parametric_effect_multiplatform","argCount":0,"args":[1,],"documentation":"","externalName":"interhaptics_add_parametric_effect_multiplatform","help":"interhaptics_add_parametric_effect_multiplatform(buff_args)","hidden":false,"kind":1,"name":"interhaptics_add_parametric_effect_multiplatform","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_delete_hm","argCount":0,"args":[2,],"documentation":"","externalName":"interhaptics_delete_hm","help":"interhaptics_delete_hm(material_ref)","hidden":false,"kind":1,"name":"interhaptics_delete_hm","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_transients_played_on_those_body_parts_multiplatform","argCount":0,"args":[2,1,],"documentation":"","externalName":"interhaptics_transients_played_on_those_body_parts_multiplatform","help":"interhaptics_transients_played_on_those_body_parts_multiplatform(perception,buff_args)","hidden":false,"kind":1,"name":"interhaptics_transients_played_on_those_body_parts_multiplatform","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_stop_all_events","argCount":0,"args":[],"documentation":"","externalName":"interhaptics_stop_all_events","help":"interhaptics_stop_all_events()","hidden":false,"kind":1,"name":"interhaptics_stop_all_events","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_set_event_intensity","argCount":0,"args":[2,2,],"documentation":"","externalName":"interhaptics_set_event_intensity","help":"interhaptics_set_event_intensity(material_ref,intensity)","hidden":false,"kind":1,"name":"interhaptics_set_event_intensity","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_set_event_loop","argCount":0,"args":[2,2,],"documentation":"","externalName":"interhaptics_set_event_loop","help":"interhaptics_set_event_loop(material_ref,number_of_loop)","hidden":false,"kind":1,"name":"interhaptics_set_event_loop","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_set_target_intensity_multiplatform","argCount":0,"args":[2,1,2,],"documentation":"","externalName":"interhaptics_set_target_intensity_multiplatform","help":"interhaptics_set_target_intensity_multiplatform(material_ref, buff_args, intensity)","hidden":false,"kind":1,"name":"interhaptics_set_target_intensity_multiplatform","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_providers_init","argCount":0,"args":[],"documentation":"","externalName":"interhaptics_providers_init","help":"interhaptics_providers_init()","hidden":false,"kind":1,"name":"interhaptics_providers_init","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_providers_available","argCount":0,"args":[],"documentation":"","externalName":"interhaptics_providers_available","help":"interhaptics_providers_available()","hidden":false,"kind":1,"name":"interhaptics_providers_available","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_providers_clean","argCount":0,"args":[],"documentation":"","externalName":"interhaptics_providers_clean","help":"interhaptics_providers_clean()","hidden":false,"kind":1,"name":"interhaptics_providers_clean","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"interhaptics_providers_render_haptics","argCount":0,"args":[],"documentation":"","externalName":"interhaptics_providers_render_haptics","help":"interhaptics_providers_render_haptics()","hidden":false,"kind":1,"name":"interhaptics_providers_render_haptics","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
      ],"init":"","kind":1,"name":"","order":[],"origname":"","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"Interhaptics_ps5.prx","name":"Interhaptics_ps5.prx","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":59,},
        {"$GMProxyFile":"","%Name":"Interhaptics_x64.dll","name":"Interhaptics_x64.dll","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":6,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
    {"$GMExtensionFile":"","%Name":"","constants":[],"copyToTargets":576460752303423488,"filename":"libHAR.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"__libHAR_load__","argCount":0,"args":[],"documentation":"","externalName":"","help":"","hidden":false,"kind":4,"name":"__libHAR_load__","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
      ],"init":"__libHAR_load__","kind":4,"name":"","order":[],"origname":"","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"libHAR.prx","name":"libHAR.prx","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":59,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"",
  "html5Props":false,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"",
  "ioscodeinjection":"",
  "iosdelegatename":"",
  "iosplistinject":"",
  "iosProps":false,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"",
  "maclinkerflags":"",
  "macsourcedir":"",
  "name":"Interhaptics",
  "options":[
    {"$GMExtensionOption":"","%Name":"__extOptLabel","defaultValue":"DESKTOP:","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"bac06dd1-e9bb-479e-bf0f-4879cd54af56","hidden":false,"listItems":[],"name":"__extOptLabel","optType":5,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"winSdkPath","defaultValue":"../interhaptics_sdk/interhaptics_windows","description":"This is the path to the folder containing the \"bin\" subfolder.","displayName":"Windows SDK","exportToINI":false,"extensionId":null,"guid":"71dddcac-f2d4-4cd4-be85-5c8cc8221e91","hidden":false,"listItems":[],"name":"winSdkPath","optType":4,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"__extOptLabel2","defaultValue":"CONSOLES:","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"7832861e-dc33-4cf5-a33d-08fc540355d2","hidden":false,"listItems":[],"name":"__extOptLabel2","optType":5,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"ps5SdkPath","defaultValue":"../../../GMEXT-Interhaptics-PS5/source/interhaptics_sdk","description":"This is the path to the folder containing the \"bin\" subfolder.","displayName":"PS5 Interhaptics SDK","exportToINI":false,"extensionId":null,"guid":"73ae4b80-1d4c-4a84-a7a2-07ec702cc7a4","hidden":false,"listItems":[],"name":"ps5SdkPath","optType":4,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"ps5VsPath","defaultValue":"../../../GMEXT-Interhaptics-PS5/source/interhaptics_vs/Interhaptics.sln","description":"This is the path to the VS solution project.","displayName":"PS5 Interhaptics VS","exportToINI":false,"extensionId":null,"guid":"ab547edf-34e6-42c5-824f-a0c9977f82a7","hidden":false,"listItems":[],"name":"ps5VsPath","optType":3,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"__extOptLabel1","defaultValue":"EXTRA OPTIONS:","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"64e06571-72d5-467d-8cfe-30da3fa5dc32","hidden":false,"listItems":[],"name":"__extOptLabel1","optType":5,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"logLevel","defaultValue":"1","description":"The log level to be used by the script file.\r\n0: Show only errors\r\n1: Show errors and warnings (recommended)\r\n2: Show everything (use before submitting a bug)","displayName":"Log Level","exportToINI":false,"extensionId":null,"guid":"03fda6aa-2c21-4871-bc07-3c48eb68c6bf","hidden":false,"listItems":[
        "0",
        "1",
        "2",
      ],"name":"logLevel","optType":6,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"versionStable","defaultValue":"2023.11.0.0","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"40bc3675-5311-49b3-93b5-eb932b9ebcf6","hidden":true,"listItems":[],"name":"versionStable","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"versionBeta","defaultValue":"2023.1100.0.0","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"51c6d87d-ba9e-4b47-8fcb-ce97565c8101","hidden":true,"listItems":[],"name":"versionBeta","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"versionDev","defaultValue":"9.9.1.611","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"8afa22ca-7d71-480a-910b-b1d6d2d44f5e","hidden":true,"listItems":[],"name":"versionDev","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"versionLTS","defaultValue":"2022.0.2.0","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"a9be5433-32e7-4a90-8b0c-7ee62e16b546","hidden":true,"listItems":[],"name":"versionLTS","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
  ],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Interhaptics",
    "path":"folders/Interhaptics.yy",
  },
  "productId":"",
  "resourceType":"GMExtension",
  "resourceVersion":"2.0",
  "sourcedir":"",
  "supportedTargets":-1,
  "tvosclassname":null,
  "tvosCocoaPodDependencies":"",
  "tvosCocoaPods":"",
  "tvoscodeinjection":"",
  "tvosdelegatename":null,
  "tvosmaccompilerflags":"",
  "tvosmaclinkerflags":"",
  "tvosplistinject":"",
  "tvosProps":false,
  "tvosSystemFrameworkEntries":[],
  "tvosThirdPartyFrameworkEntries":[],
}