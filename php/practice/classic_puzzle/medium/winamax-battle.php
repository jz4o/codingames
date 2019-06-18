<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

define('CARD_LANKS', array('2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'));

$deck1 = array();
$deck2 = array();
fscanf(STDIN, "%d",
    $n // the number of cards for player 1
);
for ($i = 0; $i < $n; $i++)
{
    fscanf(STDIN, "%s",
        $cardp1 // the n cards of player 1
    );
    $card = substr($cardp1, 0, strlen($cardp1) - 1);
    $card_lank = array_search($card, CARD_LANKS);
    array_push($deck1, $card_lank);
}
fscanf(STDIN, "%d",
    $m // the number of cards for player 2
);
for ($i = 0; $i < $m; $i++)
{
    fscanf(STDIN, "%s",
        $cardp2 // the m cards of player 2
    );
    $card = substr($cardp2, 0, strlen($cardp2) - 1);
    $card_lank = array_search($card, CARD_LANKS);
    array_push($deck2, $card_lank);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

function fight($deck1, $deck2, $index) {
    if (!isset($deck1[$index]) || !isset($deck2[$index])) {
        throw new Exception("");
    }

    $card1 = $deck1[$index];
    $card2 = $deck2[$index];

    if ($card1 === $card2) {
        return fight($deck1, $deck2, $index + 4);
    }

    return array(
        'deck' => $card1 < $card2 ? 'deck2' : 'deck1',
        'index' => $index
    );
}

$result;
try {
    $turn = 0;

    while (!empty($deck1) && !empty($deck2)) {
        $turn++;

        $fight_result = fight($deck1, $deck2, 0);
        $index = $fight_result['index'];

        ${$fight_result['deck']} = array_merge(
            array_splice(${$fight_result['deck']}, $index + 1),
            array_splice($deck1, 0, $index + 1),
            array_splice($deck2, 0, $index + 1)
        );
    }

    $result = (count($deck1) < count($deck2) ? '2' : '1').' '.$turn;
} catch (Exception $e) {
    $result = 'PAT';
}

// echo("PAT\n");
echo $result;

?>
