<?php
$connect = mysqli_connect("localhost", "root", "", "stranger");
$sql = "select titulo_post, data_post, conteudo_post, likes_post, apelido_post, nome, imagem, tipo from post inner join autor on post.id_autor = autor.id_autor;";
#mysqli_set_charset($connect,'utf8');
$result = mysqli_query($connect, $sql);
?>
<?php
if (mysqli_num_rows($result) > 0) { // mudar isso para pegar os 10 mais recentes
    while ($row = mysqli_fetch_array($result)) {

        ?>

        <div class="post">
            <div class="metadata">
                <?php
                echo '<img class="thumbnail" src="img/' . $row["imagem"] . '">';
                ?>
                <div class="head">
                    <?php
                    if ($row['tipo'] == "anonimo") {
                        if ($row["apelido_post"] != "") {
                            echo '<h1 class="data">' . $row["apelido_post"] . ' (Apelido)</h1>';
                        } else {
                            echo '<h1 class="data">Anonimo</h1>';
                        }
                    } else {
                        echo '<h1 class="data">' . $row["nome"] . '</h1>';
                    }
                    //se a conta for do tipo anonimo, pegue o apelido
                    //se for do tipo conta/admin, pegue o nome   

                    ?>
                    <h1 class="data"><?php echo $row["data_post"]; ?></h1>
                </div>
            </div>
            <div class="post-content">
                <h1 class="titulo"><?php echo $row["titulo_post"]; ?></h1>
                <?php echo $row["conteudo_post"]; ?>
                <div class="botao2"><a href="#" class=""><img src="http://www.pngall.com/wp-content/uploads/2016/04/Instagram-Heart-PNG-Clipart.png" width="10px"> <?php echo $row["likes_post"]; ?></a> </div>
                <div class="botao2"><a href="#" class="">ler mais</a></div>
            </div>
        </div>

    <?php
}
}
?>