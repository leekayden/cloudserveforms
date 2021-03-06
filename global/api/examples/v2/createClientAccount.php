<?php
require_once("../examples-config.php");
require_once($path_to_api_v2);
?><!doctype html>
<html>
<head>
</head>
<body>

<h4>Documentation</h4>

See: <a href="https://docs.forms.cloudservetechcentral.com/api/v2/createClientAccount/" target="_blank">https://docs.forms.cloudservetechcentral.com/api/v2/createClientAccount/</a>

<hr size="1" />

<?php

$api = new FormTools\API();

$account_info = array(
    "first_name" => "Todd",
    "last_name" => "Atkins",
    "email" => "todd@gmail.com",
    "username" => "todd",
    "password" => "todd12345"
);
list($success, $info) = $api->createClientAccount($account_info);

if ($success) {
    echo "The account was created. Check your CloudserveForms interface to see the account - note: refreshing this page will create another account with the same user info.";
} else {
    echo "There was a problem creating this account: ";
    print_r($info);
}
?>

</body>
</html>
