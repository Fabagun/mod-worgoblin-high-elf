-- Racial skills
DELETE FROM `playercreateinfo_skills` WHERE `raceMask` = @HordeEarthenMask AND `classMask` = 0;
INSERT IGNORE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(@HordeEarthenMask, 0, @HordeEarthenRacials, 0, @HordeEarthenRacialNameenUS);