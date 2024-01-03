CREATE TABLE IF NOT EXISTS user(
    id INTEGER PRIMARY KEY, 
    nameUser TEXT, 
);

CREATE TABLE IF NOT EXISTS pomodoro(
    id INTEGER PRIMARY KEY, 
    user_id INTEGER, 
    title TEXT, 
    FOREIGN KEY(user_id) 
    REFERENCES user(id)
);