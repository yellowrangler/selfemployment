//
// validate shipping form
//

function validateClientForm()
{
	var err = "";

	err = simpleValidation($("#clientname"),$("#alert_msg"), "Please enter required Institution Name",2,255);
	if (err) return err;

	err = simpleValidation($("#clientaddress1"),$("#alert_msg"), "Please enter required Address",2,255);
	if (err) return err;
	
	err = simpleValidation($("#clientcity"),$("#alert_msg"), "Please enter required City",2,255);
	if (err) return err;

	err = simpleValidation($("#clientstate"),$("#alert_msg"), "Please enter required State",2,2);
	if (err) return err;

	err = simpleValidation($("#clientzip"),$("#alert_msg"), "Please enter required ZIP",5,9);
	if (err) return err;

	err = simpleMoneyValidation($("#clientrate"),$("#alert_msg"), "Please enter required and valid dollars",2,10);
	if (err) return err;

	err = simpleValidation($("#clientstatus"),$("#alert_msg"), "Please enter required client status",1,10);
	if (err) return err;

	// err = simplePhoneValidation($("#phone"),$("#alert_msg"), "Please enter required Phone Number");
	// if (err) return err;

	// err = simpleValidation($("#email"),$("#alert_msg"), "Please enter required eMail address",2,255);
	// if (err) return err;

	return err;
}

function simpleValidation(obj,alert,msg,lth_min,lth_max)
{
	var test = obj.val();

	if (test.length < lth_min || test.length > lth_max )
	{
		$(alert).html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>'+msg+'</span></div>');
		obj.focus();
		var t=setTimeout(function(){closeAlert(alert)},3000);

		return 1;
	}

	return 0;
}

function simpleNumberValidation(obj,alert,msg,smallnbr)
{
	var test = obj.val();

	if (isNaN(test))
	{
		$(alert).html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>'+msg+'</span></div>')
		obj.focus();
		var t=setTimeout(function(){closeAlert(alert)},3000);

		return 1;
	}

	if (test < smallnbr)
	{
		$(alert).html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>'+msg+'</span></div>')
		obj.focus();
		var t=setTimeout(function(){closeAlert(alert)},3000);

		return 1;
	}

	return 0;
}

function simpleMoneyValidation(obj,alert,msg,smallnbr)
{
	var test = obj.val();

	if (isNaN(test))
	{
		$(alert).html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>'+msg+'</span></div>')
		obj.focus();
		var t=setTimeout(function(){closeAlert(alert)},3000);

		return 1;
	}

	var Chars = "0123456789.,$"; 
	for (var i = 0; i < test.length; i++) 
	{ 
		if (Chars.indexOf(test.charAt(i)) == -1) 
		{ 
			$(alert).html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>'+msg+'</span></div>')
			obj.focus();
			var t=setTimeout(function(){closeAlert(alert)},3000);

			return 1;
		} 
	} 

	return 0;
}

function simplePhoneValidation(obj,alert,msg)
{
	var test = obj.val();
	var err = 0;

	if (isNaN(test))
	{
		//
		// if not all number must have dashes
		//
		if (test.length != 12)
		{
			err = 1;
		}

		for (var i = 0; i < test.length; i++)
		{
			switch(i)
			{
				case 0:
				case 1:
				case 2:
				case 4:
				case 5:
				case 6:
				case 8:
				case 9:
				case 10:
				case 11:
					if (isNaN(test[i]) )
					{
						err = 1;
					}
					break;

				case 3:
				case 7:
					if (test[i] != "-")
					{
						err = 1;
					}
				break;	
			}

		}
	}
	else
	{
		if (test.length != 10)
		{
			err = 1;
		}
		else
		{
			var formattedStr = test.slice(0,3)+"-"+test.slice(3,6)+"-"+test.slice(6);
			obj.val(formattedStr);
			var t=setTimeout(function(){closeAlert(alert)},3000);
		}
	}

	if (err)
	{
		$(alert).html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>'+msg+'</span></div>')
		obj.focus();
		var t=setTimeout(function(){closeAlert(alert)},3000);

		return 1;
	}

	return 0;
}

//
// utility scripts
//
function closeAlert(alert)
{
	$(alert).html('');
	// $(alert).alert('close');
}