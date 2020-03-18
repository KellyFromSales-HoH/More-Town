namespace ResetBroken
{
    void ResetUpgrades()
    {
        auto record = GetLocalPlayerRecord();
        auto gm = cast<Campaign>(g_gameMode);
        auto town = gm.m_townLocal;

        record.upgrades.removeRange(0, record.upgrades.length());
        town.m_buildings.removeRange(0, town.m_buildings.length());
        ChangeLevel(GetCurrentLevelFilename());
    }

    [Hook]
    void GameModeConstructor(Campaign@ campaign)
    {
       AddFunction("resetmyupgrades", ResetUpgrades);
    }
}