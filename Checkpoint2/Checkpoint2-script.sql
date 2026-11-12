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
-- 1. No modifications made to the Checkpoint 1 schema.
--    (Confirm this before submission.)
-- ============================================================================

-- ============================================================================
-- MEMBER CONTRIBUTIONS SUMMARY (GROUPED AT THE TOP)
-- ============================================================================
-- Replace percentages with actual contributions.
-- Each statement must total 100%.

-- SECTION 1: SIMPLE STATEMENTS
-- Statement 01: Kevin Wu: XX%, Alizeh Jahan: XX%
-- Statement 02: Kevin Wu: XX%, Alizeh Jahan: XX%
-- Statement 03: Kevin Wu: XX%, Alizeh Jahan: XX%
-- Statement 04: Kevin Wu: XX%, Alizeh Jahan: XX%
-- Statement 05: Kevin Wu: XX%, Alizeh Jahan: XX%

-- SECTION 2: INTERMEDIATE STATEMENTS
-- Statement 11: Kevin Wu: XX%, Alizeh Jahan: XX%
-- Statement 12: Kevin Wu: XX%, Alizeh Jahan: XX%
-- Statement 13: Kevin Wu: XX%, Alizeh Jahan: XX%
-- Statement 14: Kevin Wu: XX%, Alizeh Jahan: XX%
-- Statement 15: Kevin Wu: XX%, Alizeh Jahan: XX%
-- Statement 16: Kevin Wu: XX%, Alizeh Jahan: XX%

-- SECTION 3: COMPLEX STATEMENTS
-- Statement 22: Kevin Wu: XX%, Alizeh Jahan: XX%

-- Add all remaining team statements (01-32)
-- to the contribution summary.

-- ============================================================================
-- DATABASE SETTINGS
-- ============================================================================

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

-- Remaining simple statements: 06-10

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

-- Remaining intermediate statements: 13-21

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

-- Remaining complex statements: 23-32
