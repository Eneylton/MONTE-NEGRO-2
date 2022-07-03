<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Devolucao;
use App\Entidy\Gaiola;
use App\Entidy\Producao;
use App\Entidy\Receber;
use App\Entidy\Retorno;
use App\Session\Login;

$usuariologado = Login::getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();

$calculo = 0;
$qtd = 0;
$receber_id = 0;
$qtd_recebida = 0;
$qtd_atual = 0;
$qtd_total = 0;
$producaoID = 0;
$gaiolasID = 0;
$gaiolasQtd = 0;
$totalQtd = 0;
$idretorno = 0;

if (isset($_POST['qtd'])) {


    if ($_POST['ocorrencias_id'] == 6) {

        $item = new Retorno;

        $idretorno = $item->id;

        $item->data                        = $_POST['data'];
        $item->qtd                         = $_POST['qtd'];
        $item->producao_id                 = $_POST['id2'];
        $item->entregadores_id             = $_POST['entregadores2_id'];
        $item->ocorrencias_id              = $_POST['ocorrencias_id'];
        $item->tipo_id                     = 1;
        $item->status                      = 0;

        $item->cadastar();

        $result = Producao::getID('*', 'producao', $_POST['id2'], null, null);
        $receberID = $result->receber_id;

        $produt = Receber::getID('*', 'receber', $receberID, null, null);
        $gaiolasID = $produt->gaiolas_id;

        $resultGaiola = Gaiola::getID('*', 'gaiolas', $gaiolasID, null, null);
        $gaiolasQtd = $resultGaiola->qtd;
        $totalQtd = ($gaiolasQtd - $_POST['qtd']);

        $resultGaiola->qtd = $totalQtd;
        $resultGaiola->atualizar();

        $item = new Devolucao;

        $item->data                        = $_POST['data'];
        $item->qtd                         = $_POST['qtd'];
        $item->producao_id                 = $_POST['id2'];
        $item->entregadores_id             = $_POST['entregadores2_id'];
        $item->ocorrencias_id              = $_POST['ocorrencias_id'];

        $item->cadastar();

        $value = Producao::getID('*', 'producao', $_POST['id2'], null, null);

        $qtd = $value->qtd;

        $calculo = ($qtd - $_POST['qtd']);

        if ($calculo == 0) {

            $value->qtd    = $calculo;
            $value->status = 2;
            $value->atualizar();

            header('location: ../producao/producao-list.php?status=success');
            exit;
        } else {
            $value->qtd    = $calculo;
            $value->status = 1;
            $value->atualizar();

            header('location: ../producao/producao-list.php?status=success');
            exit;
        }
    } else {

        $item2 = new Retorno;
        $item2->data                        = $_POST['data'];
        $item2->qtd                         = $_POST['qtd'];
        $item2->producao_id                 = $_POST['id2'];
        $item2->entregadores_id             = $_POST['entregadores2_id'];
        $item2->ocorrencias_id              = $_POST['ocorrencias_id'];
        $item2->tipo_id                     = 2;
        $item2->status                      = 0;

        $item2->cadastar();

        $item = new Devolucao;

        $item->data                        = $_POST['data'];
        $item->qtd                         = $_POST['qtd'];
        $item->producao_id                 = $_POST['id2'];
        $item->entregadores_id             = $_POST['entregadores2_id'];
        $item->ocorrencias_id              = $_POST['ocorrencias_id'];

        $item->cadastar();

        //REORNA PARA BAIA

        $result = Producao::getID('*', 'producao', $_POST['id2'], null, null);
        $receberID = $result->receber_id;

        $produt = Receber::getID('*', 'receber', $receberID, null, null);
        $gaiolasID = $produt->gaiolas_id;

        $resultGaiola = Gaiola::getID('*', 'gaiolas', $gaiolasID, null, null);
        $gaiolasQtd = $resultGaiola->qtd;
        $totalQtd = ($gaiolasQtd - $_POST['qtd']);

        $resultGaiola->qtd = $totalQtd;
        $resultGaiola->atualizar();

        $value = Producao::getID('*', 'producao', $_POST['id2'], null, null);

        $qtd = $value->qtd;

        $calculo = ($qtd - $_POST['qtd']);

        if ($calculo == 0) {

            $value->qtd    = $calculo;
            $value->status = 2;
            $value->atualizar();

            header('location: ../producao/producao-list.php?status=success');
            exit;
        } else {
            $value->qtd    = $calculo;
            $value->status = 1;
            $value->atualizar();

            header('location: ../producao/producao-list.php?status=success');
            exit;
        }
    }
}