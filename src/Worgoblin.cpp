#include "worgoblin_loader.h"
#include "Chat.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "Config.h"

// Module-wide scripts. Scripts that belong to one modpak live in src/modpaks/<modpak>/ (see ModpakScripts.h) and are
// registered from worgoblin_loader.h.
class worgoblin : public PlayerScript {

public:
    worgoblin() : PlayerScript("worgoblin") { }

    void OnPlayerLogin(Player* player) override
    {
        if (sConfigMgr->GetOption<bool>("Announce.enable", true))
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the Worgoblin and High Elf modules.");
    }
};

void Add_Worgoblin()
{
    new worgoblin();
}
