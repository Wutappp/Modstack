-- QUERY 1: View all registered users

SELECT user_id, username, email, role, joined_date
FROM Users
ORDER BY joined_date DESC;

-- QUERY 2: View all pending mods

SELECT mod_id, title, creator_id, status, created_at
FROM Mods
WHERE status = 'pending'
ORDER BY created_at ASC;

-- QUERY 3: Approve a pending mod

UPDATE Mods
SET status = 'approved'
WHERE mod_id = 1
  AND status = 'pending';

-- QUERY 4: Users with more than 2 mods

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

-- QUERY 5: Mods with average rating below 3

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

-- QUERY 6: Reviews for a specific game

SELECT
    g.title AS game_title,
    m.title AS mod_title,
    u.username,
    r.rating,
    r.comment,
    r.review_date
FROM Reviews r
JOIN Users u
    ON r.user_id = u.user_id
JOIN Mods m
    ON r.mod_id = m.mod_id
JOIN Games g
    ON m.game_id = g.game_id
WHERE g.game_id = 1
ORDER BY r.review_date DESC;

-- QUERY 7: Mod status report per game

SELECT
    g.game_id,
    g.title,
    COUNT(CASE
        WHEN m.status = 'approved' THEN 1
    END) AS approved_mods,
    COUNT(CASE
        WHEN m.status = 'rejected' THEN 1
    END) AS rejected_mods,
    COUNT(CASE
        WHEN m.status = 'pending' THEN 1
    END) AS pending_mods
FROM Games g
LEFT JOIN Mods m
    ON g.game_id = m.game_id
GROUP BY g.game_id, g.title
ORDER BY g.title;

-- QUERY 8: Top 5 most active mod creators
SELECT
    u.user_id,
    u.username,
    COUNT(m.mod_id) AS total_mods
FROM Users u
JOIN Mods m
    ON u.user_id = m.creator_id
GROUP BY u.user_id, u.username
ORDER BY total_mods DESC, u.username ASC
LIMIT 5;

-- QUERY 9: Users who never uploaded a mod
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

-- QUERY 10: Games with more than 3 pending mods
SELECT
    g.game_id,
    g.title,
    COUNT(m.mod_id) AS pending_mods
FROM Games g
JOIN Mods m
    ON g.game_id = m.game_id
WHERE m.status = 'pending'
GROUP BY g.game_id, g.title
HAVING COUNT(m.mod_id) > 3
ORDER BY pending_mods DESC;

-- QUERY 11: Delete a selected review
DELETE FROM Reviews
WHERE review_id = 5;

-- QUERY 12: Reject a selected pending mod

UPDATE Mods
SET status = 'rejected'
WHERE mod_id = 2
  AND status = 'pending';
