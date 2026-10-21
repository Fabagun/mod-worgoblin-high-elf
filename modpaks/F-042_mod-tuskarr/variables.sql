-- Race ID
SET @Tuskarr                              := @NextRace := @NextRace +1;
SET @TuskarrMask                          = 1 << (@Tuskarr - 1);
SET @TuskarrHelmetMask                    = 1 << @Tuskarr;

-- Important variable updates (Alliance vs. Horde)
SET @AllianceMask                         = @AllianceMask    | @TuskarrMask;
SET @BarrensBros                          = @HordeMask    & ~@UndercityMask; -- important if Horde
SET @PlayableRaceMask                     = @PlayableRaceMask | @TuskarrMask;
SET @BowHunters                           = @BowHunters      | @TuskarrMask;
SET @TuskarrLanguage                      = 7; -- 7 for Alliance, 1 for Horde (ChrRaces.dbc)
SET @TuskarrAlliance                      = 0; -- 0 for Alliance, 1 for Horde (ChrRaces.dbc)
SET @TuskarrKnowThyEnemy                  = @KnowThyEnemyAlliance;

-- Miscellaneous
SET @TuskarrHome                          = @Dwarf; -- classes, start outfits, start position, action bars and stats are copied from this race
SET @TuskarrExplorationSound              = @DwarfExplorationSound;
SET @TuskarrCinematicSequence             = @DwarfCinematicSequence;
SET @TuskarrBlood                         = 1;
SET @TuskarrMaleModelPath                 = 'custom\\tuskarr\\native\\male\\tuskarrmale.mdx';
SET @TuskarrMaleFootprint                 = @FootprintShoe;
SET @TuskarrFemaleFootprint               = @FootprintShoe;
SET @TuskarrRacials                       = @TuskarrRacials;
SET @TuskarrFaction                       = 1199; -- vacant slot
SET @TuskarrPlayer                        = 1200; -- vacant slot

-- Strings
SET @TuskarrClientPrefix                  = 'Dw'; -- Dwarf prefix, so Dwarf helmet models are used
SET @TuskarrClientString                  = 'Tuskarr';
SET @TuskarrFacialHairCustomization1      = 'NORMAL';
SET @TuskarrFacialHairCustomization2      = 'NORMAL';
SET @TuskarrHairCustomization             = 'NORMAL';

-- Localization Strings
SET @TuskarrenUS                          = 'Tuskarr';
SET @TuskarrkoKR                          = '';
SET @TuskarrfrFR                          = '';
SET @TuskarrdeDE                          = '';
SET @TuskarrzhCN                          = '';
SET @TuskarrzhTW                          = '';
SET @TuskarresES                          = '';
SET @TuskarresMX                          = '';
SET @TuskarrruRU                          = '';
SET @TuskarrjaJP                          = '';
SET @TuskarrptPT                          = '';
SET @TuskarritIT                          = '';
SET @TuskarrUnk1                          = '';
SET @TuskarrUnk2                          = '';
SET @TuskarrUnk3                          = '';
SET @TuskarrUnk4                          = '';

SET @TuskarrFemaleenUS                    = '';
SET @TuskarrFemalekoKR                    = '';
SET @TuskarrFemalefrFR                    = '';
SET @TuskarrFemaledeDE                    = '';
SET @TuskarrFemalezhCN                    = '';
SET @TuskarrFemalezhTW                    = '';
SET @TuskarrFemaleesES                    = '';
SET @TuskarrFemaleesMX                    = '';
SET @TuskarrFemaleruRU                    = '';
SET @TuskarrFemalejaJP                    = '';
SET @TuskarrFemaleptPT                    = '';
SET @TuskarrFemaleitIT                    = '';
SET @TuskarrFemaleUnk1                    = '';
SET @TuskarrFemaleUnk2                    = '';
SET @TuskarrFemaleUnk3                    = '';
SET @TuskarrFemaleUnk4                    = '';

SET @TuskarrMaleenUS                      = '';
SET @TuskarrMalekoKR                      = '';
SET @TuskarrMalefrFR                      = '';
SET @TuskarrMaledeDE                      = '';
SET @TuskarrMalezhCN                      = '';
SET @TuskarrMalezhTW                      = '';
SET @TuskarrMaleesES                      = '';
SET @TuskarrMaleesMX                      = '';
SET @TuskarrMaleruRU                      = '';
SET @TuskarrMalejaJP                      = '';
SET @TuskarrMaleptPT                      = '';
SET @TuskarrMaleitIT                      = '';
SET @TuskarrMaleUnk1                      = '';
SET @TuskarrMaleUnk2                      = '';
SET @TuskarrMaleUnk3                      = '';
SET @TuskarrMaleUnk4                      = '';

SET @TuskarrRacialNameenUS                = 'Racial - Tuskarr';
SET @TuskarrRacialNamekoKR                = '';
SET @TuskarrRacialNamefrFR                = '';
SET @TuskarrRacialNamedeDE                = '';
SET @TuskarrRacialNamezhCN                = '';
SET @TuskarrRacialNamezhTW                = '';
SET @TuskarrRacialNameesES                = '';
SET @TuskarrRacialNameesMX                = '';
SET @TuskarrRacialNameruRU                = '';
SET @TuskarrRacialNamejaJP                = '';
SET @TuskarrRacialNameptPT                = '';
SET @TuskarrRacialNameitIT                = '';
SET @TuskarrRacialNameUnk1                = '';
SET @TuskarrRacialNameUnk2                = '';
SET @TuskarrRacialNameUnk3                = '';
SET @TuskarrRacialNameUnk4                = '';

