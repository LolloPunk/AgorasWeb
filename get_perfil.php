
<?php
require "./configs/conexao.php";

// array for JSON response
$response = array();

//session de usuario
$login = trim($_POST['login']);
$result = pg_fetch_array($bdOpen, "SELECT * FROM usuario WHERE email='$login')");
echo $result;

if (pg_num_rows($result) > 0) {
    $response["usuario"] = array();{
    $usuario = array();
    $usuario['name'] = $row['nome'];
    $usuario['userName'] = $row['nome_de_usuario'];
    $usuario['bio'] = $row['bio'];
    $usuario['img']=$row['pfp'];
    array_push($response["usuario"]);
    }
    $response["success"] = 1;
}else {
    $response["success"] = 0;
    $response["message"] = "Nao ha dados";
}
pg_close($bdOpen);
echo json_encode($response);
?>
