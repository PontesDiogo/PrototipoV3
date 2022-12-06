<?php
//header('Content-type: application/json');
$req = json_decode(file_get_contents('php://input'));

$res = new stdClass();
$res->result = false;
$res->data = "";
$res->error = "";

require_once "../model/Aluno.php";

if($req->funcao == 'cadastrar'){
    $aluno = new Aluno();
    $aluno->nome = $req->nome;
    $aluno->email = $req->email;
    $aluno->senha = $req->senha;
    $aluno->endereco = $req->endereco;
    $aluno->telefone = $req->telefone;
    $aluno->dataNasc = $req->dataNasc;
    $aluno->cidade = $req->cidade;

    if($aluno->cadastrar()){
        $res->result = true;
        $res->data = $aluno;
    }
    else{
        $res->error = "Cadastro não realizado";
    }
}
elseif(@$req->funcao == 'logar'){
    $aluno = new Aluno();
    if($aluno->logar($req->email, $req->senha)){
        $res->result = true;
        $res->data = $aluno;
    }
    else{
        $res->error = "Usuário ou senha inválido";

    }
}

echo json_encode($res);
