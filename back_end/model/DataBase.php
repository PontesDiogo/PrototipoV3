<?php
class DataBase{
    public function __construct(){
        $this->host = 'localhost';
        $this->db = 'prototipo_tcc';
        $this->user = 'root';
        $this->pass = '';
        $this->port = '3306';
    }
    public function connection(){
        return new PDO("mysql:host=$this->host;port=$this->port;dbname=$this->db", $this->user, $this->pass);
    }
}
