-- ============================================================================
-- CSE 111 Fall 2026: Project Checkpoint 2 Script
-- Project Title: ModStack
-- Team Members: Kevin Wu, Alizeh Jahan
-- File: Checkpoint2-script.sql
-- ============================================================================

-- ============================================================================
-- SCHEMA MODIFICATIONS SINCE CHECKPOINT 1
-- ============================================================================
-- Modifications:
-- 1. Merged Mod_Releases attributes into Mods as finalized in Checkpoint 1
--    (6 relations: Users, Games, Game_Versions, Mods, Compatibility, Reviews).
-- ============================================================================

-- ============================================================================
-- MEMBER CONTRIBUTIONS SUMMARY (GROUPED AT THE TOP)
-- ============================================================================
-- SECTION 1: SIMPLE STATEMENTS
-- Statement 01: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 02: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 03: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 04: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 05: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 06: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 07: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 08: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 09: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 10: Kevin Wu: 0%, Alizeh Jahan: 100%

-- SECTION 2: INTERMEDIATE STATEMENTS
-- Statement 11: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 12: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 13: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 14: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 15: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 16: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 17: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 18: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 19: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 20: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 21: Kevin Wu: 0%, Alizeh Jahan: 100%

-- SECTION 3: COMPLEX STATEMENTS
-- Statement 22: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 23: Kevin Wu: 100%, Alizeh Jahan: 0%
-- Statement 24: Kevin Wu: 20%, Alizeh Jahan: 80%
-- Statement 25: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 26: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 27: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 28: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 29: Kevin Wu: 20%, Alizeh Jahan: 80%
-- Statement 30: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 31: Kevin Wu: 0%, Alizeh Jahan: 100%
-- Statement 32: Kevin Wu: 0%, Alizeh Jahan: 100%

-- ============================================================================
-- DATABASE SETTINGS
-- ============================================================================
PRAGMA foreign_keys = ON;

-- ============================================================================
-- SECTION 1: SIMPLE STATEMENTS
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Statement 01: View All Registered Users
-- Explanation: Allows administrators to view registered users and their
-- account information, sorted by registration date.
-- ----------------------------------------------------------------------------
SELECT user_id, username, email, role, joined_date
FROM Users
ORDER BY joined_date DESC;

-- ----------------------------------------------------------------------------
-- Statement 02: View Pending Mods
-- Explanation: Retrieves mods awaiting administrator approval,
-- ordered from oldest to newest.
-- ----------------------------------------------------------------------------
SELECT mod_id, title, creator_id, status, created_at
FROM Mods
WHERE status = 'pending'
ORDER BY created_at ASC;

-- ----------------------------------------------------------------------------
-- Statement 03: Approve a Pending Mod
-- Explanation: Changes the status of a selected pending mod to approved.
-- Only pending mods can be modified by this statement.
-- ----------------------------------------------------------------------------
UPDATE Mods
SET status = 'approved'
WHERE mod_id = 1
  AND status = 'pending';

-- ----------------------------------------------------------------------------
-- Statement 04: Delete a Selected Review
-- Explanation: Allows an administrator to remove a specific review.
-- ----------------------------------------------------------------------------
DELETE FROM Reviews
WHERE review_id = 5;

-- ----------------------------------------------------------------------------
-- Statement 05: Reject a Pending Mod
-- Explanation: Changes a selected pending mod's status to rejected.
-- ----------------------------------------------------------------------------
UPDATE Mods
SET status = 'rejected'
WHERE mod_id = 2
  AND status = 'pending';

-- ----------------------------------------------------------------------------
-- Statement 06: Browse Approved Graphics Mods
-- Explanation: Allows gamers to filter approved mods within the Graphics
-- category, sorted by download count from highest to lowest.
-- ----------------------------------------------------------------------------
SELECT mod_id, game_id, title, version_tag, file_size_mb, download_count, download_url
FROM Mods
WHERE status = 'approved'
  AND category = 'Graphics'
ORDER BY download_count DESC;

