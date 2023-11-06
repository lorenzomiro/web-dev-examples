<?php

function password_check($password) {

    //create a weak passwords array

    $weak_passwords = ["test","1234567","password","help","(blank)","none","empty","admin","nopassword","guest","00000000"];

    //check for weak passwords in input

    foreach($weak_passwords as $curr_password) {

        if (stripos($curr_password, $password) !== false) {

            return("Your password is bad. Please choose a stronger password.");
    
        }
    
    }

    //create an error message that will change depending on the exception

    $error_msg = "";

    //if message for short password

    if (strlen($password) < 8) {

        $error_msg = "Your password is too short. Please choose a password that's 8-25 characters.";

    }
    
    //if message for long password

    if (strlen($password) > 25) {

        $error_msg = "Your password is too long. Please choose a password that's 8-25 characters.";

    }

    //if message for no number password

    if (!preg_match("#[0-9]+#", $password) ) {

        $error_msg = "Your password is invalid. Please choose a password that contains at least one number.";

    }

    //if message for no lowercase letter password

    if (!preg_match("#[a-z]+#", $password) ) {

        $error_msg = "Your password is invalid. Please choose a password that contains at least one lowercase letter.";

    }

    //if message for no uppercase letter password

    if (!preg_match("#[A-Z]+#", $password) ) {

        $error_msg = "Your password is invalid. Please choose a password that contains at least one uppercase letter.";

    }

    //if message for no special character password

    if (!preg_match("#\W+#", $password) ) {

        $error_msg = "Your password is invalid. Please choose a password that contains at least one special character.";

    }

    //scan for errors in passwords from above test cases

    if ($error_msg) {

        return $error_msg;

    } else {

        return "Password accepted!";

        }

    }

//test password

echo "test -> ", password_check("ohNOno420!");

?>