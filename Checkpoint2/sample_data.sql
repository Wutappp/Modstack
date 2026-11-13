PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- ==========================================
-- TABLE 1: USERS
-- ==========================================
INSERT INTO Users VALUES
(1, 'admin01', 'admin01@example.com', 'admin', '2026-01-05'),
(2, 'alex', 'alex@example.com', 'creator', '2026-01-10'),
(3, 'jordan', 'jordan@example.com', 'creator', '2026-01-12'),
(4, 'sam', 'sam@example.com', 'creator', '2026-02-01'),
(5, 'taylor', 'taylor@example.com', 'user', '2026-02-05'),
(6, 'morgan', 'morgan@example.com', 'user', '2026-02-10'),
(7, 'casey', 'casey@example.com', 'creator', '2026-03-01'),
(8, 'jamie', 'jamie@example.com', 'user', '2026-03-05'),
(9, 'chris', 'chris@example.com', 'creator', '2026-03-10'),
(10, 'pat', 'pat@example.com', 'user', '2026-03-15'),
(11, 'steve', 'steve@example.com', 'creator', '2026-06-01'),
(12, 'emily', 'emily@example.com', 'creator', '2026-06-02'),
(13, 'ryan', 'ryan@example.com', 'user', '2026-06-03'),
(14, 'sophia', 'sophia@example.com', 'creator', '2026-06-04'),
(15, 'daniel', 'daniel@example.com', 'user', '2026-06-05');

-- ==========================================
-- TABLE 2: GAMES
-- ==========================================
INSERT INTO Games VALUES
(1, 'Minecraft', 'Mojang', 'Microsoft', '2011-11-18'),
(2, 'Skyrim', 'Bethesda', 'Bethesda', '2011-11-11'),
(3, 'Stardew Valley', 'ConcernedApe', 'ConcernedApe', '2016-02-26'),
(4, 'Cyberpunk 2077', 'CD Projekt Red', 'CD Projekt', '2020-12-10'),
(5, 'Terraria', 'Re-Logic', 'Re-Logic', '2011-05-16'),
(6, 'Fallout 4', 'Bethesda', 'Bethesda', '2015-11-10'),
(7, 'Elden Ring', 'FromSoftware', 'Bandai Namco', '2022-02-25'),
(8, 'The Witcher 3', 'CD Projekt Red', 'CD Projekt', '2015-05-19'),
(9, 'Hollow Knight', 'Team Cherry', 'Team Cherry', '2017-02-24'),
(10, 'Baldurs Gate 3', 'Larian Studios', 'Larian Studios', '2023-08-03');

