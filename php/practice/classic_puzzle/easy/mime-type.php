<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N // Number of elements which make up the association table.
);
fscanf(STDIN, "%d",
    $Q // Number Q of file names to be analyzed.
);
$exts = array();
$mts  = array();
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%s %s",
        $EXT, // file extension
        $MT // MIME type.
    );
    array_push($exts, strtolower($EXT));
    array_push($mts, $MT);
}
$fnames = array();
for ($i = 0; $i < $Q; $i++)
{
    $FNAME = stream_get_line(STDIN, 500 + 1, "\n"); // One file name per line.
    array_push($fnames, $FNAME);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$mime_types = array();
foreach ($fnames as $fname) {
    $ext = strtolower(pathinfo($fname, PATHINFO_EXTENSION));
    $index = array_search($ext, $exts);

    $mime_type = $index !== false ? $mts[$index] : 'UNKNOWN';
    array_push($mime_types, $mime_type);
}

// For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.
// echo("UNKNOWN\n");

foreach ($mime_types as $mime_type) {
    echo "${mime_type}\n";
}

?>
