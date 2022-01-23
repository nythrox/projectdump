<!DOCTYPE html>
<html>
<?php
include 'head.php';
?>
<?php include 'menu.php'?>
<section id="desabafo">
            <form action="criar_conta_processamento.php" method="post">

                <div class="container">

                    <h1>Criar desabafo</h1>
                    <input class="postar" type="text" required minlength="3" placeholder="Nome" name="nome">
                    <input class="postar" type="email" required placeholder="Email" name="email">
                    <input type="password" class="postar" required minlength="5" placeholder="Senha" name="senha">
                        
                        <input class="botao" type="submit">


                    
                </div>
            </form>
        </section>

        <?php include 'footer.php' ?>
    <script src="script/script.js"></script>
</body>

</html> 