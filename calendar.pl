#!/usr/bin/perl
use strict;
use warnings;
use DateTime;
use DateTime::Format::Strptime;

my $format = new DateTime::Format::Strptime
(
	pattern => '%d-%B-%Y'
	#,
	#locale => 'en_AU'
);

my $d1 = $format->parse_datetime(request.get('date1', ''));

my $d2 = $format->parse_datetime(request.get('date2', ''));

my $d = $d2 - $d1;
#$dt->delta_md( $datetime )
#$dt->delta_days( $datetime )

print <<HERE
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
		<script type="text/javascript" src="http://yandex.st/jquery/1.4.2/jquery.min.js"></script>
		<script type="text/javascript" src="http://yandex.st/jquery-ui/1.8.2/jquery-ui.js"></script>
		<script type="text/javascript" src="script.js"></script>
		<title>Calendar</title>
	</head>
	<body>
		<form action="calendar.pl" method="GET">
		<table>
			<tr>
				<td><input type="text" id="date1" name="date1" /></td>
				<td><input type="text" id="date2" name="date2" /></td>
				<td><input type="submit" value="Count interval!" name="submit" /></td>
			</tr>
			<tr colspan="3">
				<td id="output">%s</td>
			</tr>
		</table>
		</form>
	</body>
<html>
HERE

