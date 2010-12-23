$(function() {
	var format = "dd-MM-yy";
	var date1 =
		$("#date1").datepicker(
			{
				dateFormat: format,
				changeMonth: true,
				changeYear: true,
				prevText: "<",
				nextText: ">"
			}
		);
	var date2 =
		$("#date2").datepicker(
			{
				dateFormat: format,
				changeMonth: true,
				changeYear: true,
				prevText: "<",
				nextText: ">"
			}
		);
});