-- ----------------------------------------------------------------------------
-- Statement 07: Publish a New Mod
-- Explanation: Allows a mod developer (creator_id = 2, alex) to submit a new
-- mod into the Mods table with an initial 'pending' status.
-- ----------------------------------------------------------------------------
INSERT INTO Mods (
    mod_id, game_id, creator_id, title, description, category,
    status, created_at, version_tag, download_url, file_size_mb,
    download_count, uploaded_at
)
VALUES (
    36, 1, 2, 'Dynamic Shaders', 'Adds real-time shadows and water reflections',
    'Graphics', 'pending', '2026-08-01', '1.0', 'mods/dynamicshaders.zip',
    42.5, 0, '2026-08-01'
);

-- ----------------------------------------------------------------------------
-- Statement 08: Submit a Gamer Review
-- Explanation: Allows a gamer (user_id = 5, taylor) to post a rating and
-- comment for an approved mod (mod_id = 6, Dragon Expansion).
-- ----------------------------------------------------------------------------
INSERT INTO Reviews (review_id, user_id, mod_id, rating, comment, review_date)
VALUES (33, 5, 6, 5, 'Runs smoothly with zero crashes!', '2026-08-02');

-- ----------------------------------------------------------------------------
-- Statement 09: Increment Download Count on Mod Download
-- Explanation: Updates the download_count of an approved mod (mod_id = 11)
-- when a gamer downloads the mod file.
-- ----------------------------------------------------------------------------
UPDATE Mods
SET download_count = download_count + 1
WHERE mod_id = 11
  AND status = 'approved';

-- ----------------------------------------------------------------------------
-- Statement 10: Update Mod Release Version and File Details
-- Explanation: Allows a mod developer to push a version update, new download
-- archive URL, and updated file size for their mod (mod_id = 6).
-- ----------------------------------------------------------------------------
UPDATE Mods
SET version_tag = '2.1',
    download_url = 'mods/dragon_v2_1.zip',
    file_size_mb = 64.0,
    uploaded_at = '2026-08-05'
WHERE mod_id = 6
  AND creator_id = 2;

-- ============================================================================
-- SECTION 2: INTERMEDIATE STATEMENTS
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Statement 11: Users With More Than Two Mods
-- Explanation: Joins users with their mods and counts how many each
-- user created. Only users with more than two mods are displayed.
-- ----------------------------------------------------------------------------
SELECT
    u.user_id,
    u.username,
    COUNT(m.mod_id) AS total_mods
FROM Users u
JOIN Mods m
    ON u.user_id = m.creator_id
GROUP BY u.user_id, u.username
HAVING COUNT(m.mod_id) > 2
ORDER BY total_mods DESC;

-- ----------------------------------------------------------------------------
-- Statement 12: Mods With Low Average Ratings
-- Explanation: Calculates the average rating for each mod and
-- returns mods with an average rating below three.
-- ----------------------------------------------------------------------------
SELECT
    m.mod_id,
    m.title,
    ROUND(AVG(r.rating), 2) AS average_rating,
    COUNT(r.review_id) AS total_reviews
FROM Mods m
JOIN Reviews r
    ON m.mod_id = r.mod_id
GROUP BY m.mod_id, m.title
HAVING AVG(r.rating) < 3
ORDER BY average_rating ASC;

-- ----------------------------------------------------------------------------
-- Statement 13: View Most Popular Mods
-- Explanation: Display the 10 most popular mods based on their total download
-- counts, including their game names and average user ratings
-- ----------------------------------------------------------------------------
SELECT
    m.mod_id,
    m.title AS mod_title,
    g.title AS game_title,
    m.download_count,
    ROUND(AVG(r.rating), 2) AS average_rating
FROM Mods m
JOIN Games g
    ON m.game_id = g.game_id
LEFT JOIN Reviews r
    ON m.mod_id = r.mod_id
GROUP BY
    m.mod_id,
    m.title,
    g.title,
    m.download_count
ORDER BY
    m.download_count DESC,
    m.mod_id ASC
LIMIT 10;

