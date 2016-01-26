<?php

require ('../class/class.Log.php');
include ('../class/class.ErrorLog.php');
include ('../class/class.AccessLog.php');

//
// get date time for this transaction
//
$datetime = date("Y-m-d H:i:s");

$projectid = $_POST["projectid"];

//
// messaging
//
$returnArrayLog = new AccessLog("logs/");
// $returnArrayLog->writeLog("Client List request started" );

//------------------------------------------------------
// get admin user info
//------------------------------------------------------
// open connection to host
$DBhost = "localhost";
$DBschema = "selfemployment";
$DBuser = "tarryc";
$DBpassword = "tarryc";

//
// connect to db
//
$dbConn = @mysql_connect($DBhost, $DBuser, $DBpassword);
if (!$dbConn) 
{
	$log = new ErrorLog("logs/");
	$dberr = mysql_error();
	$log->writeLog("DB error: $dberr - Error mysql connect. Unable to get client project list.");

	$rv = "";
	exit($rv);
}

if (!mysql_select_db($DBschema, $dbConn)) 
{
	$log = new ErrorLog("logs/");
	$dberr = mysql_error();
	$log->writeLog("DB error: $dberr - Error selecting db Unable to get client project list.");

	$rv = "";
	exit($rv);
}

//---------------------------------------------------------------
// get patient information using information passed. limit 5 
//---------------------------------------------------------------

$sql = "SELECT P.id as projectid, 
P.clientid as clientid, 
P.name as projectname,
C.name as contactname,
deskphone as contactdeskphone,
mobilephone as contactmobilephone,
email as contactemail
FROM projecttbl P
LEFT JOIN contactstbl C ON C.id = P.contactid
WHERE P.id = $projectid";

$sql_result = @mysql_query($sql, $dbConn);
if (!$sql_result)
{
	$log = new ErrorLog("logs/");
	$sqlerr = mysql_error();
	$log->writeLog("SQL error: $sqlerr - Error doing get client project list select");
	$log->writeLog("SQL: $sql");

	$rv = "";
	exit($rv);
}

$result = mysql_fetch_assoc($sql_result);

//
// close db connection
//
mysql_close($dbConn);
	
//
// logging
//
// $returnArrayLog->writeLog("Patient List request ended.");	

//
// pass back info
//
exit(json_encode($result));

?>
