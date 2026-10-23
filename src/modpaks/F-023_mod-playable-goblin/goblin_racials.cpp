// Goblin racials (F-023_mod-playable-goblin; the legacy F-004_mod-worgoblin binds Rocket Barrage too)

#include "Player.h"
#include "ScriptMgr.h"
#include "SpellScript.h"

enum GoblinSpells
{
    SPELL_BEST_DEALS_ANYWHERE = 69044, // Cataclysm ID (@SpellBestDealsAnywhere)
};

// Rocket Barrage: damage from level, spell power and attack power. Bound by the modpak's spell_script_names.
class spell_rocket_barrage : public SpellScript
{
    PrepareSpellScript(spell_rocket_barrage);

    void HandleDamage(SpellEffIndex /*effIndex*/)
    {
        Unit* caster = GetCaster();
        if (!caster)
            return;

        int32 basePoints = 0 + caster->GetLevel() * 2;
        basePoints += caster->SpellBaseDamageBonusDone(GetSpellInfo()->GetSchoolMask()) * 0.429; //BM=0.429 here, don't ask me how.
        basePoints += caster->GetTotalAttackPowerValue(caster->getClass() != CLASS_HUNTER ? BASE_ATTACK : RANGED_ATTACK) * 0.25; // 0.25=BonusCoefficient, hardcoding it here
        SetEffectValue(basePoints);
    }

    void Register() override
    {
        OnEffectLaunchTarget += SpellEffectFn(spell_rocket_barrage::HandleDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
    }
};

// Best Deals Anywhere: the best vendor discount everywhere. Only players who have the racial (taught by the modpak)
// get it, so this needs no other check.
class player_goblin_best_deals_anywhere : public PlayerScript
{
public:
    player_goblin_best_deals_anywhere() : PlayerScript("player_goblin_best_deals_anywhere") { }

    void OnPlayerGetReputationPriceDiscount(Player const* player, FactionTemplateEntry const* factionTemplate, float& discount) override
    {
        if (!factionTemplate || !factionTemplate->faction)
            return;

        if (player->HasSpell(SPELL_BEST_DEALS_ANYWHERE))
            discount *= 0.8;
    }
};

void AddSC_F023_Goblin()
{
    RegisterSpellScript(spell_rocket_barrage);
    new player_goblin_best_deals_anywhere();
}
