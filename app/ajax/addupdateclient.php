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
// if clientid = 0 insert else update
//---------------------------------------------------------------

$sql = "";

if ($clientid == 0)
{
	//--------------------------------------
	// we are an add
	// first add to address table 
	// then get address id
	// then add to client table
	//--------------------------------------
	$sql = "INSERT INTO addresstbl
		(address1, address2, city, state, zip)
		VALUES
		( '$clientaddress1', '$clientaddress2', '$clientcity', '$clientstate', '$clientzip' );
		";

	$sql_result = @mysql_query($sql, $dbConn);
	if (!$sql_result)
	{
		$log = new ErrorLog("logs/");
		$sqlerr = mysql_error();
		$log->writeLog("SQL error: $sqlerr - Error doing insert address for add/update client details");
		$log->writeLog("SQL: $sql");

		$rv = "";
		exit($rv);
	}

	$clientaddressid = mysql_insert_id();

	$sql = "INSERT INTO clienttbl
		(name, addressid, status, rate)
		VALUES
		( '$clientname', '$addressid', '$clientstatus', '$clientrate');
		";

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

	$clientid = mysql_insert_id();
}
else
{
	//--------------------------------------
	// we are an update
	// first update to client table 
	// then get address id
	// then update to address table
	//--------------------------------------
	$sql = "UPDATE clienttbl
			SET name = '$clientname', 
				status = '$clientstatus', 
				rate = '$clientrate'
			WHERE id = '$clientid'
			";

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
	
	// now get address id for this client
	$sql = "SELECT addressid FROM clienttbl WHERE id = '$clientid'";

	$sql_result = @mysql_query($sql, $dbConn);
	if (!$sql_result)
	{
		$log = new ErrorLog("logs/");
		$sqlerr = mysql_error();
		$log->writeLog("SQL error: $sqlerr - Error doing SELECT to get addressid from client for add/update client details");
		$log->writeLog("SQL: $sql");

		$rv = "";
		exit($rv);
	}	

	$results = mysql_fetch_assoc($sql_result);
	$clientaddressid = $results["addressid"];

	// now update address table
	$sql = "UPDATE addresstbl 
			SET address1 = '$clientaddress1', 
				address2 = '$clientaddress2',
				city = '$clientcity',
				state = '$clientstate',
				zip = '$clientzip'
			WHERE id = '$clientaddressid'
		";

	$sql_result = @mysql_query($sql, $dbConn);
	if (!$sql_result)
	{
		$log = new ErrorLog("logs/");
		$sqlerr = mysql_error();
		$log->writeLog("SQL error: $sqlerr - Error doing update address for add/update client details");
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
if ($clientid > 0)
{
	exit($clientid);
}
?>
