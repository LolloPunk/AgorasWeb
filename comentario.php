<?php
require "./configs/conexao.php";

// array for JSON response
$response = array();

$comentario = NULL;

//check for required fields
$comentario = trim($_POST['comentario']);

$result = pg_query($bdOpen, "INSERT INTO comentario(data_envio, comentario, usuarios.fk_usuarios_id_usuario AS usuarios FROM comentario INNER JOIN usuarios ON usuarios.fk_usuarios_id_usuario = comentario.id_comentario) VALUES(NOW(), '$comentario', fk_usuarios_id_usuario)");
//falta adicionar as chaves estrangeiras, like e deslike

//adicionar o select 
//$query = pg_query($bdOpen, "SELECT * FROM comentario");

//check erro
if ($result) {
    $response["success"] = 1;
} else {
    $response["success"] = 0;
    $response["error"] = "Error BD: " . pg_last_error($bdOpen);
}

pg_close($bdOpen);
echo json_encode($response);
