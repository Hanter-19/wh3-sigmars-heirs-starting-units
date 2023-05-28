# Sigmar's Heirs: Provincial Starting Units
 A Total War: Warhammer 3 submod for Xoudad's Sigmar's Heirs Empire Overhaul. 
 
 Uses scripting to replace the starting armies of various starting Empire Lords with Provincial State Troops where applicable.

 ## How it works
 At post-first-tick for a new game, the script will:
 - Iterate over all Empire factions who have Provincial State Troops
    - Iterate over all armies belonging to that faction
        - Replace non-Provincial infantry with their Provincial counterparts in each army

After all this is done, it will trigger a custom event `ScriptEventProvincialTroopReplacementCompleted`, which could be helpful in case other mods want to update an army after this script is done.

The replacement is done dynamically, meaning that even if the starting units of any of the applicable factions change, this script will preserve their overall army composition and only update Provincial units.

## Cross-Mod Compatibility
I tested the following popular Empire mods that add/modify Legendary Lords:
- [Mixu's Legendary Lords](https://steamcommunity.com/sharedfiles/filedetails/?id=2802810577)
- SCM's [Marienburg: the Merchant Empire](https://steamcommunity.com/sharedfiles/filedetails/?id=2949216752)
- graetor's [Solland Overhaul](https://steamcommunity.com/sharedfiles/filedetails/?id=2942896604)
- graetor's [Sylvania Overhaul](https://steamcommunity.com/sharedfiles/filedetails/?id=2948339087)
- HKrul's [Empire Secessionists, Secede!](https://steamcommunity.com/sharedfiles/filedetails/?id=2874009018)
### Mixu's Legendary Lords
Works fine - all new Empire LLs will have their units updated.
### SCM's Marienburg: The Merchant Empire
Works fine - Jaan starts with a wholly unique army using their own custom units, so there are no State Troops to update.
### graetor's Solland Overhaul
Works fine - Eldred will have his units updated.
### graetor's Sylvania Overhaul
Works fine - As a new faction, the Grand County Sylvania has no Provincial troops, so there's nothing to update. Other Elector Counts will still have updated armies.
### HKrul's Empire Secessionists, Secede!
Works fine - Xoudad has opted to leave this faction's units untouched, so there's nothing to update. Other Elector Counts will still hae updated armies.