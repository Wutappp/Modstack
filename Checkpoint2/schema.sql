
PRAGMA foreign_keys = ON;

-- Table 1: Users
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    role TEXT NOT NULL,
    joined_date TEXT
);

-- Table 2: Games
CREATE TABLE Games (
    game_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    developer TEXT,
    publisher TEXT,
    release_date TEXT
);

-- Table 3: Mods
CREATE TABLE Mods (
    mod_id INTEGER PRIMARY KEY,
    game_id INTEGER NOT NULL,
    creator_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    category TEXT,
    status TEXT DEFAULT 'pending',
    created_at TEXT,
    version_tag TEXT,
    download_url TEXT,
    file_size_mb REAL,
    download_count INTEGER DEFAULT 0,
    uploaded_at TEXT,
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (creator_id) REFERENCES Users(user_id)
);

-- Table 4: Game Versions
CREATE TABLE Game_Versions (
    game_version_id INTEGER PRIMARY KEY,
    game_id INTEGER NOT NULL,
    version_number TEXT NOT NULL,
    release_date TEXT,
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

-- Table 5: Reviews
CREATE TABLE Reviews (
    review_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    mod_id INTEGER NOT NULL,
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (mod_id) REFERENCES Mods(mod_id)
);

-- Table 6: Compatibility
CREATE TABLE Compatibility (
    mod_id INTEGER NOT NULL,
    game_version_id INTEGER NOT NULL,
    is_compatible INTEGER,
    tested_date TEXT,
    PRIMARY KEY (mod_id, game_version_id),
    FOREIGN KEY (mod_id) REFERENCES Mods(mod_id),
    FOREIGN KEY (game_version_id)
        REFERENCES Game_Versions(game_version_id)
);
