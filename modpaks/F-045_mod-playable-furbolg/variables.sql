-- Race ID
SET @Furbolg                              := @NextRace := @NextRace +1;
SET @FurbolgMask                          = 1 << (@Furbolg - 1);
SET @FurbolgHelmetMask                    = 1 << @Furbolg;

-- Important variable updates (Alliance vs. Horde)
SET @AllianceMask                         = @AllianceMask    | @FurbolgMask;
SET @BarrensBros                          = @HordeMask    & ~@UndercityMask; -- important if Horde
SET @PlayableRaceMask                     = @PlayableRaceMask | @FurbolgMask;
SET @BowHunters                           = @BowHunters      | @FurbolgMask;
SET @FurbolgLanguage                      = 7; -- 7 for Alliance, 1 for Horde (ChrRaces.dbc)
SET @FurbolgAlliance                      = 0; -- 0 for Alliance, 1 for Horde (ChrRaces.dbc)
SET @FurbolgKnowThyEnemy                  = @KnowThyEnemyAlliance;

-- Miscellaneous
SET @FurbolgHome                          = @NightElf; -- classes, start outfits, start position, action bars and stats are copied from this race
SET @FurbolgExplorationSound              = @NightElfExplorationSound;
SET @FurbolgCinematicSequence             = @NightElfCinematicSequence;
SET @FurbolgBlood                         = 1;
SET @FurbolgMaleModelPath                 = 'Character\\Furbolg\\FurbolgRace.mdx';
SET @FurbolgFemaleModelPath               = 'Character\\Furbolg\\FurbolgRace.mdx';
SET @FurbolgMaleFootprint                 = @FootprintShoe;
SET @FurbolgFemaleFootprint               = @FootprintShoe;
SET @FurbolgRacials                       = @FurbolgRacials;
SET @FurbolgFaction                       = 1205; -- vacant slot
SET @FurbolgPlayer                        = 1206; -- vacant slot

-- Strings
SET @FurbolgClientPrefix                  = 'Ta'; -- NightElf prefix, so NightElf helmet models are used
SET @FurbolgClientString                  = 'Furbolg';
SET @FurbolgFacialHairCustomization1      = 'NORMAL';
SET @FurbolgFacialHairCustomization2      = 'NORMAL';
SET @FurbolgHairCustomization             = 'NORMAL';

-- Localization Strings
SET @FurbolgenUS                          = 'Furbolg';
SET @FurbolgkoKR                          = '';
SET @FurbolgfrFR                          = '';
SET @FurbolgdeDE                          = '';
SET @FurbolgzhCN                          = '';
SET @FurbolgzhTW                          = '';
SET @FurbolgesES                          = '';
SET @FurbolgesMX                          = '';
SET @FurbolgruRU                          = '';
SET @FurbolgjaJP                          = '';
SET @FurbolgptPT                          = '';
SET @FurbolgitIT                          = '';
SET @FurbolgUnk1                          = '';
SET @FurbolgUnk2                          = '';
SET @FurbolgUnk3                          = '';
SET @FurbolgUnk4                          = '';

SET @FurbolgFemaleenUS                    = '';
SET @FurbolgFemalekoKR                    = '';
SET @FurbolgFemalefrFR                    = '';
SET @FurbolgFemaledeDE                    = '';
SET @FurbolgFemalezhCN                    = '';
SET @FurbolgFemalezhTW                    = '';
SET @FurbolgFemaleesES                    = '';
SET @FurbolgFemaleesMX                    = '';
SET @FurbolgFemaleruRU                    = '';
SET @FurbolgFemalejaJP                    = '';
SET @FurbolgFemaleptPT                    = '';
SET @FurbolgFemaleitIT                    = '';
SET @FurbolgFemaleUnk1                    = '';
SET @FurbolgFemaleUnk2                    = '';
SET @FurbolgFemaleUnk3                    = '';
SET @FurbolgFemaleUnk4                    = '';

SET @FurbolgMaleenUS                      = '';
SET @FurbolgMalekoKR                      = '';
SET @FurbolgMalefrFR                      = '';
SET @FurbolgMaledeDE                      = '';
SET @FurbolgMalezhCN                      = '';
SET @FurbolgMalezhTW                      = '';
SET @FurbolgMaleesES                      = '';
SET @FurbolgMaleesMX                      = '';
SET @FurbolgMaleruRU                      = '';
SET @FurbolgMalejaJP                      = '';
SET @FurbolgMaleptPT                      = '';
SET @FurbolgMaleitIT                      = '';
SET @FurbolgMaleUnk1                      = '';
SET @FurbolgMaleUnk2                      = '';
SET @FurbolgMaleUnk3                      = '';
SET @FurbolgMaleUnk4                      = '';

SET @FurbolgRacialNameenUS                = 'Racial - Furbolg';
SET @FurbolgRacialNamekoKR                = '';
SET @FurbolgRacialNamefrFR                = '';
SET @FurbolgRacialNamedeDE                = '';
SET @FurbolgRacialNamezhCN                = '';
SET @FurbolgRacialNamezhTW                = '';
SET @FurbolgRacialNameesES                = '';
SET @FurbolgRacialNameesMX                = '';
SET @FurbolgRacialNameruRU                = '';
SET @FurbolgRacialNamejaJP                = '';
SET @FurbolgRacialNameptPT                = '';
SET @FurbolgRacialNameitIT                = '';
SET @FurbolgRacialNameUnk1                = '';
SET @FurbolgRacialNameUnk2                = '';
SET @FurbolgRacialNameUnk3                = '';
SET @FurbolgRacialNameUnk4                = '';

