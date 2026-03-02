USE crictrack;

SET @db_name = DATABASE();

SET @has_teams_user_id = (
  SELECT COUNT(*)
  FROM information_schema.COLUMNS
  WHERE TABLE_SCHEMA = @db_name AND TABLE_NAME = 'teams' AND COLUMN_NAME = 'user_id'
);
SET @sql = IF(@has_teams_user_id = 0,
  'ALTER TABLE teams ADD COLUMN user_id INT NULL',
  'SELECT 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_matches_user_id = (
  SELECT COUNT(*)
  FROM information_schema.COLUMNS
  WHERE TABLE_SCHEMA = @db_name AND TABLE_NAME = 'matches' AND COLUMN_NAME = 'user_id'
);
SET @sql = IF(@has_matches_user_id = 0,
  'ALTER TABLE matches ADD COLUMN user_id INT NULL',
  'SELECT 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

UPDATE teams
SET user_id = (
  SELECT id FROM users ORDER BY id ASC LIMIT 1
)
WHERE user_id IS NULL;

UPDATE matches m
JOIN teams t ON t.id = m.team1_id
SET m.user_id = t.user_id
WHERE m.user_id IS NULL;

ALTER TABLE teams
  MODIFY COLUMN user_id INT NOT NULL;

ALTER TABLE matches
  MODIFY COLUMN user_id INT NOT NULL;

SET @has_fk_teams_user = (
  SELECT COUNT(*)
  FROM information_schema.TABLE_CONSTRAINTS
  WHERE TABLE_SCHEMA = @db_name
    AND TABLE_NAME = 'teams'
    AND CONSTRAINT_NAME = 'fk_teams_user'
);
SET @sql = IF(@has_fk_teams_user = 0,
  'ALTER TABLE teams ADD CONSTRAINT fk_teams_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE',
  'SELECT 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_uq_team_name_per_user = (
  SELECT COUNT(*)
  FROM information_schema.TABLE_CONSTRAINTS
  WHERE TABLE_SCHEMA = @db_name
    AND TABLE_NAME = 'teams'
    AND CONSTRAINT_NAME = 'uq_team_name_per_user'
);
SET @sql = IF(@has_uq_team_name_per_user = 0,
  'ALTER TABLE teams ADD CONSTRAINT uq_team_name_per_user UNIQUE (user_id, name)',
  'SELECT 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_fk_matches_user = (
  SELECT COUNT(*)
  FROM information_schema.TABLE_CONSTRAINTS
  WHERE TABLE_SCHEMA = @db_name
    AND TABLE_NAME = 'matches'
    AND CONSTRAINT_NAME = 'fk_matches_user'
);
SET @sql = IF(@has_fk_matches_user = 0,
  'ALTER TABLE matches ADD CONSTRAINT fk_matches_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE',
  'SELECT 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
