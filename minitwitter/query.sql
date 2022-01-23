DROP DATABASE mini_twitter;
use mini_twitter;
INSERT INTO User (name, handle, email, password) VALUES ("༺GRIMES༻ 🤍 小仙女","Grimezsz", "grimes@gmail.com", "base64hash");
INSERT INTO User (name, handle, email, password) VALUES ("jASON🎃👑","nythrox", "jason@gmail.com", "base64hash"); 
SELECT * FROM User;
SELECT name, handle FROM User WHERE id = 1;
INSERT INTO UserFollowsUser VALUES (2,1);
SELECT * FROM UserFollowsUser;

INSERT INTO Post (userId, text) VALUES (1, "Hey, I'm doing a Q&A tomorrow so send me your questions 🕯🗡");
INSERT INTO Post (userId, text, replyingToPostId) VALUES (2, "Yassss!!", 1);
SELECT * from Post;

INSERT INTO `Like` (userId, postId) VALUES (2,1);
SELECT * from `Like`;

SELECT COUNT(*) FROM `Like` WHERE postId = 1;

INSERT INTO Image (url) VALUES ("media/ERQFPH1UEAAsbvb");
UPDATE Image SET postId = 1 WHERE id = 1;
SELECT * FROM Image;