class CfgAcreComponents
{
    class ACRE_BaseRadio;

    class ACRE_SEM52SL_base : ACRE_BaseRadio {
        class Interfaces;
        isAcre = 1;
    };

    class ACRE_SEM52SL : ACRE_SEM52SL_base {
        name = "SEM 52 SL";
        sinadRating = -117;
        sensitivityMin = -117;
        sensitivityMax = -50;
        isPackRadio = 0;
        isDeployable = 0;

        connectors[] =     {
                            {"Antenna", ACRE_CONNECTOR_BNC},
                            {"Audio/Data", ACRE_CONNECTOR_U_283}
                        };
        defaultComponents[] = {
                                {0, "ACRE_120CM_VHF_BNC"} /*TODO Not use this */
                            };

        class InterfaceClasses {
            CfgAcreDataInterface = "DefaultRadioInterface";
            CfgAcreInteractInterface = "DefaultRadioInterface";
            CfgAcreTransmissionInterface = "DefaultRadioInterface";
            CfgAcrePhysicalInterface = "DefaultRadioInterface";
        };

        class Interfaces: Interfaces {
            class CfgAcreDataInterface {
                getListInfo                    =    QUOTE(DFUNC(getListInfo));

                setVolume                    =    QUOTE(DFUNC(setVolume));                // [0-1]
                getVolume                    =     QUOTE(DFUNC(getVolume));                // [] = 0-1

                setSpatial                    =    QUOTE(DFUNC(setSpatial));
                getSpatial                    =    QUOTE(DFUNC(getSpatial));

                setChannelData                 =    QUOTE(DFUNC(setChannelData));            // [channelNumber, [channelData] ]
                getChannelData                =    QUOTE(DFUNC(getChannelData));            // [channelNumber] = channelData
                getCurrentChannelData        =    QUOTE(DFUNC(getCurrentChannelData));        // channelData (of current channel)


                getCurrentChannel            =    QUOTE(DFUNC(getCurrentChannel));        // [] = channelNumber
                setCurrentChannel            =    QUOTE(DFUNC(setCurrentChannel));        // [channelNumber]

                getStates                    =    QUOTE(DFUNC(getStates));                // [] = [ [stateName, stateData], [stateName, stateData] ]
                getState                    =    QUOTE(DFUNC(getState));                // [stateName] = stateData
                setState                    =     QUOTE(DFUNC(setState));                // [stateName, stateData] = sets state

                getOnOffState                =     QUOTE(DFUNC(getOnOffState));            // [] = 0/1
                setOnOffState                =     QUOTE(DFUNC(setOnOffState));            // [ZeroOrOne]

                initializeComponent            =     QUOTE(DFUNC(initializeRadio));

                getChannelDescription        =     QUOTE(DFUNC(getChannelDescription));

                isExternalAudio                =    QUOTE(DFUNC(isExternalAudio));
            };

            class CfgAcrePhysicalInterface {
                getExternalAudioPosition    =     QUOTE(DFUNC(getExternalAudioPosition));
            };

            class CfgAcreTransmissionInterface {
                handleBeginTransmission        =     QUOTE(DFUNC(handleBeginTransmission));
                handleEndTransmission        =    QUOTE(DFUNC(handleEndTransmission));

                handleSignalData            =    QUOTE(DFUNC(handleSignalData));
                handleMultipleTransmissions =    QUOTE(DFUNC(handleMultipleTransmissions));

                handlePTTDown                =    QUOTE(DFUNC(handlePTTDown));
                handlePTTUp                    =     QUOTE(DFUNC(handlePTTUp));
            };

            class CfgAcreInteractInterface {
                openGui                        =     QUOTE(DFUNC(openGui));                // [RadioId]
                closeGui                    =    QUOTE(DFUNC(closeGui));                // []
            };
        };
    };
};
