<?php
$dbhost = "XXXXXX";		//remote mySQL server
$dbname = "XXXXXX";			//database name
$dbuser = "XXXXXX";			//db user
$dbpass	= "XXXXXX";		//db pass

$con = mysql_connect($dbhost, $dbuser, $dbpass) or die('Error connecting to the mysql server: '.mysql_error());

$db = mysql_select_db($dbname, $con) or die('Error :'.mysql_error());
?>