CREATE DATABASE app;
CREATE USER 'app'@'%';
SET password FOR "app"@"%" = password('password');
GRANT ALL PRIVILEGES ON app.* TO 'app'@'%' identified by 'password';
FLUSH PRIVILEGES;