SET @TuskarrPlayerenUS                    = '"PLAYER", " Tuskarr"';
SET @TuskarrPlayerkoKR                    = '';
SET @TuskarrPlayerfrFR                    = '';
SET @TuskarrPlayerdeDE                    = '';
SET @TuskarrPlayerzhCN                    = '';
SET @TuskarrPlayerzhTW                    = '';
SET @TuskarrPlayeresES                    = '';
SET @TuskarrPlayeresMX                    = '';
SET @TuskarrPlayerruRU                    = '';
SET @TuskarrPlayerjaJP                    = '';
SET @TuskarrPlayerptPT                    = '';
SET @TuskarrPlayeritIT                    = '';
SET @TuskarrPlayerUnk1                    = '';
SET @TuskarrPlayerUnk2                    = '';
SET @TuskarrPlayerUnk3                    = '';
SET @TuskarrPlayerUnk4                    = '';

SET @TuskarrFactionNameenUS               = 'Tuskarr';
SET @TuskarrFactionNamekoKR               = '';
SET @TuskarrFactionNamefrFR               = '';
SET @TuskarrFactionNamedeDE               = '';
SET @TuskarrFactionNamezhCN               = '';
SET @TuskarrFactionNamezhTW               = '';
SET @TuskarrFactionNameesES               = '';
SET @TuskarrFactionNameesMX               = '';
SET @TuskarrFactionNameruRU               = '';
SET @TuskarrFactionNamejaJP               = '';
SET @TuskarrFactionNameptPT               = '';
SET @TuskarrFactionNameitIT               = '';
SET @TuskarrFactionNameUnk1               = '';
SET @TuskarrFactionNameUnk2               = '';
SET @TuskarrFactionNameUnk3               = '';
SET @TuskarrFactionNameUnk4               = '';

SET @TuskarrFactionDescriptionenUS        = '';
SET @TuskarrFactionDescriptionkoKR        = '';
SET @TuskarrFactionDescriptionfrFR        = '';
SET @TuskarrFactionDescriptiondeDE        = '';
SET @TuskarrFactionDescriptionzhCN        = '';
SET @TuskarrFactionDescriptionzhTW        = '';
SET @TuskarrFactionDescriptionesES        = '';
SET @TuskarrFactionDescriptionesMX        = '';
SET @TuskarrFactionDescriptionruRU        = '';
SET @TuskarrFactionDescriptionjaJP        = '';
SET @TuskarrFactionDescriptionptPT        = '';
SET @TuskarrFactionDescriptionitIT        = '';
SET @TuskarrFactionDescriptionUnk1        = '';
SET @TuskarrFactionDescriptionUnk2        = '';
SET @TuskarrFactionDescriptionUnk3        = '';
SET @TuskarrFactionDescriptionUnk4        = '';

SET @TuskarrAchievementenUS               = 'Realm First! Level 80 Tuskarr';
SET @TuskarrAchievementkoKR               = '';
SET @TuskarrAchievementfrFR               = '';
SET @TuskarrAchievementdeDE               = '';
SET @TuskarrAchievementzhCN               = '';
SET @TuskarrAchievementzhTW               = '';
SET @TuskarrAchievementesES               = '';
SET @TuskarrAchievementesMX               = '';
SET @TuskarrAchievementruRU               = '';
SET @TuskarrAchievementjaJP               = '';
SET @TuskarrAchievementptPT               = '';
SET @TuskarrAchievementitIT               = '';
SET @TuskarrAchievementUnk1               = '';
SET @TuskarrAchievementUnk2               = '';
SET @TuskarrAchievementUnk3               = '';
SET @TuskarrAchievementUnk4               = '';

SET @TuskarrAchievementDescriptionenUS    = 'First tuskarr on the realm to achieve level 80.';
SET @TuskarrAchievementDescriptionkoKR    = '';
SET @TuskarrAchievementDescriptionfrFR    = '';
SET @TuskarrAchievementDescriptiondeDE    = '';
SET @TuskarrAchievementDescriptionzhCN    = '';
SET @TuskarrAchievementDescriptionzhTW    = '';
SET @TuskarrAchievementDescriptionesES    = '';
SET @TuskarrAchievementDescriptionesMX    = '';
SET @TuskarrAchievementDescriptionruRU    = '';
SET @TuskarrAchievementDescriptionjaJP    = '';
SET @TuskarrAchievementDescriptionptPT    = '';
SET @TuskarrAchievementDescriptionitIT    = '';
SET @TuskarrAchievementDescriptionUnk1    = '';
SET @TuskarrAchievementDescriptionUnk2    = '';
SET @TuskarrAchievementDescriptionUnk3    = '';
SET @TuskarrAchievementDescriptionUnk4    = '';