-- ==========================================
-- TABLE 3: MODS
-- ==========================================
INSERT INTO Mods VALUES
(1, 1, 2, 'Better Textures', 'Improves graphics', 'Graphics', 'pending', '2026-04-01', '1.0', 'mods/bettertextures.zip', 25.5, 1500, '2026-04-01'),
(2, 1, 2, 'New Weapons', 'Adds new weapons', 'Gameplay', 'pending', '2026-04-02', '1.1', 'mods/newweapons.zip', 18.0, 900, '2026-04-02'),
(3, 1, 3, 'HD Environment', 'High definition environment', 'Graphics', 'pending', '2026-04-03', '1.0', 'mods/hdenvironment.zip', 45.0, 2200, '2026-04-03'),
(4, 1, 4, 'Better UI', 'Improves interface', 'UI', 'pending', '2026-04-04', '1.0', 'mods/betterui.zip', 10.0, 750, '2026-04-04'),
(5, 1, 7, 'Sound Overhaul', 'Improves game sounds', 'Audio', 'pending', '2026-04-05', '1.2', 'mods/sound.zip', 30.0, 1100, '2026-04-05'),
(6, 2, 2, 'Dragon Expansion', 'Adds dragons', 'Gameplay', 'approved', '2026-04-06', '2.0', 'mods/dragon.zip', 60.0, 3500, '2026-04-06'),
(7, 2, 3, 'Skyrim HD', 'Improves textures', 'Graphics', 'approved', '2026-04-07', '1.5', 'mods/skyrimhd.zip', 50.0, 4000, '2026-04-07'),
(8, 2, 4, 'Magic Expansion', 'Adds spells', 'Gameplay', 'approved', '2026-04-08', '1.0', 'mods/magic.zip', 22.0, 1800, '2026-04-08'),
(9, 3, 7, 'Farm Expansion', 'Adds farm content', 'Gameplay', 'approved', '2026-04-09', '1.0', 'mods/farm.zip', 15.0, 2700, '2026-04-09'),
(10, 3, 9, 'Seasonal Music', 'Adds music', 'Audio', 'approved', '2026-04-10', '1.0', 'mods/music.zip', 12.0, 950, '2026-04-10'),
(11, 4, 2, 'Cyberpunk Graphics', 'Graphics overhaul', 'Graphics', 'approved', '2026-04-11', '1.0', 'mods/cybergraphics.zip', 70.0, 5000, '2026-04-11'),
(12, 4, 3, 'Vehicle Expansion', 'Adds vehicles', 'Gameplay', 'approved', '2026-04-12', '1.0', 'mods/vehicles.zip', 40.0, 3200, '2026-04-12'),
(13, 4, 4, 'Cyber UI', 'Interface improvements', 'UI', 'rejected', '2026-04-13', '1.0', 'mods/cyberui.zip', 14.0, 300, '2026-04-13'),
(14, 5, 7, 'Terraria Bosses', 'Adds bosses', 'Gameplay', 'approved', '2026-04-14', '1.0', 'mods/bosses.zip', 20.0, 2100, '2026-04-14'),
(15, 5, 9, 'Pixel Graphics', 'Improves pixels', 'Graphics', 'approved', '2026-04-15', '1.0', 'mods/pixel.zip', 8.0, 1600, '2026-04-15'),
(16, 6, 2, 'Fallout Weapons', 'Adds weapons', 'Gameplay', 'approved', '2026-04-16', '1.0', 'mods/falloutweapons.zip', 35.0, 2800, '2026-04-16'),
(17, 6, 3, 'Fallout Textures', 'Texture overhaul', 'Graphics', 'approved', '2026-04-17', '1.0', 'mods/fallouttextures.zip', 55.0, 3100, '2026-04-17'),
(18, 6, 4, 'Fallout Radio', 'Adds radio stations', 'Audio', 'rejected', '2026-04-18', '1.0', 'mods/radio.zip', 25.0, 400, '2026-04-18'),
(19, 3, 7, 'Farm UI', 'Interface improvements', 'UI', 'approved', '2026-04-19', '1.0', 'mods/farmui.zip', 5.0, 850, '2026-04-19'),
(20, 2, 9, 'Skyrim Sound', 'Audio improvements', 'Audio', 'approved', '2026-04-20', '1.0', 'mods/skyrimsound.zip', 16.0, 1250, '2026-04-20'),
(21, 7, 11, 'Elden Ring HD', 'Improves textures', 'Graphics', 'approved', '2026-06-10', '1.0', 'mods/eldenhd.zip', 55.0, 4200, '2026-06-10'),
(22, 7, 12, 'New Bosses', 'Adds new bosses', 'Gameplay', 'approved', '2026-06-11', '1.0', 'mods/newbosses.zip', 35.0, 3500, '2026-06-11'),
(23, 7, 14, 'Better HUD', 'Improves interface', 'UI', 'pending', '2026-06-12', '1.0', 'mods/betterhud.zip', 12.0, 500, '2026-06-12'),
(24, 8, 11, 'Witcher Graphics', 'Graphics overhaul', 'Graphics', 'approved', '2026-06-13', '1.0', 'mods/witchergraphics.zip', 70.0, 4800, '2026-06-13'),
(25, 8, 12, 'Extra Quests', 'Adds new quests', 'Gameplay', 'approved', '2026-06-14', '1.0', 'mods/quests.zip', 40.0, 2900, '2026-06-14'),
(26, 8, 14, 'Witcher Music', 'New soundtrack', 'Audio', 'pending', '2026-06-15', '1.0', 'mods/witchermusic.zip', 25.0, 700, '2026-06-15'),
(27, 9, 11, 'Knight Skins', 'New character skins', 'Graphics', 'approved', '2026-06-16', '1.0', 'mods/knightskins.zip', 10.0, 1600, '2026-06-16'),
(28, 9, 12, 'Hard Mode', 'Increases difficulty', 'Gameplay', 'approved', '2026-06-17', '1.0', 'mods/hardmode.zip', 8.0, 2100, '2026-06-17'),
(29, 9, 14, 'Menu Redesign', 'Improves menus', 'UI', 'pending', '2026-06-18', '1.0', 'mods/menuredesign.zip', 6.0, 350, '2026-06-18'),
(30, 10, 11, 'BG3 Visuals', 'Visual enhancements', 'Graphics', 'approved', '2026-06-19', '1.0', 'mods/bg3visuals.zip', 60.0, 3900, '2026-06-19'),
(31, 10, 12, 'New Classes', 'Adds character classes', 'Gameplay', 'approved', '2026-06-20', '1.0', 'mods/newclasses.zip', 45.0, 4500, '2026-06-20'),
(32, 10, 14, 'Inventory UI', 'Improves inventory', 'UI', 'pending', '2026-06-21', '1.0', 'mods/inventoryui.zip', 15.0, 600, '2026-06-21'),
(33, 7, 2, 'Elden Ring Audio', 'Sound enhancements', 'Audio', 'approved', '2026-06-22', '1.0', 'mods/eldenaudio.zip', 20.0, 1200, '2026-06-22'),
(34, 8, 3, 'Combat Overhaul', 'Improves combat', 'Gameplay', 'approved', '2026-06-23', '1.0', 'mods/combat.zip', 30.0, 2600, '2026-06-23'),
(35, 10, 4, 'Dialogue Expansion', 'Adds dialogue', 'Gameplay', 'pending', '2026-06-24', '1.0', 'mods/dialogue.zip', 18.0, 400, '2026-06-24');

