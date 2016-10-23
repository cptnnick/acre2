/*
 * Author: ACRE2Team
 * SHORT DESCRIPTION
 *
 * Arguments:
 * 0: ARGUMENT ONE <TYPE>
 * 1: ARGUMENT TWO <TYPE>
 *
 * Return Value:
 * RETURN VALUE <TYPE>
 *
 * Example:
 * [ARGUMENTS] call acre_COMPONENT_fnc_FUNCTIONNAME
 *
 * Public: No
 */
#include "script_component.hpp"
#define RADIO_CTRL(var1) (_display displayCtrl var1)

params["_display"];

TRACE_1("Render",_display);

//private _channelKnobPosition = GET_STATE("channelKnobPosition");
private _mainKnobPosition = GET_STATE("mainKnobPosition");
private _functionKnobPosition = GET_STATE("functionKnobPosition");
//private _manualChannelSelection = GET_STATE("manualChannelSelection");
private _channelStepPosition = GET_STATE("channelSpacingKnobPosition");
private _volumeKnobPosition = GET_STATE("volumeKnobPosition");
private _kHzKnobPosition = GET_STATE("kHzKnobPosition");
private _MHzKnobPosition = GET_STATE("MHzKnobPosition");

private _displayButton = 0;
if (GVAR(displayButtonPressed)) then {
    _displayButton = 1;
};


// Main knob
private _mainImages = [
    QUOTE(PATHTOF(data\knobs\main\lstg_aus.paa)),
    QUOTE(PATHTOF(data\knobs\main\lstg_kl.paa)),
    QUOTE(PATHTOF(data\knobs\main\lstg_gr.paa))
];

// Function knob
private _functionImages = [
    QUOTE(PATHTOF(data\knobs\function\bs_akw_rl.paa)),
    QUOTE(PATHTOF(data\knobs\function\bs_akw.paa)),
    QUOTE(PATHTOF(data\knobs\function\bs_hw.paa)),
    QUOTE(PATHTOF(data\knobs\function\bs_rsp.paa)),
    QUOTE(PATHTOF(data\knobs\function\bs_hw_rl.paa))
];

// Channel Step knob
private _channelStepImages = [
    QUOTE(PATHTOF(data\knobs\cs\ka_25mhz_pil.paa)),
    QUOTE(PATHTOF(data\knobs\cs\ka_25mhz.paa)),
    QUOTE(PATHTOF(data\knobs\cs\ka_50mhz.paa)),
    QUOTE(PATHTOF(data\knobs\cs\ka_50mhz_pil.paa))
];

// Volume knob
private _volImages = [
    QUOTE(PATHTOF(data\knobs\volume\vol_00.paa)),
    QUOTE(PATHTOF(data\knobs\volume\vol_20.paa)),
    QUOTE(PATHTOF(data\knobs\volume\vol_40.paa)),
    QUOTE(PATHTOF(data\knobs\volume\vol_60.paa)),
    QUOTE(PATHTOF(data\knobs\volume\vol_80.paa)),
    QUOTE(PATHTOF(data\knobs\volume\vol_100.paa))
];

// kHz Knob
private _kHzKnobImages = [
    QUOTE(PATHTOF(data\knobs\khz\kHz_0.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_1.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_2.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_3.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_4.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_5.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_6.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_7.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_8.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_9.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_10.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_11.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_12.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_13.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_14.paa)),
    QUOTE(PATHTOF(data\knobs\khz\kHz_15.paa))
];

// MHz Knob
private _MHzKnobImages = [
    QUOTE(PATHTOF(data\knobs\mhz\MHz_0.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_1.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_2.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_3.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_4.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_5.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_6.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_7.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_8.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_9.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_10.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_11.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_12.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_13.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_14.paa)),
    QUOTE(PATHTOF(data\knobs\mhz\MHz_15.paa))
];

// Display Button
private _displayButtonImages = [
    QUOTE(PATHTOF(data\knobs\display\anzeige_aus.paa)),
    QUOTE(PATHTOF(data\knobs\display\anzeige_ein.paa))
];



RADIO_CTRL(106) ctrlSetText (_volImages select _volumeKnobPosition);
RADIO_CTRL(107) ctrlSetText (_mainImages select _mainKnobPosition);
RADIO_CTRL(108) ctrlSetText (_functionImages select _functionKnobPosition);
RADIO_CTRL(109) ctrlSetText (_channelStepImages select _channelStepPosition);

RADIO_CTRL(110) ctrlSetText (_kHzKnobImages select (_kHzKnobPosition%16));
RADIO_CTRL(111) ctrlSetText (_MHzKnobImages select (_MHzKnobPosition%16));

RADIO_CTRL(112) ctrlSetText (_displayButtonImages select _displayButton);


//display
if (GVAR(backlightOn) || GVAR(displayButtonPressed)) then {
    [_display] call FUNC(renderDisplay);
} else {
    [_display] call FUNC(clearDisplay);
};


//[_display] call FUNC(renderDisplay);

//TRACE_3("rendering", _volumeKnobPosition, _, acre_sys_radio_currentRadioDialog);
true