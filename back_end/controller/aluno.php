<?php
//header('Content-type: application/json');
$req = json_decode(file_get_contents('php://input'));

$res = new stdClass();
$res->result = false;
$res->data = "";
$res->error = "";

require_once "../model/Aluno.php";

if($objRetorno->acao == 'cadastrar'){
    $aluno = new Aluno();
    $aluno->email = $objRetorno->email;
    $aluno->senha = $objRetorno->senha;
    $aluno->nome = $objRetorno->nome;
    $aluno->telefone = $objRetorno->telefone;
    $aluno->dataNasc = $objRetorno->dataNasc;
    $aluno->cidade = $objRetorno->cidade;

    if($cliente->cadastrar()){
        $res->result = true;
        $res->data = $aluno;
    }
    else{
        $res->error = "Cadastro não realizado";
    }
}

if($req->funcao == 'logar'){
    $aluno = new Aluno();
    if($aluno->logar($req->email, $req->senha)){
        $res->result = true;
        $res->data = $aluno;
    }
    else{
        $res->error = "Usuário ou senha inválido";

}
}