-- ==========================================
-- TABLE 4: GAME VERSIONS
-- ==========================================
INSERT INTO Game_Versions VALUES
(1, 1, '1.20', '2026-01-01'),
(2, 1, '1.21', '2026-02-01'),
(3, 2, '1.6', '2026-01-10'),
(4, 3, '1.5', '2026-01-15'),
(5, 4, '2.0', '2026-02-10'),
(6, 4, '2.1', '2026-03-10'),
(7, 5, '1.4', '2026-01-20'),
(8, 6, '1.10', '2026-02-20'),
(9, 7, '1.10', '2026-05-01'),
(10, 8, '4.04', '2026-05-02'),
(11, 9, '1.5', '2026-05-03'),
(12, 10, '1.6', '2026-05-04');

-- ==========================================
-- TABLE 5: REVIEWS
-- ==========================================
INSERT INTO Reviews VALUES
(1, 5, 1, 2, 'Needs improvement', '2026-05-01'),
(2, 6, 1, 3, 'Average graphics', '2026-05-02'),
(3, 8, 1, 2, 'Could be better', '2026-05-03'),
(4, 10, 2, 4, 'Good weapons', '2026-05-04'),
(5, 5, 3, 1, 'Poor quality', '2026-05-05'),
(6, 6, 3, 2, 'Low quality textures', '2026-05-06'),
(7, 8, 3, 1, 'Not recommended', '2026-05-07'),
(8, 10, 4, 3, 'Decent UI', '2026-05-08'),
(9, 5, 5, 4, 'Great audio', '2026-05-09'),
(10, 6, 6, 5, 'Amazing expansion', '2026-05-10'),
(11, 8, 7, 5, 'Excellent graphics', '2026-05-11'),
(12, 10, 8, 4, 'Fun gameplay', '2026-05-12'),
(13, 5, 9, 5, 'Great farming', '2026-05-13'),
(14, 6, 10, 3, 'Nice music', '2026-05-14'),
(15, 8, 11, 5, 'Excellent visuals', '2026-05-15'),
(16, 10, 12, 4, 'Good vehicles', '2026-05-16'),
(17, 5, 13, 2, 'Needs work', '2026-05-17'),
(18, 6, 14, 4, 'Fun bosses', '2026-05-18'),
(19, 8, 15, 5, 'Looks great', '2026-05-19'),
(20, 10, 16, 4, 'Great weapons', '2026-05-20'),
(21, 13, 21, 5, 'Amazing textures', '2026-07-01'),
(22, 15, 21, 4, 'Looks fantastic', '2026-07-02'),
(23, 5, 22, 5, 'Great boss fights', '2026-07-03'),
(24, 6, 24, 5, 'Beautiful graphics', '2026-07-04'),
(25, 8, 25, 4, 'Fun quests', '2026-07-05'),
(26, 10, 27, 4, 'Nice skins', '2026-07-06'),
(27, 13, 28, 5, 'Great challenge', '2026-07-07'),
(28, 15, 30, 5, 'Looks incredible', '2026-07-08'),
(29, 5, 31, 5, 'Excellent classes', '2026-07-09'),
(30, 6, 33, 3, 'Good audio', '2026-07-10'),
(31, 8, 34, 4, 'Better combat', '2026-07-11'),
(32, 10, 21, 5, 'Excellent mod', '2026-07-12');

-- ==========================================
-- TABLE 6: COMPATIBILITY
-- ==========================================
INSERT INTO Compatibility VALUES
(1, 1, 1, '2026-05-01'),
(2, 2, 1, '2026-05-02'),
(3, 1, 1, '2026-05-03'),
(4, 2, 0, '2026-05-04'),
(5, 1, 1, '2026-05-05'),
(6, 3, 1, '2026-05-06'),
(7, 3, 1, '2026-05-07'),
(8, 3, 1, '2026-05-08'),
(9, 4, 1, '2026-05-09'),
(10, 4, 1, '2026-05-10'),
(11, 5, 1, '2026-05-11'),
(12, 6, 1, '2026-05-12'),
(21, 9, 1, '2026-07-01'),
(22, 9, 1, '2026-07-02'),
(23, 9, 0, '2026-07-03'),
(24, 10, 1, '2026-07-04'),
(25, 10, 1, '2026-07-05'),
(26, 10, 0, '2026-07-06'),
(27, 11, 1, '2026-07-07'),
(28, 11, 1, '2026-07-08'),
(30, 12, 1, '2026-07-09'),
(31, 12, 1, '2026-07-10');COMMIT;
