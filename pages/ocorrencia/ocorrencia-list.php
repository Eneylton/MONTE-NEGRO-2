<?php
require __DIR__ . '../../../vendor/autoload.php';

use  App\Db\Pagination;
use  App\Entidy\Ocorrencia;
use  App\Session\Login;

define('TITLE', 'Lista de Ocorrêcias');
define('BRAND', 'Ocorrencia');


Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
    strlen($buscar) ? 'id LIKE "%' . str_replace(' ', '%', $buscar) . '%" or 
    nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Ocorrencia::getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 10);

$listar = Ocorrencia::getList('*', 'ocorrencias', $where, 'id desc', $pagination->getLimit());

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/ocorrencia/ocorrencia-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
    $(document).ready(function() {
        $('.editbtn').on('click', function() {
            $('#editmodal').modal('show');

            $tr = $(this).closest('tr');

            var data = $tr.children("td").map(function() {
                return $(this).text();
            }).get();

            $('#id').val(data[0]);
            $('#nome').val(data[1]);

        });
    });
</script>