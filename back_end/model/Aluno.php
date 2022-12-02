<?php
require_once "DataBase.php";
class Aluno{
    public $email;
    public $senha;
    public $nome;
    public $telefone;
    public $endereco;
    public $dataNasc;
    public $cidade;

    public function consultarPorEmail($email)
    {
        $cx = (new DataBase())->connection();

        $cmdSql = "SELECT * FROM aluno WHERE aluno.email = :email";

        $cx = $cx->prepare($cmdSql);

        if($cx->execute([":email"=>$email])){
            if($cx->rowCount() > 0){
                $objRetorno = $cx->fetch(PDO::FETCH_OBJ);
                $this->email = $objRetorno->email;
                $this->senha = $objRetorno->senha;
                $this->nome = $objRetorno->nome;
                $this->telefone = $objRetorno->telefone;
                $this->endereco = $objRetorno->endereco;
                $this->dataNasc = $objRetorno->dataNasc;
                $this->cidade = $objRetorno->cidade;
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
}
