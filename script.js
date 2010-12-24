$(function() {
	var format = "dd-MM-yy";
	var params =
		{
			dateFormat: format,
			changeMonth: true,
			changeYear: true,
			prevText: "<",
			nextText: ">"
		};

	var date1 =	$("#date1").datepicker(params);
	var date2 =	$("#date2").datepicker(params);
});