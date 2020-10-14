create database wordpress;
create user admin@localhost identified by 'admin';
grant all privileges on wordpress.* to admin@localhost;
flush privileges;
quit
