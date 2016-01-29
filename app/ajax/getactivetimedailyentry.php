<?php

require ('../class/class.Log.php');
include ('../class/class.ErrorLog.php');
include ('../class/class.AccessLog.php');

//
// get date time for this transaction
//
$datetime = date("Y-m-d H:i:s");

$clientid = $_POST["clientid"];
$projectid = $_POST["projectid"];
$entrydate = $_POST["entrydate"];

// create time stamp versions for select
$entrydateTS = "";
if ($entrydate != "")
{
	$entrydateTS = date("Y-m-d H:i:s", strtotime($entrydate));

}

//
// messaging
//
$returnArrayLog = new AccessLog("logs/");
// $returnArrayLog->writeLog("Get time entry daily started" );

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
	$log->writeLog("DB error: $dberr - Error mysql connect. Unable to get time entry daily project list.");

	$rv = "";
	exit($rv);
}

if (!mysql_select_db($DBschema, $dbConn)) 
{
	$log = new ErrorLog("logs/");
	$dberr = mysql_error();
	$log->writeLog("DB error: $dberr - Error selecting db Unable to get time entry daily project list.");

	$rv = "";
	exit($rv);
}

//---------------------------------------------------------------
// get project information using information passed. 
//---------------------------------------------------------------
$sql = "SELECT 
	PDT.id as projectdailytimeid, 
	projectid,enterdate,
	DATE_FORMAT(starttime,'%h %i %p') AS fstarttime, 
	DATE_FORMAT(starttime,'%m-%d-%Y') as fstartdate,	
	PT.name as projectname,
	DATE_FORMAT(stoptime,'%h %i %p') as fstoptime,
	DATE_FORMAT(stoptime,'%m-%d-%Y') as fstopdate,
	FORMAT(timeinterval,2) as finterval,
	intervaldescription
	FROM projectdailytimetbl PDT 
	LEFT JOIN projecttbl PT ON PT.id = PDT.projectid
	WHERE PDT.projectid = $projectid 
	AND (invoiceid IS NULL OR invoiceid = '') ";

	if ($entrydateTS != "")
	{
		$sql = $sql . " AND enterdate = '$entrydateTS' ";
	}

	$sql = $sql . " ORDER BY starttime ASC ";

$sql_result = @mysql_query($sql, $dbConn);
if (!$sql_result)
{
	$log = new ErrorLog("logs/");
	$sqlerr = mysql_error();
	$log->writeLog("SQL error: $sqlerr - Error doing get time entry daily project list select");
	$log->writeLog("SQL: $sql");

	$rv = "";
	exit($rv);
}

$count = mysql_num_rows($sql_result);
if ($count > 0)
{
	$rows = array();
	while($row = mysql_fetch_assoc($sql_result)) {
	    $results[] = $row;
	}
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
if ($count > 0)
{
	exit(json_encode($results));
}
?>
