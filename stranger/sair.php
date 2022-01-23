<?php
    session_start();
    $_SESSION['logged_in'] = false;
    $_SESSION['id_autor'] = null;


header('Location: '."./index.php");
?>