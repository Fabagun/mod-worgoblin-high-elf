# Workflow
1. Set up the DBCTools config file and import clean DBCs (change the database name each time if you want to import different DBCs to compare them with DBC_diff)
2. Make a dump (export) of your squeaky clean DBCs, or make support tables you'll need first
3. Set up the build-dbc config file and point it at the directories containing your SQL files and/or your testworld server
4. Wait for the tool to finish, then copy the exported DBC files to your client patch

# Tools
- `checks/check_customization.py`: checks the customization data of race modpaks (CharSections, CharHairGeosets,
  CharacterFacialHairStyles, CharHairTextures, BarberShopStyle) for missing textures, textures from another race's
  folder, duplicate rows, colour/type gaps and geosets the model lacks. No database needed, but it reads the client
  assets from a [WHE-common](https://github.com/Medviten/WHE-common) checkout (next to this repo by default, or
  `--common PATH` / `$WHE_COMMON`):
  `python3 tools/checks/check_customization.py --stock-dbc /path/to/original/dbc [MODPAK ...]`
