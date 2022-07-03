<?php

require __DIR__ . '/vendor/autoload.php';

use App\Entidy\Devolucao;
use App\Entidy\Entrega;
use App\Entidy\Entregador;
use   \App\Session\Login;

define('TITLE', 'Painel de controle');
define('BRAND', 'Painel de controle ');

$total_entrega = 0;

$entregadores = Entregador::getList('*', 'entregadores', null, 'nome ASC');

$entregas = Entrega::getTotal('sum(e.qtd) as total', 'entrega as e', 'month(e.data) = MONTH(CURRENT_DATE())');

$total_entrega = $entregas->total;

$total_entregas = Entrega::getList(' et.apelido AS entregadores, SUM(e.qtd) AS total', 'entrega AS e
INNER JOIN
entregadores AS et ON (e.entregadores_id = et.id)', ' MONTH(e.data) = MONTH(CURRENT_DATE())
GROUP BY et.nome
ORDER BY total DESC LIMIT 20');

$total_ocorrencias = Devolucao::getList(' o.nome AS ocorrencias, SUM(d.qtd) AS total', ' devolucao AS d
INNER JOIN
ocorrencias AS o ON (d.ocorrencias_id = o.id)', ' MONTH(d.data) = MONTH(CURRENT_DATE())
GROUP BY o.nome');

Login::requireLogin();


include __DIR__ . '/includes/dashboard/header.php';
include __DIR__ . '/includes/dashboard/top.php';
include __DIR__ . '/includes/dashboard/menu.php';
include __DIR__ . '/includes/dashboard/content.php';
include __DIR__ . '/includes/dashboard/box-infor.php';
include __DIR__ . '/includes/dashboard/footer.php';

?>

<script type="text/javascript">
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [

            <?php

                foreach ($total_entregas as $item) {

                    echo "'" . $item->entregadores . "',";
                }

                ?>
        ],
        datasets: [{
                label: '• TOTAL DE ENTREGAS •',
                data: [
                    <?php
                        foreach ($total_entregas as $item) {
                            echo "'" . $item->total . "',";
                        }

                        ?>
                ],
                backgroundColor: [
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8',
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8',
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8',
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',



                ],
                borderColor: [
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8',
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8', '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8',
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8', '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8',
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8'



                ],
                borderWidth: 1
            }

        ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>

<script type="text/javascript">
var ctx = document.getElementById('myChart2').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: [

            <?php

                foreach ($total_ocorrencias as $item) {

                    echo "'" . $item->ocorrencias . "',";
                }

                ?>
        ],
        datasets: [{
                label: '• TOTAL MENSAL DE OCORRÊNCIAS •',
                data: [
                    <?php
                        foreach ($total_ocorrencias as $item) {
                            echo "'" . $item->total . "',";
                        }

                        ?>
                ],
                backgroundColor: [
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8',
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',

                ],
                borderColor: [
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8',
                    '#4f05c5',
                    '#0c74df',
                    '#0cdf9b',
                    '#19df0c',
                    '#df8b0c',
                    '#df0ccf',
                    '#100e81',
                    '#55d990',
                    '#bbc700',
                    '#e70b0b',
                    '#0be7be',
                    '#e70b5c',
                    '#6fe633a8'

                ],
                borderWidth: 1
            }

        ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>