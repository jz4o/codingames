<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d", $n);
fscanf(STDIN, "%s", $packet);

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

$packets = array();
while (strlen($packet) > 0) {
    $instruction_id = substr($packet, 0, 3);
    $packet_length = substr($packet, 3, 4);
    $decimal_packet_length = bindec($packet_length);
    $packet_info = substr($packet, 7, $decimal_packet_length);
    $packet = substr($packet, 7 + $decimal_packet_length) ?: '';

    array_push($packets, new Packet($instruction_id, $packet_length, $packet_info));
}

$result = '';
foreach ($packets as $pack) {
    if ($pack->get_instruction_id() != '101') {
        continue;
    }

    $result .= '001' . $pack->get_packet_length() . $pack->get_packet_info();
}

echo($result);


class Packet {
    private $instruction_id;
    private $packet_length;
    private $packet_info;

    function __construct($instruction_id, $packet_length, $packet_info) {
        $this->instruction_id = $instruction_id;
        $this->packet_length = $packet_length;
        $this->packet_info = $packet_info;
    }

    function get_instruction_id() {
        return $this->instruction_id;
    }

    function get_packet_length() {
        return $this->packet_length;
    }

    function get_packet_info() {
        return $this->packet_info;
    }
}

?>
