@title Basic Use

# Basic Use

This page covers the basic use of the Interhaptics extension.

## Initialisation

The first thing to do is initialising the extension using ${func.interhaptics_init}.

After that, you should check for the presence of a "provider", which is an attached device (e.g. a controller) that is capable of providing haptics feedback. To initialise the provider, call ${func.interhaptics_provider_init}. To check if a provider is present, call ${func.interhaptics_provider_is_present}.

```gml
/// Create Event
interhaptics_init();
interhaptics_provider_init();
```

## Loading .haps Files

Haptics effects are stored in `.haps` files, which use a custom file format used by Interhaptics.

You can add a haptics effect stored in a `.haps` file using ${func.interhaptics_add_hm}: 

```gml
var _file = file_text_open_read("HapticMaterials/Body Hit.haps")
var _content = file_text_read_string(_file);
file_text_close(_file);

hm_index = interhaptics_add_hm(_content);
```

You can then add one or more targets for this haptics effect: 

```gml
var _commanddata =
{
    sign: Interhaptics_Operator.Plus,
    group: Interhaptics_GroupID.Palm,
    side: Interhaptics_LateralFlag.Global
};

interhaptics_add_target_to_event(hm_index, [_commanddata]);
```

## Updating Interhaptics

To update Interhaptics, you should first compute all haptics events, then *render* the haptics every step: 

```gml
/// Step Event
var _time = current_time / 1000;

interhaptics_compute_all_events(_time);
interhaptics_provider_render_haptics();
```

## Playing A Haptic Effect

Use ${func.interhaptics_play_event} to play a haptic effect:

```gml
interhaptics_play_event(hm_index, -time, 0, 0);
```

## Cleaning Up

```gml
/// Clean Up Event
interhaptics_provider_provider_clean();
interhaptics_quit();
```
