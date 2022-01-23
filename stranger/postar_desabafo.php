<?php

session_start();

$connect = mysqli_connect("localhost", "root", "", "stranger");

$sql = "select nome, imagem, tipo,id_autor from autor where id_autor = ".$_SESSION['id_autor'];
$result = mysqli_query($connect,$sql);
$row = mysqli_fetch_array($result);

if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] == true) {//se vc estiver logado, id_autor vai ser o id do seu autor
    $sql = 'insert into post (apelido_post,titulo_post,data_post,conteudo_post,likes_post,id_autor) values ("' . $row['nome'] . '","' . $_POST['titulo'] . '","' . date("Y/m/d") . '","<p>' . $_POST['texto'] . '</p>",0,'.$row['id_autor'].');';
}
else {//se vc n estiver logado, o id_autor vai ser anonimo
    $sql = 'insert into post (apelido_post,titulo_post,data_post,conteudo_post,likes_post,id_autor) values ("' . $_POST['nome'] . '","' . $_POST['titulo'] . '","' . date("Y/m/d") . '","<p>' . $_POST['texto'] . '</p>",0,1);';
}
if (mysqli_query($connect, $sql) === true) {
    header('Location: ' . "./?success=true");
} else {
    header('Location: ' . "./?success=false");
}
 