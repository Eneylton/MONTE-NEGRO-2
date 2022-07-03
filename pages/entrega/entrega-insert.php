<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Entrega;
use App\Entidy\Gaiola;
use App\Entidy\Producao;
use App\Entidy\Receber;
use App\Session\Login;

$usuariologado = Login::getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();
$qtd_producao = 0;
$calculo = 0;
$receber_id = 0;
$qtd = 0;
$qtd_atual = 0;
$qtd_total = 0;
$entregador_id = 0;
$gaiolas_id = 0;
$gaiolas_qtd = 0;
$gaiolas_total = 0;

if (isset($_POST['qtd'])) {

    $qtd_producao = $_POST['qtd'];

    $receber_id = $_POST['receber_id'];

    $value = Producao::getID('*', 'producao', $_POST['producao_id'], null, null);

    $qtd = $value->qtd;
    $entregador_id = $value->entregadores_id;

    $calculo = ($qtd - $_POST['qtd']);

    if ($calculo == 0) {

        $value->qtd    = $calculo;
        $value->status = 2;
        $value->atualizar();
    } else {
        $value->qtd    = $calculo;
        $value->status = 1;
        $value->atualizar();
    }

    $item = new Entrega;

    $item->data                        = $_POST['data'];
    $item->qtd                         = $_POST['qtd'];
    $item->producao_id                 = $_POST['producao_id'];
    $item->entregadores_id             = $_POST['entregadores_id'];

    $item->cadastar();

    $res = Receber::getID('*', 'receber', $receber_id, null, null);

    $gaiolas_id = $res->gaiolas_id;

    $result = Gaiola::getID('*', 'gaiolas', $gaiolas_id, null, null);
    $gaiolas_qtd = $result->qtd;

    $gaiolas_total = ($gaiolas_qtd -  $qtd_producao);
    $result->qtd = $gaiolas_total;
    $result->atualizar();

    header('location: ../producao/producao-list.php?status=success');
    exit;
}