<!-- menu-->
<?php

session_start();
if (isset($_SESSION['logged_in'])) {
    if ($_SESSION['logged_in'] == true) {
?>
<nav>
        <ul>
            <li class="logo"><a href="index.php">Stranger</a></li>
        </ul>
        <ul>
            <li class="menu"><a href="dashboard.php">Minha Conta</a></li>
            
            <li class="menu"><a href="sair.php">Sair</a></li>
            <li class="menu"><a href="index.php">Home</a></li>
            <li class="menu"><a href="recentes.php">Recentes</a></li>
            <li class="menu"><a href="sobre.php">Sobre</a></li>
        </ul>
            <li id="menuIcon"><a href="javascript:void(0);"onclick="myFunction()"><img src="img/menu.png"></a></li>
        </ul>
    </nav>
<?php
}

else{

    ?>
    <nav>
            <ul>
                <li class="logo"><a href="index.php">Stranger</a></li>
            </ul>
            <ul>
                <li class="menu"><a href="login.php">Login</a></li>
                <li class="menu"><a href="criar_conta.php">Criar Conta</a></li>
                <li class="menu"><a href="index.php">Home</a></li>
                <li class="menu"><a href="recentes.php">Recentes</a></li>
                <li class="menu"><a href="sobre.php">Sobre</a></li>
            </ul>
                <li id="menuIcon"><a href="javascript:void(0);"onclick="myFunction()"><img src="img/menu.png"></a></li>
            </ul>
        </nav>
    
    <?php
    }   
}
else{

?>
<nav>
        <ul>
            <li class="logo"><a href="index.php">Stranger</a></li>
        </ul>
        <ul>
            <li class="menu"><a href="login.php">Login</a></li>
                <li class="menu"><a href="criar_conta.php">Criar Conta</a></li>
            <li class="menu"><a href="index.php">Home</a></li>
            <li class="menu"><a href="recentes.php">Recentes</a></li>
            <li class="menu"><a href="sobre.php">Sobre</a></li>
        </ul>
            <li id="menuIcon"><a href="javascript:void(0);"onclick="myFunction()"><img src="img/menu.png"></a></li>
        </ul>
    </nav>

<?php
}
?>
