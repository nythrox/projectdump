<?php
$connect = mysqli_connect("localhost","root","","stranger");
$sql = 'select senha, id_autor from autor where email="'.$_REQUEST['email'].'"';

$result = mysqli_query($connect,$sql);

$row = mysqli_fetch_array($result);


if (mysqli_num_rows($result) == 0) {
    echo 'conta nao existente. verifique se seu email foi digitado corretamente. clique aqui para criar uma nova conta';
}
else if ($_REQUEST['senha'] != $row["senha"]) {
    echo 'Senha Incorreta. <br>
    Clique aqui para recuperar sua senha.';    
}
else if ($_REQUEST['senha'] == $row["senha"]) {
    echo 'login feito com sucesso';
    session_start();
    $_SESSION['logged_in'] = true;
    $_SESSION['id_autor'] = $row["id_autor"];
    header('Location: '."./dashboard.php");
}
?>