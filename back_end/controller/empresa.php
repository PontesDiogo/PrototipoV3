<?php
//header('Content-type: application/json');
$req = json_decode(file_get_contents('php://input'));
var_dump($req);

$res = new stdClass();
$res->result = false;
$res->data = "";
$res->error = "";

require_once "../model/Empresa.php";
if($req->funcao == 'cadastrar'){
    $empresa = new Empresa();
    $empresa->cnpj = $req->cnpj;
    $empresa->nome = $req->nome;
    $empresa->email = $req->email;
    $empresa->senha = $req->senha;
    $empresa->telefone = $req->telefone;
    $empresa->endereco = $req->endereco;



    if($empresa->cadastrar()){
        $res->result = true;
        $res->data = $empresa;
    }
    else{
        $res->error = "Cadastro não realizado";
    }
}
elseif(@$req->funcao == 'logar'){
    $empresa = new Empresa();
    if($empresa->logar($req->email, $req->senha)){
        $res->result = true;
        $res->data = $empresa;
    }
    else{
        $res->error = "Usuário ou senha inválido";

    }
}

echo json_encode($res);
