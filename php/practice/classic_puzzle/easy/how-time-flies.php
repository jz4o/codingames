<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%s",
    $BEGIN
);
fscanf(STDIN, "%s",
    $END
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$begin_date = date_create($BEGIN);
$end_date   = date_create($END);

$begin_months = date_format($begin_date, 'Y') * 12 + date_format($begin_date, 'm');
$end_months   = date_format($end_date,   'Y') * 12 + date_format($end_date,   'm');
$year = intval(($end_months - $begin_months) / 12);
$month = ($end_months - $begin_months) % 12;
if (date_format($end_date, 'd') < date_format($begin_date, 'd')) {
    $month--;
}
$days = date_diff($end_date, $begin_date)->format('%a');

$formatted_year = '';
if ($year !== 0) {
    $formatted_year = $year.' year';
}
if ($year > 1) {
    $formatted_year .= 's';
}

$formatted_month = '';
if ($month !== 0) {
    $formatted_month = $month.' month';
}
if ($month > 1) {
    $formatted_month .= 's';
}

$formatted_days = 'total '.$days.' days';

// echo("YY year[s], MM month[s], total NN days\n");
$result = array_filter(array($formatted_year, $formatted_month, $formatted_days));
echo implode(', ', $result);

?>
