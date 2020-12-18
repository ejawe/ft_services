<?php

$cfg['blowfish_secret'] = 'BSUILUSoijzidbuziefuzpazaqSVBNWCM'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! *

/**
 * List of env variables
 */
$vars = array(
    'PMA_HOST',
	'PMA_PORT',
	'PMA_USER',
	'MYSQL_ROOT_PASSWORD'
);

/**
 * Stock env variables in tab
 */
foreach ($vars as $var) {
    $env = getenv($var);
    if (!isset($_ENV[$var]) && $env !== false) {
        $_ENV[$var] = $env;
    }
}

/**
 * Only one server
 */
$i = 1;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['host'] = 'mysql';
$cfg['Servers'][$i]['AllowNoPassword'] = true; ###
$cfg['PmaAbsoluteUri'] = 'phpmyadmin-service:5000';

#sets SameSite attribute of the Set-Cookie HTTP response header
#$cfg['CookieSameSite'] = 'Strict';

#$cfg['TempDir'] = '/var/www/phpmyadmin/tmp/'; ######
/**
 * Variable definition
 */
if (!empty($_ENV['PMA_HOST']))
	$cfg['Servers'][$i]['host'] = $_ENV['PMA_HOST'];

if (!empty($_ENV['PMA_PORT']))
	$cfg['Servers'][$i]['port'] = $_ENV['PMA_PORT'];

if (!empty($_ENV['PMA_USER']))
	$cfg['Servers'][$i]['user'] = $_ENV['PMA_USER'];

if (!empty($_ENV['MYSQL_ROOT_PASSWORD']))
	$cfg['Servers'][$i]['password'] = $_ENV['MYSQL_ROOT_PASSWORD'];

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

