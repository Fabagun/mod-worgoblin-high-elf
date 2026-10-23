// Running Wild (F-024_mod-playable-worgen)

#include "Config.h"
#include "ModpakScripts.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "SpellAuraEffects.h"
#include "SpellScript.h"

enum WorgenRiding
{
    SPELL_APPRENTICE_RIDING  = 33388,
    SPELL_JOURNEYMAN_RIDING  = 33391,
    SPELL_RUNNING_WILD       = 87840, // Cataclysm ID (@SpellRunningWildMale60)

    RUNNING_WILD_LEVEL       = 20,
    RIDING_SKILL_JOURNEYMAN  = 150,
};

constexpr char const* RUNNING_WILD_SCRIPT = "spell_worgen_running_wild";

// Running Wild, as in Cataclysm: a mount on which the Worgen is its own mount. The spell's mounted aura names no
// creature, so instead of mounting nothing (display 0), mount the player's own native display; the patched client
// draws a mount display equal to the native display as the player running on all fours. Running Wild is taken in the
// native form, so it drops the altered (human) form first. Speed follows riding skill, like Cataclysm's
// MountCapability: +60%, or +100% from Journeyman Riding (150 skill).
class spell_worgen_running_wild : public AuraScript
{
    PrepareAuraScript(spell_worgen_running_wild);

    void HandleMount(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        PreventDefaultAction();

        Unit* target = GetTarget();
        target->RemoveAurasByType(SPELL_AURA_302);
        target->Mount(target->GetNativeDisplayId());
    }

    void CalculateSpeed(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
    {
        Player* player = GetUnitOwner() ? GetUnitOwner()->ToPlayer() : nullptr;
        if (!player)
            return;

        amount = player->GetSkillValue(SKILL_RIDING) >= RIDING_SKILL_JOURNEYMAN ? 100 : 60;
    }

    void Register() override
    {
        // Same modes as the default mounted aura handler, so it never runs for this spell
        OnEffectApply += AuraEffectApplyFn(spell_worgen_running_wild::HandleMount, EFFECT_0, SPELL_AURA_MOUNTED, AURA_EFFECT_HANDLE_SEND_FOR_CLIENT_MASK);
        DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_worgen_running_wild::CalculateSpeed, EFFECT_1, SPELL_AURA_MOD_INCREASE_MOUNTED_SPEED);
    }
};

// Teaches Running Wild at level 20, as in Cataclysm; its speed comes from riding skill when cast (see
// spell_worgen_running_wild), so there is nothing to sync afterwards. Optionally hands out Apprentice and Journeyman
// Riding for free. Death Knights are left out of that: they already start with 150 riding skill.
// Only when the modpak is applied (it binds Running Wild to spell_worgen_running_wild) and only for the races its
// SkillLineAbility row gives Running Wild to, so no race ID is needed here.
// The previous gendered, per-tier version is in legacy/legacy_worgen_running_wild.cpp.
class player_worgen_running_wild : public PlayerScript
{
public:
    player_worgen_running_wild() : PlayerScript("player_worgen_running_wild") { }

    void OnPlayerLogin(Player* player) override { HandleWorgen(player); }
    void OnPlayerLevelChanged(Player* player, uint8 /*oldLevel*/) override { HandleWorgen(player); }

private:
    void HandleWorgen(Player* player)
    {
        if (!WHE::IsSpellScriptBound(SPELL_RUNNING_WILD, RUNNING_WILD_SCRIPT)
            || !WHE::IsSpellForPlayerRace(player, SPELL_RUNNING_WILD))
            return;

        uint8 level = player->GetLevel();

        if (level >= RUNNING_WILD_LEVEL && !player->HasSpell(SPELL_RUNNING_WILD))
            player->learnSpell(SPELL_RUNNING_WILD);

        if (player->getClass() == CLASS_DEATH_KNIGHT)
            return;

        if (sConfigMgr->GetOption<bool>("Worgoblin.RunningWild.FreeApprentice", true)
            && level >= 20 && !player->HasSpell(SPELL_APPRENTICE_RIDING))
            player->learnSpell(SPELL_APPRENTICE_RIDING);

        if (sConfigMgr->GetOption<bool>("Worgoblin.RunningWild.FreeJourneyman", true)
            && level >= 40 && !player->HasSpell(SPELL_JOURNEYMAN_RIDING))
            player->learnSpell(SPELL_JOURNEYMAN_RIDING);
    }
};

void AddSC_F024_Worgen()
{
    RegisterSpellScript(spell_worgen_running_wild);
    new player_worgen_running_wild();
}
