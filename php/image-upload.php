<?php

header('Content-Type: application/json');

$file = !empty($_FILES['file']) ? $_FILES['file'] : null;
$name = $file ? $file['name'] : null;
$mime = $file ? substr($name, -4) : null;
$path = $file ? __DIR__.'/'.$name : null;

if ($file && $mime === '.jpg'):
	move_uploaded_file($file['tmp_name'], $path);
	header('HTTP/1.1 201 Created', true, 201);
	return die(json_encode(['success' => true]));
else:
	header('HTTP/1.1 400 Bad Request', true, 400);
	return die(json_encode(['error' => 'invalid file']));
endif;
