<?php

use App\Entidy\Producao;

require __DIR__ . '../../../vendor/autoload.php';

$dados = "";
$contador = 0;
$qtd = 0;

$param = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);

$buscar = Producao::getID('*', 'producao', $param, null, null);

$id = $buscar->id;
$entregador = $buscar->entregadores_id;
$receber = $buscar->receber_id;

$dados .= '

            <input type="hidden" name="producao_id" value="' . $id . '">
            <input type="hidden" name="entregadores_id" value="' . $entregador  . '">
            <input type="hidden" name="receber_id" value="' . $receber . '">

';

$retorna = ['erro' => false, 'dados' => $dados];

echo json_encode($retorna);