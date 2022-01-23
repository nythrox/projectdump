<?php
$connect = mysqli_connect("localhost","root","","stranger");
echo $_REQUEST['nome'];
echo $_REQUEST['email'];
echo $_REQUEST['senha'];
$sql = 'insert into autor (nome,tipo,email,senha,imagem) values ("'.$_REQUEST['nome'].'","usuario","'.$_REQUEST['email'].'","'.$_REQUEST['senha'].'","thumbnail.png")';
if (mysqli_query($connect,$sql) === TRUE) {
  echo'sucesso';
  session_start();
  $_SESSION['logged_in'] = true;

  $sql = 'select id_autor from autor where email="'.$_REQUEST['email'].'"';
  $result = mysqli_query($connect,$sql);
  $row = mysqli_fetch_array($result);
  $_SESSION['id_autor'] = $row["id_autor"]; // get from db 
  header('Location: '."./dashboard.php");
} else {
    echo'erro';
}
?>