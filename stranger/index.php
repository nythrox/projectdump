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

<body>
    <?php include 'menu.php' ;?>
    <?php 
        if (isset($_GET['success'])) {
            if ($_GET['success'] == true) {
                echo '<div class="success">Desabafo enviado com sucesso!</div>';
            } else {
                echo 'Falha em enviar desabafo :(';
            }
        } else {
            // Fallback behaviour goes here
        }
        ?>
    <div class="main">
        <!--criar desabafo-->
        <?php
       if (!(isset($_SESSION['logged_in']) && $_SESSION['logged_in'] == true)) {
       ?>
        <section id="desabafo">
            <form action="postar_desabafo.php" method="post">

                <div class="container">

                    <h1>Criar desabafo</h1>
                    <input class="postar" type="text" required minlength="1" placeholder="Mariazinha Sousa (Opcional)" name="nome">
                    <input type="text" class="postar" required minlength="3" placeholder="Meu pai foi comprar cigarro e olha no que deu" name="titulo">
                    <div class="postar">
                        <!--pai-->
                        <textarea type="text" required minlength="10" name="texto" placeholder="Whats on your mind?"></textarea>
                        <!--child-->
                        <input class="botao" type="submit">


                    </div>
                </div>
            </form>
        </section>
<?php
}
else {
?>
<section id="desabafo">
            <form action="postar_desabafo.php" method="post">

                <div class="container">

                    <h1>Criar desabafo</h1>
                    <input type="text" class="postar" required minlength="3" placeholder="Meu pai foi comprar cigarro e olha no que deu" name="titulo">
                    <div class="postar">
                        <!--pai-->
                        <textarea type="text" required minlength="10" name="texto" placeholder="Whats on your mind?"></textarea>
                        <!--child-->
                        <input class="botao" type="submit">


                    </div>
                </div>
            </form>
        </section>
<?php

}
?>
        <!--Recentes-->
        <section id="recentes">
            <div class="container">
                <h1>Recentes</h1>
                <?php include 'post.php' ?>
            </div>
        </section>
        <section id="populares">

            <div class="container">
                <h1>Populares</h1>

                <?php include 'post_pequeno.php' ?>
        </section>
    </div>

    <?php include 'footer.php' ?>
    <script src="script/script.js"></script>
</body>

</html> 