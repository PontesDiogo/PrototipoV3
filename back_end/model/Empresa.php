<?php

require_once "DataBase.php";
class Empresa{
    public $id;
    public $cnpj;
    public $nome;
    public $email;
    public $senha;
    public $telefone;
    public $endereco;



public function consultarPorEmail($email)
{
    $cx = (new DataBase())->connection();

    $cmdSql = "SELECT * FROM empresa WHERE empresa.email = :email";

    $cx = $cx->prepare($cmdSql);

    if($cx->execute([":email"=>$email])){
        if($cx->rowCount() > 0){
            $objRetorno = $cx->fetch(PDO::FETCH_OBJ);
            $this->id = $objRetorno->id;
            $this->cnpj = $objRetorno->cnpj;
            $this->email = $objRetorno->email;
            $this->senha = $objRetorno->senha;
            $this->nome = $objRetorno->nome;
            $this->telefone = $objRetorno->telefone;
            $this->endereco = $objRetorno->endereco;
            return true;
        }


    }
    return false;
}

public function logar($email, $senha)
{
    if($this->consultarPorEmail($email)){
        return ($this->senha == $senha);
    }
    return false;
}

public function cadastrar(){
    $cx = (new DataBase())->connection();

    $cmdSql = 'INSERT INTO empresa(id, cnpj, nome, email, senha, telefone, endereco) VALUES (:id, :cnpj, :nome, :email, :senha, :telefone, :endereco);';
    $dados=[
        ':id' => $this->id,
        ':cnpj' => $this->cnpj,
        ':nome'=>$this->nome,
        ':email'=>$this->email,
        ':senha'=>$this->senha,
        ':telefone'=>$this->telefone,
        ':endereco'=>$this->endereco
    ];
    $cx = $cx->prepare($cmdSql);
    return $cx->execute($dados);
}
}