-- ----------------------------------------------------------------------------
-- Statement 14: View Games with the Most Mods
-- Explanation: Counts the total number of mods associated with each
-- game and ranks games from highest to lowest.
-- ----------------------------------------------------------------------------
SELECT
    g.game_id,
    g.title AS game_title,
    COUNT(m.mod_id) AS total_mods
FROM Games g
LEFT JOIN Mods m
    ON g.game_id = m.game_id
GROUP BY
    g.game_id,
    g.title
ORDER BY
    total_mods DESC,
    g.title ASC;

-- ----------------------------------------------------------------------------
-- Statement 15: Search Approved Mods for a Specific Game
-- Explanation: Allows gamers to browse all approved mods for a chosen game
-- ('Skyrim'), displaying creator username, category, version, and downloads.
-- ----------------------------------------------------------------------------
SELECT
    m.mod_id,
    m.title AS mod_title,
    u.username AS creator_username,
    m.category,
    m.version_tag,
    m.file_size_mb,
    m.download_count,
    m.download_url
FROM Mods m
JOIN Games g
    ON m.game_id = g.game_id
JOIN Users u
    ON m.creator_id = u.user_id
WHERE g.title = 'Skyrim'
  AND m.status = 'approved'
ORDER BY m.download_count DESC;

-- ----------------------------------------------------------------------------
-- Statement 16: Check Mod Compatibility for a Specific Game Version
-- Explanation: Allows gamers to check which mods are marked compatible
-- (is_compatible = 1) with a specific game version ('Cyberpunk 2077' v2.0).
-- ----------------------------------------------------------------------------
SELECT
    g.title AS game_title,
    gv.version_number AS game_version,
    m.mod_id,
    m.title AS mod_title,
    m.version_tag AS mod_version,
    c.tested_date
FROM Compatibility c
JOIN Mods m
    ON c.mod_id = m.mod_id
JOIN Game_Versions gv
    ON c.game_version_id = gv.game_version_id
JOIN Games g
    ON gv.game_id = g.game_id
WHERE g.title = 'Cyberpunk 2077'
  AND gv.version_number = '2.0'
  AND c.is_compatible = 1
  AND m.status = 'approved'
ORDER BY m.title ASC;

-- ----------------------------------------------------------------------------
-- Statement 17: View All Reviews for a Specific Mod
-- Explanation: Retrieves all gamer ratings, comments, and reviewer usernames
-- for a selected mod (mod_id = 21, Elden Ring HD), newest first.
-- ----------------------------------------------------------------------------
SELECT
    r.review_id,
    u.username AS reviewer,
    r.rating,
    r.comment,
    r.review_date
FROM Reviews r
JOIN Users u
    ON r.user_id = u.user_id
WHERE r.mod_id = 21
ORDER BY r.review_date DESC;

-- ----------------------------------------------------------------------------
-- Statement 18: Record New Mod Compatibility Entry
-- Explanation: Allows a mod developer to add a compatibility test result
-- linking mod_id = 11 (Cyberpunk Graphics) to game_version_id = 6 (v2.1).
-- ----------------------------------------------------------------------------
INSERT INTO Compatibility (mod_id, game_version_id, is_compatible, tested_date)
VALUES (11, 6, 1, '2026-08-06');

-- ----------------------------------------------------------------------------
-- Statement 19: Update Existing Compatibility Status
-- Explanation: Allows a mod developer to update a previously incompatible
-- record (mod_id = 23 on game_version_id = 9) after fixing version issues.
-- ----------------------------------------------------------------------------
UPDATE Compatibility
SET is_compatible = 1,
    tested_date = '2026-08-07'
WHERE mod_id = 23
  AND game_version_id = 9;

-- ----------------------------------------------------------------------------
-- Statement 20: Mod Developer Portfolio Summary
-- Explanation: Displays each mod developer's total published mods, total
-- cumulative downloads, and average file size across their mods.
-- ----------------------------------------------------------------------------
SELECT
    u.user_id,
    u.username AS creator_username,
    COUNT(m.mod_id) AS total_mods,
    SUM(m.download_count) AS total_downloads,
    ROUND(AVG(m.file_size_mb), 2) AS avg_file_size_mb
