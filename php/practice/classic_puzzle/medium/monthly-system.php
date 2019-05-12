<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$Ms = array();
for ($i = 0; $i < $N; $i++)
{
    $M = stream_get_line(STDIN, 64 + 1, "\n");
    array_push($Ms, $M);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$sum = 0;
for ($i = 0; $i < $N; $i++) {
    $sum += MonthBaseNumber::to_i($Ms[$i]);
}
$result = MonthBaseNumber::from_i($sum);

// echo("answer\n");
echo $result;

class MonthBaseNumber {
    private static $MONTH_LENGTH = 3;
    private static $MONTHS = array(
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    );
    private static $NUMS = array(
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b'
    );

    private static function base($digit) {
        return intval(pow(count(self::$NUMS), $digit));
    }

    public static function to_i($month_base_text) {
        $result = 0;

        $digits = strlen($month_base_text) / self::$MONTH_LENGTH;

        preg_match_all("/.{".self::$MONTH_LENGTH."}/", $month_base_text, $months);
        $months = $months[0];

        for ($i = $digits - 1; $i >= 0; $i--) {
            $month = array_shift($months);
            $month_index = array_search($month, self::$MONTHS);
            $result += base_convert(self::$NUMS[$month_index], count(self::$NUMS), 10) * self::base($i);
        }

        return $result;
    }

    public static function from_i($num) {
        $result = '';

        $base_num = base_convert($num, 10, count(self::$NUMS));
        for ($i = 0; $i < strlen($base_num); $i++) {
            $c = $base_num[$i];
            $result .= self::$MONTHS[array_search($c, self::$NUMS)];
        }

        return $result;
    }
}

?>
