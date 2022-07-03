<?php

$list = '';
$resultados = '';
$block = '';
$contador  = 0;


switch ($acesso) {

    case '2':
        $block = "disabled";
        break;
    case '3':
        $block = "";
        break;
    case '4':
        $block = "";
        break;

    default:
        $block = "";
        break;
}


foreach ($listar as $item) {

    switch ($item->disponivel) {
        case '10':
            $cor2 = "badge-danger";
            $disponivel = "10";
            $msn = " ITENS PEDENTES";
            $disabled = "";
            break;

        case '9':
            $cor2 = "badge-danger";
            $disponivel = "9";
            $msn = "Pendentes";
            $disabled = "";
            break;

        case '8':
            $cor2 = "badge-danger";
            $disponivel = "8";
            $msn = "Pendentes";
            $disabled = "";
            break;


        case '7':
            $cor2 = "badge-danger";
            $disponivel = "7";
            $msn = "Pendentes";
            $disabled = "";
            break;


        case '6':
            $cor2 = "badge-danger";
            $disponivel = "6";

            $msn = "Pendentes";
            $disabled = "";
            break;


        case '5':
            $cor2 = "badge-danger";
            $disponivel = "5";
            $msn = "Pendentes";
            $disabled = "";
            break;
        case '4':
            $cor2 = "badge-danger";
            $disponivel = "4";
            $msn = "Pendentes";
            $disabled = "";
            break;

        case '3':
            $cor2 = "badge-danger";
            $disponivel = "3";
            $msn = " Pendentes";
            $disabled = "";
            break;

        case '2':
            $cor2 = "badge-danger";
            $disponivel = "2";
            $msn = "Pendentes";
            $disabled = "";
            break;

        case '1':
            $cor2 = "badge-danger";
            $disponivel = "1";
            $msn = "Pendente";
            $disabled = "";
            break;

        case '0':
            $cor2 = "badge-success";
            $disponivel = "";
            $msn = "Todos os itens foram distribuidos";
            $disabled = "disabled";
            break;

        default:
            $cor2 = "badge-light";
            $disponivel = $item->disponivel;
            $msn = " Itens Disponiveis até o momento";
            $disabled = "";
            break;
    }

    $id = $item->id;

    $contador += 1;

    $resultados .= '<tr>

                      <td style="text-transform:uppercase">' . $item->id . '</td>
                      <td style="text-transform:uppercase">' . date('d/m/Y  Á\S  H:i:s', strtotime($item->data)) . '</td>
                      <td style="text-transform:uppercase">' . $item->cliente . '</td>
                      <td style="text-transform:uppercase">' . $item->setores . '</td>
                      <td style="text-transform:uppercase;font-size:20px">
                      
                      <input ' . $disabled . ' type="text" size="1" class="form-control centro qtd-40" name="val[' . $item->id  . ']" value="' . $item->qtd . '" />
                        <button type="submit" class="btn btn-primary ocultar"><i class="fas fa-search"></i></button>
                      
                      </td>
                      <td style="text-transform:uppercase"> <h4><span class="badge badge-pill ' . $cor2 . '"> <i class="fa fa-plus-circle" aria-hidden="true"></i> &nbsp;' . $disponivel . ' &nbsp;' . $msn . '&nbsp; </span></h4> </td>
                    
                      <td style="text-align: center;width:300px">
                        
                      
                      <a href="receber-item-cadastro.php?id_item=' . $item->id . '&qtd=' . $disponivel . '">
                      <button ' . $disabled . ' type="button" class="btn btn-default" ><i class="fas fa-fa fa-motorcycle"></i> &nbsp; &nbsp; ENTREGADORES  </button>
                      </a>
                       &nbsp;
                       &nbsp;

                       <a href="receber-delete.php?id=' . $item->id . '">
                       <button type="button" class="btn btn-danger"> <i class="fas fa-trash"></i></button>
                       </a>
                      </td>
                      </tr>
                      ';
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="9" class="text-center" > Nenhum item recebido !!!!! </td>
                                                     </tr>';
?>

<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">

                <div class="card back-black">
                    <div class="card-header">
                        <button accesskey="q" title="ALT+K" type="submit" class="btn btn-warning" data-toggle="modal"
                            data-target="#modal-default"> <i class="fas fa-plus"></i> &nbsp; Novo</button>
                        <button <?= $block ?> accesskey="r" title="ALT+R" style="margin-left: 10px;" type="submit"
                            class="btn btn-success float-right" data-toggle="modal" data-target="#modal-data"> <i
                                class="fas fa-print"></i> &nbsp; IMPRIMIR RELATÓRIOS</button>
                        <button <?= $block ?> accesskey="e" title="ALT+E" type="submit"
                            class="btn btn-danger float-right" data-toggle="modal" data-target="#modal-data2"><i
                                class="fas fa-chart-bar"></i> &nbsp;
                            IMPRIMIR ESTATÍSTICA</button>
                    </div>
                    <!-- /.card-header -->

                    <form action="?acao=up" method="post">
                        <div class="card-body">

                            <table id="example" class="table table-dark table-hover table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th style="text-align: left; width:80px"> Nº </th>
                                        <th> DATA</th>
                                        <th> CLIENTE </th>
                                        <th style="width: 300px;"> SETOR </th>
                                        <th class="centro"> QTD RECEBIDA </th>
                                        <th style="text-align: center;"> DISPONÍVEL </th>

                                        <th style="text-align: center; width:200px"> AÇÃO </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <?= $resultados ?>
                                </tbody>


                            </table>


                        </div>

                    </form>


                </div>

            </div>

        </div>

    </div>

</section>

<div class="modal fade" id="modal-default">
    <div class="modal-dialog modal-lg">
        <div class="modal-content bg-light">
            <form name="form-08" action="./receber-insert.php" method="post">
                <input type="hidden" name="rotas" value="93">

                <div class="modal-header">
                    <h4 class="modal-title">Receber item
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="row">

                        <div class="col-12">
                            <div class="form-group">
                                <label>Data do Recebimento </label>
                                <input value="<?php
                                                date_default_timezone_set('America/Sao_Paulo');
                                                echo date('Y-m-d\TH:i:s', time()); ?>" type="datetime-local"
                                    class="form-control" name="data" required>
                            </div>
                        </div>


                        <div class="col-4">

                            <div class="form-group">
                                <label>Quantidade recebida</label>
                                <input style="text-transform: uppercase;" type="text" class="form-control" name="qtd"
                                    id="qtd2" required autofocus>
                            </div>

                        </div>

                        <div class="col-4">

                            <div class="form-group">
                                <label>Cliente</label>
                                <select class="form-control select" style="width: 100%;" name="clientes_id" required>
                                    <option value=""> Selecione um cliente</option>
                                    <?php

                                    foreach ($clientes as $item) {
                                        echo '<option style="text-transform: uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                                    }
                                    ?>

                                </select>

                            </div>
                        </div>

                        <div class="col-4">

                            <div class="form-group">
                                <label>Setores</label>
                                <select class="form-control select" style="width: 100%;" name="setores" id="setores">
                                    <option value=""> Selecione um setor </option>
                                    <?php

                                    foreach ($setores as $item) {
                                        echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                                    }
                                    ?>

                                </select>

                            </div>
                        </div>

                    </div>

                </div>



                <div class="modal-footer justify-content-between">
                    <button title="ALT+W" accesskey="w" type="button" class="btn btn-danger"
                        data-dismiss="modal">Fechar</button>
                    <button title="ALT+S" accesskey="s" type="submit" class="btn btn-primary">Receber</button>
                </div>

            </form>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- EDITAR -->

<div class="modal fade" id="editmodal">
    <div class="modal-dialog modal-lg">
        <form id="form-07" action="./receber-edit.php" method="get">
            <div class="modal-content bg-light">
                <div class="modal-header">
                    <h4 class="modal-title">Editar
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="row">

                        <div class="col-6">

                            <div class="form-group">
                                <label>Data do Recebimento </label>
                                <input type="hidden" name="id" id="id">
                                <input value="" type="datetime-local" class="form-control" name="data" id="data"
                                    required>
                            </div>
                        </div>

                        <div class="col-6">

                            <div class="form-group">
                                <label>Quantidade recebida</label>
                                <input style="text-transform: uppercase;" type="text" class="form-control" name="qtd"
                                    required>
                            </div>

                        </div>


                        <div class="col-3">

                            <div class="form-group">
                                <label>Cliente</label>
                                <select class="form-control select" style="width: 100%;" name="clientes_id"
                                    id="clientes_id" required>
                                    <option value=""> Selecione um cliente</option>
                                    <?php

                                    foreach ($clientes as $item) {
                                        echo '<option style="text-transform: uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                                    }
                                    ?>

                                </select>

                            </div>
                        </div>
                        <div class="col-3">

                            <div class="form-group">
                                <label>Cliente</label>
                                <select class="form-control select" style="width: 100%;" name="clientes_id"
                                    id="clientes_id" required>
                                    <option value=""> Selecione um cliente</option>
                                    <?php

                                    foreach ($clientes as $item) {
                                        echo '<option style="text-transform: uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                                    }
                                    ?>

                                </select>

                            </div>
                        </div>
                        <div class="col-3">

                            <div class="form-group">
                                <label>Cliente</label>
                                <select class="form-control select" style="width: 100%;" name="clientes_id"
                                    id="clientes_id" required>
                                    <option value=""> Selecione um cliente</option>
                                    <?php

                                    foreach ($clientes as $item) {
                                        echo '<option style="text-transform: uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                                    }
                                    ?>

                                </select>

                            </div>
                        </div>
                        <div class="col-3">

                            <div class="form-group">
                                <label>Cliente</label>
                                <select class="form-control select" style="width: 100%;" name="clientes_id"
                                    id="clientes_id" required>
                                    <option value=""> Selecione um cliente</option>
                                    <?php

                                    foreach ($clientes as $item) {
                                        echo '<option style="text-transform: uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                                    }
                                    ?>

                                </select>

                            </div>
                        </div>

                    </div>

                </div>


                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Receber
                    </button>
                </div>
            </div>
        </form>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<div class="modal fade" id="modal-data">
    <div class="modal-dialog modal-lg">
        <div class="modal-content ">
            <form id="form-04" action="./receber-gerar.php" method="GET" enctype="multipart/form-data">

                <div class="modal-header">
                    <h4 class="modal-title">Relatórios
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="card-body">

                    <div class="form-group">

                        <div class="row">

                            <div class="col-lg-4 col-4">
                                <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>"
                                    name="dataInicio">
                            </div>


                            <div class="col-lg-4 col-4">
                                <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>"
                                    name="dataFim">
                            </div>


                            <div class="col-lg-4 col-4">

                                <select class="form-control select" name="clientes_id">
                                    <option value=""> Clientes </option>
                                    <?php

                                    foreach ($clientes as $item) {
                                        echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                                    }
                                    ?>

                                </select>

                            </div>

                        </div>
                    </div>

                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Gerar relatório</button>
                </div>

            </form>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="modal-data2">
    <div class="modal-dialog modal-lg">
        <div class="modal-content ">
            <form id="form-03" action="./grafico.php" method="GET" enctype="multipart/form-data">

                <div class="modal-header">
                    <h4 class="modal-title">Estatística
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="card-body">

                    <div class="form-group">

                        <div class="row">

                            <div class="col-lg-4 col-4">
                                <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>"
                                    name="dataInicio">
                            </div>


                            <div class="col-lg-4 col-4">
                                <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>"
                                    name="dataFim">
                            </div>


                            <div class="col-lg-4 col-4">

                                <select class="form-control select" name="clientes_id">
                                    <option value=""> Clientes </option>
                                    <?php

                                    foreach ($clientes as $item) {
                                        echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                                    }
                                    ?>

                                </select>

                            </div>

                        </div>
                    </div>

                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Gerar relatório</button>
                </div>

            </form>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<form action="./receber-entregador.php" method="POST">
    <div class="modal fade" id="entregModal" data-backdrop="static" data-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">

            <div class="modal-content bg-light">
                <div class="modal-header">
                    <h4 class="modal-title">Prazo de Entrega
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">


                    <div class="row">
                        <div class="col-6">

                            <div class="form-group">
                                <label>Início da entrega</label>
                                <input value="<?php
                                                date_default_timezone_set('America/Sao_Paulo');
                                                echo date('Y-m-d\TH:i:s', time()); ?>" type="datetime-local"
                                    class="form-control" name="data_inicio" required>
                            </div>
                        </div>

                        <div class="col-6">

                            <div class="form-group">
                                <label>Final da entrega</label>
                                <input value="<?php
                                                date_default_timezone_set('America/Sao_Paulo');
                                                echo date('Y-m-d\TH:i:s', time()); ?>" type="datetime-local"
                                    class="form-control" name="data_fim" required>
                            </div>
                        </div>

                        <div class="col-4">
                            <label>Regiões</label>
                            <select class="form-control select" style="width: 100%;" name="regioes" id="regioes"
                                required>
                                <option value=""> Selecione uma região </option>
                                <?php

                                foreach ($regioes as $item) {
                                    echo '<option style="text-transform: uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                                }
                                ?>

                            </select>

                        </div>
                        <div class="col-4">
                            <label>Entregador</label>
                            <select class="form-control" name="entregadores" id="entregadores"></select>

                        </div>
                        <div class="col-4">
                            <span class="end-modal"></span>
                        </div>


                    </div>

                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Salvar
                    </button>
                </div>
            </div>

            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</form>