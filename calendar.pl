#!/strawberry-perl/perl/bin/perl
use strict;
use warnings;
use Class::Date;
use Date::Parse;
use Date::Format;
use CGI;

print "\n\n";

my $q = CGI->new;

my $d1 = Class::Date->new(str2time($q->param("date1")));
if(!defined($d1))
{
	$d1 = Class::Date->new([2010, 01, 01]);
}

my $d2 = Class::Date->new(str2time($q->param("date2")));
if(!defined$d2)
{
	$d2 = Class::Date->new([2010, 01, 02]);
}

my $days_between = (Class::Date->new($d2) - $d1)->day;

my $format = "%d-%B-%Y";
print time2str($format, $d1);
#$d2 = time2str("%d-%B-%Y", $d2);

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