SET @FurbolgPlayerenUS                    = '"PLAYER", " Furbolg"';
SET @FurbolgPlayerkoKR                    = '';
SET @FurbolgPlayerfrFR                    = '';
SET @FurbolgPlayerdeDE                    = '';
SET @FurbolgPlayerzhCN                    = '';
SET @FurbolgPlayerzhTW                    = '';
SET @FurbolgPlayeresES                    = '';
SET @FurbolgPlayeresMX                    = '';
SET @FurbolgPlayerruRU                    = '';
SET @FurbolgPlayerjaJP                    = '';
SET @FurbolgPlayerptPT                    = '';
SET @FurbolgPlayeritIT                    = '';
SET @FurbolgPlayerUnk1                    = '';
SET @FurbolgPlayerUnk2                    = '';
SET @FurbolgPlayerUnk3                    = '';
SET @FurbolgPlayerUnk4                    = '';

SET @FurbolgFactionNameenUS               = 'Furbolg';
SET @FurbolgFactionNamekoKR               = '';
SET @FurbolgFactionNamefrFR               = '';
SET @FurbolgFactionNamedeDE               = '';
SET @FurbolgFactionNamezhCN               = '';
SET @FurbolgFactionNamezhTW               = '';
SET @FurbolgFactionNameesES               = '';
SET @FurbolgFactionNameesMX               = '';
SET @FurbolgFactionNameruRU               = '';
SET @FurbolgFactionNamejaJP               = '';
SET @FurbolgFactionNameptPT               = '';
SET @FurbolgFactionNameitIT               = '';
SET @FurbolgFactionNameUnk1               = '';
SET @FurbolgFactionNameUnk2               = '';
SET @FurbolgFactionNameUnk3               = '';
SET @FurbolgFactionNameUnk4               = '';

SET @FurbolgFactionDescriptionenUS        = 'Furbolgs who have joined the Alliance.';
SET @FurbolgFactionDescriptionkoKR        = '';
SET @FurbolgFactionDescriptionfrFR        = '';
SET @FurbolgFactionDescriptiondeDE        = '';
SET @FurbolgFactionDescriptionzhCN        = '';
SET @FurbolgFactionDescriptionzhTW        = '';
SET @FurbolgFactionDescriptionesES        = '';
SET @FurbolgFactionDescriptionesMX        = '';
SET @FurbolgFactionDescriptionruRU        = '';
SET @FurbolgFactionDescriptionjaJP        = '';
SET @FurbolgFactionDescriptionptPT        = '';
SET @FurbolgFactionDescriptionitIT        = '';
SET @FurbolgFactionDescriptionUnk1        = '';
SET @FurbolgFactionDescriptionUnk2        = '';
SET @FurbolgFactionDescriptionUnk3        = '';
SET @FurbolgFactionDescriptionUnk4        = '';

SET @FurbolgAchievementenUS               = 'Realm First! Level 80 Furbolg';
SET @FurbolgAchievementkoKR               = '';
SET @FurbolgAchievementfrFR               = '';
SET @FurbolgAchievementdeDE               = '';
SET @FurbolgAchievementzhCN               = '';
SET @FurbolgAchievementzhTW               = '';
SET @FurbolgAchievementesES               = '';
SET @FurbolgAchievementesMX               = '';
SET @FurbolgAchievementruRU               = '';
SET @FurbolgAchievementjaJP               = '';
SET @FurbolgAchievementptPT               = '';
SET @FurbolgAchievementitIT               = '';
SET @FurbolgAchievementUnk1               = '';
SET @FurbolgAchievementUnk2               = '';
SET @FurbolgAchievementUnk3               = '';
SET @FurbolgAchievementUnk4               = '';

SET @FurbolgAchievementDescriptionenUS    = 'First furbolg on the realm to achieve level 80.';
SET @FurbolgAchievementDescriptionkoKR    = '';
SET @FurbolgAchievementDescriptionfrFR    = '';
SET @FurbolgAchievementDescriptiondeDE    = '';
SET @FurbolgAchievementDescriptionzhCN    = '';
SET @FurbolgAchievementDescriptionzhTW    = '';
SET @FurbolgAchievementDescriptionesES    = '';
SET @FurbolgAchievementDescriptionesMX    = '';
SET @FurbolgAchievementDescriptionruRU    = '';
SET @FurbolgAchievementDescriptionjaJP    = '';
SET @FurbolgAchievementDescriptionptPT    = '';
SET @FurbolgAchievementDescriptionitIT    = '';
SET @FurbolgAchievementDescriptionUnk1    = '';
SET @FurbolgAchievementDescriptionUnk2    = '';
SET @FurbolgAchievementDescriptionUnk3    = '';
SET @FurbolgAchievementDescriptionUnk4    = '';
