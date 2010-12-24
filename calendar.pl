#!/strawberry-perl/perl/bin/perl
use strict;
use warnings;
use Class::Date;
use CGI;
use Switch;

sub getMonth
{
	switch ($_[0])
	{
		case "January"		{ return "1" }
		case "February"		{ return "2" }
		case "March"		{ return "3" }
		case "April"		{ return "4" }
		case "May"			{ return "5" }
		case "June"			{ return "6" }
		case "July"			{ return "7" }
		case "August"		{ return "8" }
		case "September"	{ return "9" }
		case "October"		{ return "10" }
		case "November"		{ return "11" }
		case "December"		{ return "12" }
	}
}

print "\n\n";
my $q = CGI->new;
my $day, my $month, my $year;

if(defined($q->param("date1"))){($day, $month, $year) = split "-", $q->param("date1");}
my $d1 = Class::Date->new([$year, getMonth($month), $day]);
if(!defined($d1)){$d1 = Class::Date->new([2010, 01, 01]);}

if(defined($q->param("date2"))){($day, $month, $year) = split "-", $q->param("date2");}
my $d2 = Class::Date->new([$year, getMonth($month), $day]);
if(!defined($d2)){$d2 = Class::Date->new([2010, 01, 02]);}

my $days_between = ($d2 - $d1)->day;

$d1 = defined($q->param("date1"))?$q->param("date1"):"";
$d2 = defined($q->param("date2"))?$q->param("date2"):"";

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
				<td id="output" colspan="3">
					Difference: $days_between days
				</td>
			</tr>
			<tr>
				<td><input type="text" id="date1" name="date1" value="$d1"/></td>
				<td><input type="text" id="date2" name="date2" value="$d2"/></td>
				<td><input type="submit" value="Count interval!" name="submit" /></td>
			</tr>
		</table>
		</form>
	</body>
</html>
HERE
