<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Receber
{


    public $id;
    public $data;
    public $qtd;
    public $disponivel;
    public $clientes_id;
    public $gaiolas_id;
    public $setores_id;
    public $servicos_id;
    public $usuarios_id;


    public function cadastar()
    {


        $obdataBase = new Database('receber');

        $this->id = $obdataBase->insert([

            'data'                      => $this->data,
            'qtd'                       => $this->qtd,
            'disponivel'                => $this->disponivel,
            'gaiolas_id'                => $this->gaiolas_id,
            'setores_id'                => $this->setores_id,
            'servicos_id'               => $this->servicos_id,
            'usuarios_id'               => $this->usuarios_id,
            'clientes_id'               => $this->clientes_id

        ]);

        return true;
    }

    public function atualizar()
    {
        return (new Database('receber'))->update('id = ' . $this->id, [

            'data'                      => $this->data,
            'qtd'                       => $this->qtd,
            'disponivel'                => $this->disponivel,
            'gaiolas_id'                => $this->gaiolas_id,
            'setores_id'                => $this->setores_id,
            'servicos_id'               => $this->servicos_id,
            'usuarios_id'               => $this->usuarios_id,
            'clientes_id'               => $this->clientes_id
        ]);
    }



    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('receber'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('receber'))->select('COUNT(*) as qtd', 'receber', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('receber'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

    public static function getClientID($fields, $table, $where, $order, $limit)
    {
        return (new Database('receber'))->select($fields, $table, 'r.clientes_id = ' . $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }

    public static function getGaiolaID($fields, $table, $where, $order, $limit)
    {
        return (new Database('rotas'))->select($fields, $table, 'gaiolas_id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }



    public function excluir()
    {
        return (new Database('receber'))->delete('id = ' . $this->id);
    }


    public static function getEmail($email)
    {

        return (new Database('receber'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}