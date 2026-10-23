void Add_Worgoblin();
void AddSC_mod_race_costumes();

// Modpak scripts (src/modpaks/<modpak>/): always compiled, gated by the data their modpak installs (ModpakScripts.h)
void AddSC_F023_Goblin();
void AddSC_F024_Worgen();

// AzerothCore calls Add<module folder name, '-' as '_'>Scripts(): the repository's own name (WHE-32-bit)...
void AddWHE_32_bitScripts()
{
    Add_Worgoblin();
    AddSC_mod_race_costumes();

    AddSC_F023_Goblin();
    AddSC_F024_Worgen();
}

// ...or the module's former name, for installs whose folder is still called mod-worgoblin-high-elf
void Addmod_worgoblin_high_elfScripts()
{
    AddWHE_32_bitScripts();
}
