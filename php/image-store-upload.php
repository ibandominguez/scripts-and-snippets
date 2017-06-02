<?php

header('Content-Type: application/json');

const MEDIA_URL = 'http://localhost:9000/';
const ALLOWED_TYPES = array('.jpg', '.jpeg', '.png', '.gif');
const MAX_SIZE = 100000000000000;

$file = !empty($_FILES['file']) ? $_FILES['file'] : null;
$extension = $file ? strtolower(substr($file['name'], -4)) : null;
$targetFileName = md5(time().rand()).'.'.rand().'.'.time().$extension;

// Check wether the request is POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST'):
  header('HTTP/1.1 405 Method Not Allowed');
  die(json_encode(['error' => 'Method Not Allowed']));
endif;

// Check if the file has been added
if (empty($file)):
  header('HTTP/1.1 400 Bad Request');
  die(json_encode(['error' => 'A file is required']));
endif;

// check the extsion
if (!in_array($extension, ALLOWED_TYPES)):
  header('HTTP/1.1 400 Bad Request');
  die(json_encode(['error' => 'The file extension must be one of the following '.implode(', ', ALLOWED_TYPES)]));
endif;

// check wether the file size is less
// than MAX_SIZE
if ($file['size'] > MAX_SIZE):
  header('HTTP/1.1 400 Bad Request');
  die(json_encode(['error' => 'The file size must be lower thab '.MAX_SIZE]));
endif;

// if all checks passed, lets proceed to
// save the file and retrieve its location
if (move_uploaded_file($file['tmp_name'], $targetFileName)):
  header('HTTP/1.1 201 Created');
  die(json_encode(['url' => MEDIA_URL.$targetFileName]));
else:
  header('HTTP/1.1 500 Internal Server Error');
  die(json_encode(['error' => 'The file size must be lower thab '.MAX_SIZE]));
endif;
