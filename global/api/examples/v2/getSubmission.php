<?php
require_once("../examples-config.php");
require_once($path_to_api_v2);
?><!doctype html>
<html>
<head>
</head>
<body>

<h4>Documentation</h4>

See: <a href="https://docs.forms.cloudservetechcentral.com/api/v2/getSubmission/" target="_blank">https://docs.forms.cloudservetechcentral.com/api/v2/getSubmission/</a>

<hr size="1" />

<?php

$api = new FormTools\API();

$form_id = 1;
$view_id = 1;

$submission = $api->getSubmission($form_id, $view_id);
print_r($submission);

?>

</body>
</html>
