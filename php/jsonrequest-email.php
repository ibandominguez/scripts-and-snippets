<?php

header('Content-Type: application/json');

$input   = file_get_contents('php://input');
$params  = (object) json_decode($input, true);

$to      = '<valid-email>';
$subect  = '<the-subject>';

if (isset($params->email) && filter_var($params->email, FILTER_VALIDATE_EMAIL)):
  $from    = $params->email;
  $headers = "From: $from\r\nReply-To: $from\r\nX-Mailer: PHP/" . phpversion();
  $status  = mail($to, $subect, $input, $headers);

  return die(json_encode(array('status' => $status)));
else:
  header('Bad Request', true, 400);
  return die(json_encode(array('error' => 'A valid email is required')));
endif;
