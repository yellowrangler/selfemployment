<?php

require ('../class/class.Log.php');
include ('../class/class.ErrorLog.php');
include ('../class/class.AccessLog.php');

//
// get current date
//
$date = date("m/d/Y");

//
// create invoice array and add my information 
//
$invoice = array();

$invoice["myname"] = "TARRANT CUTLER JR";
$invoice["myaddress1"] = "5 Masconomom St";
$invoice["mycity"] = "Manchester";
$invoice["mystate"] = "MA";
$invoice["zip"] = "01944";
$invoice["phone"] = "781-342-0204";
$invoice["myemail"] = "tarrant.cutler@gmail.com";

//
// get post data 
//
$invoice["clientid"] = $_POST["clientid"];







$invoice["clientname"] = DB;
$invoice["clientaddress1"] = DB;
$invoice["clientaddress2"] = DB;
$invoice["clientcity"] = DB;
$invoice["clientstate"] = DB;
$invoice["clientzip"] = DB;
$invoice["clientcontact"] = DB;
$invoice["clientcontactphone"] = DB;
$invoice["clientcontactemail"] = DB;

$trStr = "";
for ($i = 0; $i < $orderDetailNbr; $i++)
{
	$trStr .= "
	<tr style='background-color:white; color:black;'>
		<td style='text-align:center;'>06/05/2014</td>
		<td style='text-align:left;'>Fluid Surveys</td>
		<td style='text-align:left;'>Analysis and Development</td>
		<td style='text-align:center;'>1</td>
		<td style='text-align:center;'>$60.00</td>
		<td style='text-align:center;'>$60.00</td>	
	</tr>
	";
}

?>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" type="text/css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=OFL+Sorts+Mill+Goudy+TT|PT+Sans" type="text/css">
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
</head>

<!-- Vendor Libs -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 

<!-- UI Libs -->
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    window.print();
});	

</script>
<body>
<!-- above this delete if add to partial -->

<style>
.invHeader {
    border-top: 5px solid #336699;
    font-size:12px;
    font-weight: 900;
    font-family: Helvetica;
    font-variant:small-caps;
    color:#336699;
}

.invFooter {
    border-bottom: 1px solid #336699;
    height:35px;
    font-size:12px;
    font-weight: 900;
    font-family: Helvetica;
    font-variant:small-caps;
    color:#336699;
}

.invTable tr td {
    /*border-top: 5px solid #336699;*/
    font-size:10px;
    font-weight: normal;
    font-family: Helvetica, Helvetica;
    border: 1px dotted grey;
    padding:5px;
}

.invTable tr th {
    /*border-top: 5px solid #336699;*/
    font-size:10px;
    font-weight: normal;
    font-family: Helvetica, Helvetica;
    border: 1px dotted grey;
    padding:5px;
    background-color:#336699; color:white;
}
/*.invLeftfontFamily {
    font-family: Helvetica, Helvetica, Arial, sans-serif;
}*/

.btn :hover {
    cursor: pointer;
}

body {
	-webkit-print-color-adjust: exact;
}
</style>

<div class="container">

<div style="padding-top:15px;" class="row">
<div class="col-md-11">

<div class="invHeader"><?php print $invoice["myname"]; ?></div>

</div> <!-- end of col-md-11 -->
</div> <!-- end of row -->

<div style="padding-top:45px;" class="row">
<div class="col-md-11">


<table width="100%">
<tr style="width:70%;">
<td>

<div id="invAttention">
<span style="font-size:11px;font-family:Helvetica;font-weight:bold;color:maroon">Attention:</span>
<span id="invAttentionName" style="padding-left:5px;font-size:11px;font-family:Helvetica;font-weight:bold;color:maroon"><?php print $invoice["clientname"]; ?></span>
</div> <!-- end of invAttention -->

<div id="InvClient" style="padding-top:15px;line-height:90%;">
<div name="InvClient"><span id="invClientAddressBusiness" style="font-size:10px;font-family:Helvetica;font-weight:normal;color:black"><?php print $invoice["clientname"]; ?></span></div>
<div name="InvClient"><span id="invClientAddressAddr1" style="font-size:10px;font-family:Helvetica;font-weight:normal;color:black"><?php print $invoice["clientname"]; ?></span></div>
<?php 
if ($invoice["clientname"] == "")
{
	$addr2="";
} 
else
{
	$addr2 = "<div name='InvClient'><span id='invClientAddressAddr1' style='font-size:10px;font-family:Helvetica;font-weight:normal;color:black'><?php print $invoice['clientname']; ?></span></div>";
}

print $addr2;

?>

<div name="InvClient"><span id="invClientAddressCityStateZip" style="font-size:10px;font-family:Helvetica;font-weight:normal;color:black"><?php print $invoice["clientname"]; ?>, <?php print $invoice["clientname"]; ?> <?php print $invoice["clientname"]; ?></span></div>

</div> <!-- end of InvClient -->

