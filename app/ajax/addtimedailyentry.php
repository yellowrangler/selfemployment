<?php

require ('../class/class.Log.php');
include ('../class/class.ErrorLog.php');
include ('../class/class.AccessLog.php');

//
// get date time for this transaction
//
$datetime = date("Y-m-d H:i:s");

// print_r($_POST);
// die();

// get post values
$clientid = $_POST["clientid"];
$projectid = $_POST["projectid"];
$entrydate = $_POST["entrydate"];
$starttime = $_POST["starttime"];
$stoptime = $_POST["stoptime"];
$interval = $_POST["interval"];
$comment = $_POST["comment"];

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
	$log->writeLog("DB error: $dberr - Error mysql connect. Unable to add daily time entry.");

	$rv = "";
	exit($rv);
}

if (!mysql_select_db($DBschema, $dbConn)) 
{
	$log = new ErrorLog("logs/");
	$dberr = mysql_error();
	$log->writeLog("DB error: $dberr - Error selecting db Unable to add daily time entry.");

	$rv = "";
	exit($rv);
}

// create time stamp versions for insert to mysql
$entrydateTS = date("Y-m-d H:i:s", strtotime($entrydate));
$starttimeTS = date("Y-m-d H:i:s", strtotime($entrydate." ".$starttime));
$stoptimeTS = date("Y-m-d H:i:s", strtotime($entrydate." ".$stoptime));

//---------------------------------------------------------------
// add daily time entered using information passed. 
//---------------------------------------------------------------
$sql = "INSERT INTO projectdailytimetbl (`projectid`,`enterdate`,`starttime`,`stoptime`,`timeinterval`,`intervaldescription`)";
$sql .= "VALUES ($projectid,'$entrydateTS','$starttimeTS','$stoptimeTS',$interval,'$comment')";
// print $sql;

$rv = "";
$sql_result = @mysql_query($sql, $dbConn);
if (!$sql_result)
{
	$log = new ErrorLog("logs/");
	$sqlerr = mysql_error();
	$log->writeLog("SQL error: $sqlerr - Error doing insert to add daily time");
	$log->writeLog("SQL: $sql");

	exit($rv);
}

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
exit($rv);
?>