FROM Users u
JOIN Mods m
    ON u.user_id = m.creator_id
WHERE u.role = 'creator'
GROUP BY u.user_id, u.username
ORDER BY total_downloads DESC;

-- ----------------------------------------------------------------------------
-- Statement 21: Delete a Rejected Mod
-- Explanation: Allows a mod developer to delete their rejected mod
-- (mod_id = 18, Fallout Radio) which has no dependent reviews or compatibility rows.
-- ----------------------------------------------------------------------------
DELETE FROM Mods
WHERE mod_id = 18
  AND creator_id = 4
  AND status = 'rejected';

-- ============================================================================
-- SECTION 3: COMPLEX STATEMENTS
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Statement 22: Find Users Who Never Uploaded a Mod
-- Explanation: Uses a correlated NOT EXISTS subquery to find users
-- who do not have any associated records in the Mods table.
-- ----------------------------------------------------------------------------
SELECT
    u.user_id,
    u.username,
    u.email
FROM Users u
WHERE NOT EXISTS (
    SELECT 1
    FROM Mods m
    WHERE m.creator_id = u.user_id
)
ORDER BY u.username;

-- ----------------------------------------------------------------------------
-- Statement 23: View Mod Categories Statistics
-- Explanation: Generates a report showing the total number of mods,
-- total downloads, average rating, and percentage of mods in each
-- category using CTEs, aggregation, and a subquery.
-- ----------------------------------------------------------------------------
WITH ModRatings AS (
    SELECT
        mod_id,
        AVG(rating) AS average_rating
    FROM Reviews
    GROUP BY mod_id
),
CategoryStats AS (
    SELECT
        m.category,
        COUNT(m.mod_id) AS total_mods,
        COALESCE(SUM(m.download_count), 0) AS total_downloads,
        ROUND(AVG(mr.average_rating), 2) AS average_rating
    FROM Mods m
    LEFT JOIN ModRatings mr
        ON m.mod_id = mr.mod_id
    GROUP BY m.category
)
SELECT
    category,
    total_mods,
    total_downloads,
    average_rating,
    ROUND(
        100.0 * total_mods /
        NULLIF((SELECT COUNT(*) FROM Mods), 0),
        2
    ) AS percentage_of_mods
FROM CategoryStats
ORDER BY total_mods DESC, category ASC;

-- ----------------------------------------------------------------------------
-- Statement 24: Multi-Criteria Gamer Mod Search With Compatibility and Ratings
-- Explanation: Finds approved mods compatible with the latest game version.
-- Displays the game, version, mod, creator, category, downloads,
-- average rating, and total reviews.
-- ----------------------------------------------------------------------------

SELECT
    g.title AS game_title,
    gv.version_number AS compatible_version,
    m.mod_id,
    m.title AS mod_title,
    m.category,
    u.username AS creator_username,
    m.download_count,
    COALESCE(ROUND(AVG(r.rating), 2), 0) AS average_rating,
    COUNT(DISTINCT r.review_id) AS total_reviews
FROM Mods m
JOIN Games g
    ON m.game_id = g.game_id
JOIN Users u
    ON m.creator_id = u.user_id
JOIN Compatibility c
    ON m.mod_id = c.mod_id
JOIN Game_Versions gv
    ON c.game_version_id = gv.game_version_id
LEFT JOIN Reviews r
    ON m.mod_id = r.mod_id
WHERE m.status = 'approved'
    AND c.is_compatible = 1
    AND gv.game_id = m.game_id
    AND gv.release_date = (
        SELECT MAX(gv2.release_date)
        FROM Game_Versions gv2
        WHERE gv2.game_id = g.game_id
    )
GROUP BY
    g.title,
    gv.version_number,
    m.mod_id,
    m.title,
    m.category,
    u.username,
    m.download_count
ORDER BY
    g.title ASC,
    average_rating DESC,
    m.download_count DESC;

