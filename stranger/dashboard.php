<!DOCTYPE html>
<html>
<?php
include 'head.php';?>
<!-- falta criar: 
javascript modal, quando vc clica em ler mais
javascript modal quando vc clica em postar vai aparecer: digite o nome e titulo
sistema de conta, pagina para ver contas dos outros, pagina para ver sua conta
php: algoritimo pegar 10 ultimos postagens, pegar postagens famosos 
-->

<!--if  logged in, show this. else redirect to log in-->

<body>
    <?php include 'menu.php' ?>

    <?php

if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] == true) {
    
?>
    <div class="side-nav">
        <ul>
            <li>
                <a href="#">
                    <span>Últimas postagens</span>
                </a>
                <?php include 'ultimos_posts_individuais.php'?>
            </li>
            <li>
                <a href="#">
                    <span>Perfil</span>
                    <?php
$connect = mysqli_connect("localhost","root","","stranger");
$sql = "select nome, imagem, tipo from autor where autor.id_autor = ".$_SESSION['id_autor'];
$result = mysqli_query($connect,$sql);
$row = mysqli_fetch_array($result);
echo "<img src=''>";
?>
                </a>
            </li>
        </ul>
    </div>

    <?php
    }
    else {
        header('Location: '."./login.php");
    }
?>
    <?php include 'footer.php' ?>
    <script src="script/script.js"></script>
</body>

</html>