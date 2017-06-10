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

$fileKey = 'uploads/'.time().'.jpg';

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
  'Key'    => $fileKey,
  'ACL'    => 'public-read'
]);

$request = $s3Client->createPresignedRequest($cmd, '+20 minutes');
$presignedUrl = (string) $request->getUri();

function makeFileUrl($key) {
  return 'https://s3.'.AWS_REGION.'.amazonaws.com/'.AWS_S3_BUCKET.'/'.$key;
}

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>S3 Upload from browser</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style media="screen">
    * { font-family: 'Roboto', sans-serif !important; }
    h3 { margin: 0; padding: 0; }
    .progress { margin: 0; }
    .alert { margin: 0; }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  </head>
  <body>
    <div class="container">
      <h2 class="page-header">S3 AJAX UPLOAD</h2>
      <div class="panel panel-default">
        <h3 class="panel-heading">Select a file</h3>
        <div class="panel-body">
          <pre><?= $presignedUrl; ?></pre>
          <input id="file" type="file" />
        </div>
        <div class="panel-footer">
          <div class="progress">
            <div id="progress" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
              <span class="sr-only">45% Complete</span>
            </div>
          </div>
          <div id="logger"></div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
    $('#file').on('change', function() {
      var file  = this.files[0]
      var $self = $(this)
      var $logger = $('#logger')
      var form  = new FormData()
      form.append('file', file)

      $.ajax({
        type: 'PUT',
        url: '<?= $presignedUrl; ?>',
        processData: false,
        data: file,
        xhr: function() {
          var $progress = $('#progress')
          var xhr = new XMLHttpRequest()
          var upload = xhr.upload || xhr

          upload.addEventListener('progress', (e) => {
            var done = e.position || e.loaded
            var total = e.totalSize || e.total
            $progress.css('width', Math.round(done / total * 100) + '%')
          })

          xhr.addEventListener('load', console.log)

          return xhr
        },
        success: function() {
          $logger.addClass('alert alert-success').text('Uploaded succesfuly!')
          $logger.append('<img class="img-responsive" src="<?= makeFileUrl($fileKey); ?>" />')
        },
        error: function(error) {
          $logger.addClass('alert alert-danger').text('Error: ' + JSON.stringify(error))
        }
      })
    })
    </script>
  </body>
</html>