-- ----------------------------------------------------------------------------
-- Statement 25: Top-Rated Mods Above Platform Average Rating
-- Explanation: Uses a nested scalar subquery in the HAVING clause to identify
-- approved mods whose average rating exceeds the overall platform average.
-- ----------------------------------------------------------------------------
SELECT
    m.mod_id,
    m.title AS mod_title,
    g.title AS game_title,
    ROUND(AVG(r.rating), 2) AS mod_avg_rating,
    COUNT(r.review_id) AS review_count
FROM Mods m
JOIN Games g
    ON m.game_id = g.game_id
JOIN Reviews r
    ON m.mod_id = r.mod_id
WHERE m.status = 'approved'
GROUP BY m.mod_id, m.title, g.title
HAVING AVG(r.rating) > (
    SELECT AVG(rating)
    FROM Reviews
)
ORDER BY mod_avg_rating DESC, review_count DESC;

-- ----------------------------------------------------------------------------
-- Statement 26: Mods Missing Compatibility Verification for Latest Game Version
-- Explanation: Uses a correlated subquery to find approved mods that have not
-- yet been tested against the most recent release_date version of their game.
-- ----------------------------------------------------------------------------
SELECT
    m.mod_id,
    m.title AS mod_title,
    g.title AS game_title,
    u.username AS creator_username,
    gv.version_number AS latest_game_version
FROM Mods m
JOIN Games g
    ON m.game_id = g.game_id
JOIN Users u
    ON m.creator_id = u.user_id
JOIN Game_Versions gv
    ON g.game_id = gv.game_id
WHERE m.status = 'approved'
  AND gv.release_date = (
      SELECT MAX(gv2.release_date)
      FROM Game_Versions gv2
      WHERE gv2.game_id = g.game_id
  )
  AND NOT EXISTS (
      SELECT 1
      FROM Compatibility c
      WHERE c.mod_id = m.mod_id
        AND c.game_version_id = gv.game_version_id
  )
ORDER BY g.title ASC, m.title ASC;

-- ----------------------------------------------------------------------------
-- Statement 27: Gamer Activity and Review Engagement Leaderboard
-- Explanation: Aggregates review activity per gamer using LEFT JOIN and CASE
-- expressions to classify positive (4-5 star) vs critical (1-3 star) reviews.
-- ----------------------------------------------------------------------------
SELECT
    u.user_id,
    u.username,
    COUNT(r.review_id) AS reviews_written,
    COALESCE(ROUND(AVG(r.rating), 2), 0) AS avg_rating_given,
    SUM(CASE WHEN r.rating >= 4 THEN 1 ELSE 0 END) AS positive_reviews,
    SUM(CASE WHEN r.rating <= 3 THEN 1 ELSE 0 END) AS critical_reviews
FROM Users u
LEFT JOIN Reviews r
    ON u.user_id = r.user_id
WHERE u.role = 'user'
GROUP BY u.user_id, u.username
ORDER BY reviews_written DESC, u.username ASC;

-- ----------------------------------------------------------------------------
-- Statement 28: Mod Developer Performance Dashboard With Ranking
-- Explanation: Uses CTEs and a window function (RANK) to evaluate each
-- creator's approved mods, total downloads, and weighted rating performance.
-- ----------------------------------------------------------------------------
WITH CreatorMods AS (
    SELECT
        u.user_id,
        u.username,
        COUNT(m.mod_id) AS approved_mods,
        COALESCE(SUM(m.download_count), 0) AS total_downloads
    FROM Users u
    JOIN Mods m
        ON u.user_id = m.creator_id
    WHERE u.role = 'creator'
      AND m.status = 'approved'
    GROUP BY u.user_id, u.username
),
CreatorRatings AS (
    SELECT
        m.creator_id,
        ROUND(AVG(r.rating), 2) AS avg_creator_rating,
        COUNT(r.review_id) AS total_reviews_received
    FROM Mods m
    JOIN Reviews r
        ON m.mod_id = r.mod_id
    WHERE m.status = 'approved'
    GROUP BY m.creator_id
)
SELECT
    cm.user_id,
    cm.username,
    cm.approved_mods,
    cm.total_downloads,
    COALESCE(cr.avg_creator_rating, 0) AS avg_creator_rating,
    COALESCE(cr.total_reviews_received, 0) AS total_reviews_received,
    RANK() OVER (ORDER BY cm.total_downloads DESC) AS download_rank
