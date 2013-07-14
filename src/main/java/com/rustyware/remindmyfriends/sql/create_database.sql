/* 
 * /usr/local/mysql/bin/mysql -u root -p
*/
use remindmyfriends;

drop table users;

create table IF NOT EXISTS users (
         id int NOT NULL AUTO_INCREMENT ,
         name VARCHAR(100),
         emailAddress VARCHAR(100),
         primary key (id)
       );
       
insert into users ( name, emailAddress) values(  "Russ Cooper", "russell.cooper@btinternet.com");
