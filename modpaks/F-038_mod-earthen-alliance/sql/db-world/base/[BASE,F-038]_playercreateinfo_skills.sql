-- Racial skills
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @AllianceEarthenMask AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@AllianceEarthenMask, 0, @AllianceEarthenRacials, 0, @AllianceEarthenRacialNameenUS);