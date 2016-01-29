<?php

require ('../class/class.Log.php');
include ('../class/class.ErrorLog.php');
include ('../class/class.AccessLog.php');

//
// get date time for this transaction
//
$datetime = date("Y-m-d H:i:s");

//------------------------------------------------------
// get client data 
//------------------------------------------------------
$clientid = $_POST["clientid"];
$clientname = $_POST["clientname"];
$clientaddress1 = $_POST["clientaddress1"];
$clientaddress2 = $_POST["clientaddress2"];
$clientcity = $_POST["clientcity"];
$clientstate = $_POST["clientstate"];
$clientzip = $_POST["clientzip"];
$clientstatus = $_POST["clientstatus"];
$clientrate = $_POST["clientrate"];

//
// messaging
//
$returnArrayLog = new AccessLog("logs/");
// $returnArrayLog->writeLog("client details request started" );

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
	$log->writeLog("DB error: $dberr - Error mysql connect. Unable to add/update client details.");

	$rv = "";
	exit($rv);
}

if (!mysql_select_db($DBschema, $dbConn)) 
{
	$log = new ErrorLog("logs/");
	$dberr = mysql_error();
	$log->writeLog("DB error: $dberr - Error selecting db Unable to add/update client details.");

	$rv = "";
	exit($rv);
}

//---------------------------------------------------------------
// add or update patient information using information passed. 
// if clientid = null insert else update
//---------------------------------------------------------------

$sql = "";

if ($clientid == "")
{
	//--------------------------------------
	// we are an add
	//--------------------------------------
	$sql = "INSERT INTO clienttbl
		( name, 
		  address1, 
		  address2, 
		  city, 
		  state, 
		  zip, 
		  status, 
		  rate)
		VALUES
		( '$clientname', 
		  '$clientaddress1', 
		  '$clientaddress2', 
		  '$clientcity', 
		  '$clientstate', 
		  '$clientzip',  
		  '$clientstatus', 
		  '$clientrate')";

		// print $sql;
		// exit();

	$sql_result = @mysql_query($sql, $dbConn);
	if (!$sql_result)
	{
		$log = new ErrorLog("logs/");
		$sqlerr = mysql_error();
		$log->writeLog("SQL error: $sqlerr - Error doing insert client for add/update client details");
		$log->writeLog("SQL: $sql");

		$rv = "";
		exit($rv);
	}	

	$clientid = mysql_insert_id($dbConn);
}
else
{
	//--------------------------------------
	// we are an update
	//--------------------------------------
	$sql = "UPDATE clienttbl
			SET name = '$clientname', 
			address1 = '$clientaddress1', 
			address2 = '$clientaddress2',
			city = '$clientcity',
			state = '$clientstate',
			zip = '$clientzip',
			status = '$clientstatus', 
			rate = '$clientrate'
			WHERE id = '$clientid'
			";

			// print $sql;

	$sql_result = @mysql_query($sql, $dbConn);
	if (!$sql_result)
	{
		$log = new ErrorLog("logs/");
		$sqlerr = mysql_error();
		$log->writeLog("SQL error: $sqlerr - Error doing update client for add/update client details");
		$log->writeLog("SQL: $sql");

		$rv = "";
		exit($rv);
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
print $clientid;
?>
