<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$alignment = stream_get_line(STDIN, 7 + 1, "\n");
fscanf(STDIN, "%d",
    $N
);
$texts = array();
for ($i = 0; $i < $N; $i++)
{
    $text = stream_get_line(STDIN, 256 + 1, "\n");
    array_push($texts, $text);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$max_width = 0;
foreach ($texts as $text) {
    if (strlen($text) > $max_width) {
        $max_width = strlen($text);
    }
}

$results = array();
switch ($alignment) {
    case 'LEFT':
        foreach ($texts as $text) {
            array_push($results, $text);
        }
        break;
    case 'RIGHT':
        foreach ($texts as $text) {
            array_push($results, sprintf('%'.$max_width.'s', $text));
        }
        break;
    case 'CENTER':
        foreach ($texts as $text) {
            array_push($results, str_repeat(' ', ($max_width - strlen($text)) / 2).$text);
        }
        break;
    case 'JUSTIFY':
        foreach ($texts as $text) {
            if (strlen($text) === $max_width) {
                array_push($results, $text);
                continue;
            }

            $words = explode(' ', $text);
            $space_size = $max_width - strlen(str_replace(' ', '', $text));
            $each_space_size = $space_size / (count($words) - 1);
            $space_sizes = array();
            foreach (range(1, count($words) - 1) as $i) {
                array_push($space_sizes, floor($each_space_size * $i) - floor($each_space_size * ($i - 1)));
            }

            $result = '';
            for ($i = 0; $i < count($words); $i++) {
                $result .= $words[$i];
                if (isset($space_sizes[$i])) {
                    $result .= str_repeat(' ', intval($space_sizes[$i]));
                }
            }

            array_push($results, $result);
        }
        break;
}

// echo("answer\n");
foreach ($results as $result) {
    echo $result."\n";
}

?>