FROM CreatorMods cm
LEFT JOIN CreatorRatings cr
    ON cm.user_id = cr.creator_id
ORDER BY download_rank ASC;

-- ----------------------------------------------------------------------------
-- Statement 29: Game Compatibility Coverage Report
-- Explanation: Reports the total game versions, compatible
-- mod-version pairings, and incompatible mod-version pairings
-- for each game.
-- ----------------------------------------------------------------------------

SELECT
    g.game_id,
    g.title AS game_title,
    COUNT(DISTINCT gv.game_version_id) AS total_versions,
    COUNT(DISTINCT CASE
        WHEN c.is_compatible = 1
        THEN CAST(c.mod_id AS TEXT) || ':' ||
             CAST(c.game_version_id AS TEXT)
    END) AS compatible_pairings_count,
    COUNT(DISTINCT CASE
        WHEN c.is_compatible = 0
        THEN CAST(c.mod_id AS TEXT) || ':' ||
             CAST(c.game_version_id AS TEXT)
    END) AS incompatible_pairings_count
FROM Games g
LEFT JOIN Game_Versions gv
    ON g.game_id = gv.game_id
LEFT JOIN Compatibility c
    ON gv.game_version_id = c.game_version_id
GROUP BY
    g.game_id,
    g.title
ORDER BY
    compatible_pairings_count DESC,
    g.title ASC;

-- ----------------------------------------------------------------------------
-- Statement 30: Recommended Mods for a Specific Gamer Based on Past High Ratings
-- Explanation: Recommends approved mods in the same game or category as mods
-- that gamer user_id = 8 (jamie) previously rated 4 or higher, excluding mods
-- they have already reviewed.
-- ----------------------------------------------------------------------------
SELECT DISTINCT
    m.mod_id,
    m.title AS recommended_mod,
    g.title AS game_title,
    m.category,
    m.download_count
FROM Mods m
JOIN Games g
    ON m.game_id = g.game_id
WHERE m.status = 'approved'
  AND (
      m.game_id IN (
          SELECT m2.game_id
          FROM Reviews r2
          JOIN Mods m2 ON r2.mod_id = m2.mod_id
          WHERE r2.user_id = 8 AND r2.rating >= 4
      )
      OR m.category IN (
          SELECT m3.category
          FROM Reviews r3
          JOIN Mods m3 ON r3.mod_id = m3.mod_id
          WHERE r3.user_id = 8 AND r3.rating >= 4
      )
  )
  AND m.mod_id NOT IN (
      SELECT r4.mod_id
      FROM Reviews r4
      WHERE r4.user_id = 8
  )
ORDER BY m.download_count DESC
LIMIT 10;

-- ----------------------------------------------------------------------------
-- Statement 31: Bulk Mark Old Pending Mods as Approved by Trusted Creator
-- Explanation: Uses an IN subquery to approve pending mods created by trusted
-- developers who already have at least 3 approved mods on the platform.
-- ----------------------------------------------------------------------------
UPDATE Mods
SET status = 'approved'
WHERE status = 'pending'
  AND creator_id IN (
      SELECT creator_id
      FROM Mods
      WHERE status = 'approved'
      GROUP BY creator_id
      HAVING COUNT(mod_id) >= 3
  );

-- ----------------------------------------------------------------------------
-- Statement 32: Clean Up Incompatible Records for Rejected Mods
-- Explanation: Uses a subquery to delete compatibility entries associated
-- with any mod whose status has been marked as 'rejected'.
-- ----------------------------------------------------------------------------
DELETE FROM Compatibility
WHERE mod_id IN (
    SELECT mod_id
    FROM Mods
    WHERE status = 'rejected'
);