--Admin Queries

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


--USER QUERIES


--MOD CREATOR QUERIES