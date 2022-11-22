<?php

$usuario = "root";
$senha = "";
$database = "prototipo_tcc";
$host = "localhost";

$mysqli = new mysqli($host, $senha, $database, $host);

if($mysqli->error) {
    die("falha ao conectar ao banco de dados" . $mysqli->error);
}
