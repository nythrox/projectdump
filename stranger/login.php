<!DOCTYPE html>
<html>
<?php
include 'head.php';
?>
<?php include 'menu.php'?>
<?php

if (!(isset($_SESSION['logged_in']) && $_SESSION['logged_in'] == true)) {
    
?>
<section id="desabafo">
            <form action="fazer_login.php" method="post">

                <div class="container">
                    <!--if not logged in, show this. else redirect to dashboard-->
                    <h1>Login</h1>
                    <input class="postar" type="email" required minlength="1" placeholder="Email" name="email">
                    <input type="password" class="postar" required minlength="3" placeholder="Senha" name="senha">
                        
                        <input class="botao" type="submit">


                    
                </div>
            </form>
        </section>
        <?php
    }
    else {
        header('Location: '."./dashboard.php");
    }
?>
        <?php include 'footer.php' ?>
    <script src="script/script.js"></script>
</body>

</html> 