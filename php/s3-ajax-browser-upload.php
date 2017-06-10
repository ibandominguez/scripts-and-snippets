<?php

/**
 * Keep in mind that this script uses
 * the aws php sdk
 * see the componer.json file or add it using
 * composer require aws/aws-sdk-php
 *
 * more info about componer: https://getcomposer.org/
 * more info about aws-sdk: https://github.com/aws/aws-sdk-php
 */
require(__DIR__.'/vendor/autoload.php');

// Edit your defails bellow
// make sure you get the region right
define('AWS_REGION', '<your_region>');
define('AWS_S3_BUCKET', '<your_bucket>');
define('AWS_ACCESS_KEY', '<your_key>');
define('AWS_SECRET_KEY', '<your_secret>');
define('OBJECT_KEY', '<desired_object_key>');

$s3Client = new Aws\S3\S3Client([
  'region'  => AWS_REGION,
  'version' => 'latest',
  'credentials' => [
    'key'    => AWS_ACCESS_KEY,
    'secret' => AWS_SECRET_KEY
  ]
]);

$cmd = $s3Client->getCommand('putObject', [
  'Bucket' => AWS_S3_BUCKET,
  'Key'    => OBJECT_KEY,
  'ACL'    => 'public-read'
]);

$request = $s3Client->createPresignedRequest($cmd, '+20 minutes');
$presignedUrl = (string) $request->getUri();

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>S3 Upload from browser</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  </head>
  <body>
    <div class="container">
      <h2 class="page-header">S3 Upload</h2>
      <pre><?= $presignedUrl; ?></pre>
      <input type="file" onchange="upload(this.files[0])" />
    </div>

    <script type="text/javascript">
    var upload = function(file) {
      var data = new FormData()
      data.append(file)

      $.ajax({
        type: 'PUT',
        url: '<?= $presignedUrl; ?>',
        processData: false,
        data: file,
        xhr: function() {
          var xhr = new XMLHttpRequest()
          var upload = xhr.upload || xhr

          upload.addEventListener('progress', (e) => {
            var done = e.position || e.loaded
            var total = e.totalSize || e.total
            console.log(Math.round(done / total * 100))
          })

          xhr.addEventListener('load', console.log)

          return xhr
        },
        success: console.log,
        error: console.log
      })
    }
    </script>
  </body>
</html>
