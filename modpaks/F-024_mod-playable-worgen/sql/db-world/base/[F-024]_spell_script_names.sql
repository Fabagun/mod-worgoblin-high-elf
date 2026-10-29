/* Running Wild: mounts the Worgen as itself, with speed from riding skill (src/modpaks/F-024_mod-playable-worgen/running_wild.cpp) */
DELETE FROM `spell_script_names` WHERE `spell_id` = @RunningWildMale60;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(@RunningWildMale60, 'spell_worgen_running_wild');