<div name="InvDate" style="padding-top:15px;">
<span style="font-size:11px;font-family:Helvetica;font-weight:bold;color:maroon">Date:</span>
<span id="invDate" style="padding-left:5px;font-size:11px;font-family:Helvetica;font-weight:normal;color:black">06/08/2014</span>
</div> <!-- end of InvDate -->

<div name="InvNumber" style="padding-top:0px;">
<span style="font-size:11px;font-family:Helvetica;font-weight:bold;color:maroon">Invoice Number:</span>
<span id="InvNumber" style="padding-left:5px;font-size:11px;font-family:Helvetica;font-weight:normal;color:black">06082014</span>
</div> <!-- end of InvNumber -->

<div name="InvPeriod" style="padding-top:0px;">
<span style="font-size:11px;font-family:Helvetica;font-weight:bold;color:maroon">Period:</span>
<span id="InvPeriod" style="padding-left:5px;font-size:11px;font-family:Helvetica;font-weight:normal;color:black">06/02/2014-06/08/2014</span>
</div> <!-- end of InvPeriod -->

<div name="InvDetails" style="padding-top:25px;">
<table class="invTable">
<tr>
	<th style="text-align:center;">Date</th>
	<th style="text-align:center;">Project</th>
	<th style="text-align:center;">Description</th>
	<th style="text-align:center;">Hours</th>
	<th style="text-align:center;">Rate</th>
	<th style="text-align:center;">Cost</th>	
</tr>

<?php print $trStr; ?>

<tr style="background-color:lightgrey; color:black;">
	<td style="text-align:center;">06/06/2014</td>
	<td style="text-align:left;">Fluid Surveys</td>
	<td style="text-align:left;">Work with Alfred</td>
	<td style="text-align:center;">2</td>
	<td style="text-align:center;">$60.00</td>
	<td style="text-align:center;">$120.00</td>	
</tr>	
<tr style="background-color:white; color:black;">
	<td style="text-align:center;">06/08/2014</td>
	<td style="text-align:left;">Bronto</td>
	<td style="text-align:left;">Review API's</td>
	<td style="text-align:center;">2</td>
	<td style="text-align:center;">$60.00</td>
	<td style="text-align:center;">$120.00</td>	
</tr>	

<tr style="background-color:lightgrey; color:black;">
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>

<tr style="background-color:white; color:black;border-top: 2px solid #336699;">
	<td style="text-align:center;" colspan=4>&nbsp;</td>
	<td style="text-align:right;">Total</td>
	<td style="text-align:center;">$300.00</td>	
</tr>	
</table>
</div> <!-- end of InvDetails -->

<div name="InvSigniture" style="padding-top:15px;">

<div name="InvSignitureThankYou"><span id="InvSignitureThankYou" style="font-size:10px;font-family:Helvetica;font-weight:normal;color:black">Thank you for your business. It’s a pleasure to work with you on your project.</span></div>

<div style="padding-top:35px;" name="InvSignitureSincerely"><span id="InvSignitureSincerely" style="font-size:10px;font-family:Helvetica;font-weight:normal;color:black">Sincerely yours,</span></div>

<div style="padding-top:15px;padding-left:45px;" name="InvSignitureSigned"><img style="height:75px;" src="../../img/tarry-signiture.png" alt="logo"></div>

<div style="padding-top:45px;" name="InvSignitureName"><span id="InvSignitureName" style="font-size:10px;font-family:Helvetica;font-weight:normal;color:black">Tarrant Cutler Jr</span></div>

</div> <!-- end of InvSigniture -->

</td>
<td style="vertical-align:top;">

<div id="invLiteral" style="font-size:18px;font-family:arial;font-weight:lighter;color:grey">INVOIVCE</div> 

<div id="ivNbr" style="padding-top:15px; font-size:11px;font-family:Helvetica;font-weight:900;color:#336699">06082014</div> 

<div id="iveMail" style="padding-top:10px; font-size:11px;font-family:Helvetica;font-weight:normal;color:#336699">tarrant.cutler@gmail.com</div> 

<div id="invStreet" style="width:100px;padding-top:25px; font-size:11px;font-family:Helvetica;font-weight:normal;color:#336699">5 Masconomo St</div> 
<div id="invCityState" style="padding-top:0px; font-size:11px;font-family:Helvetica;font-weight:normal;color:#336699">Manchester, MA</div> 
<div id="invZip" style="padding-top:0px; font-size:11px;font-family:Helvetica;font-weight:normal;color:#336699">01944</div> 

</td>
</tr>

</table>

</div> <!-- end of col-md-12 -->
</div> <!-- end of row -->

<div class="row">
<div class="col-md-11">

<div class="invFooter">&nbsp;</div>

</div> <!-- end of col-md-11 -->
</div> <!-- end of row -->

</div> <!-- end of container -->

<!-- bellow this delete if add to partial -->

</body>
</html>