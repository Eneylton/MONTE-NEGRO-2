<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Gaiola;
use App\Entidy\Receber;
use App\Session\Login;

Login::requireLogin();

$usuariologado = Login::getUsuarioLogado();

$usuario = $usuariologado['id'];

$contador = 0;
$soma = 0;

$id_gaiola = 117;

$soma = $_POST['qtd'] / 1;

$value = Gaiola::getID('*', 'gaiolas', 93, null, null);

$qtd  = $value->qtd;

$calculado = ($qtd + $soma);

$value->qtd = $calculado;

$value->atualizar();


$item = new Receber;
$item->data            = $_POST['data'];
$item->disponivel      = $_POST['qtd'];
$item->qtd             = $_POST['qtd'];
$item->setores_id      = $_POST['setores'];
$item->servicos_id     = 1;
$item->clientes_id     = $_POST['clientes_id'];
$item->usuarios_id     = $usuario;
$item->gaiolas_id      = $id_gaiola;
$item->cadastar();

header('location: receber-list.php?');
exit;