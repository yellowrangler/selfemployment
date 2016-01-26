function simpleTimeFormat(timeIn) {
	var timeOut = "";

	if (timeIn != null)
	{
		var timeArray = timeIn.split(' ');
		timeOut = timeArray[0] + ":" + timeArray[1] + " " + timeArray[2];
	}
		
	return (timeOut);
}