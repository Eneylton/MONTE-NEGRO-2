<?php

if (isset($_GET['status'])) {

    switch ($_GET['status']) {
        case 'success':
            $icon  = 'success';
            $title = 'Parabéns';
            $text = 'Cadastro realizado com Sucesso !!!';
            break;

        case 'del':
            $icon  = 'error';
            $title = 'Parabéns';
            $text = 'Esse usuário foi excluido !!!';
            break;

        case 'edit':
            $icon  = 'warning';
            $title = 'Parabéns';
            $text = 'Cadastro atualizado com sucesso !!!';
            break;


        default:
            $icon  = 'error';
            $title = 'OPSS ALGO DEU ERRADO !!!';
            $text = 'A QUANTIDADE DE ITENS E MAIOR DO QUE FOI RECEBIDO !!!';
            break;
    }

    function alerta($icon, $title, $text)
    {
        echo "<script type='text/javascript'>
       Swal.fire({
         type:'type',  
         icon: '$icon',
         title: '$title',
         text: '$text'
        
       }) 
       </script>";
    }

    alerta($icon, $title, $text);
}



$resultados = '';

?>

<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">

                <div class="card back-black">
                    <div class="card-header">
                        <a href="receber-list.php">
                            <button accesskey="q" title="ALT+K" type="submit" class="btn btn-warning"
                                data-toggle="modal" data-target="#modal-default"> <i style="font-size: 27px;"
                                    class="fa fa-arrow-circle-left" aria-hidden="true"></i> &nbsp;
                                <span style="font-size: 27px;">VOLTAR</span></button>
                        </a>
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        <a href="../producao/producao-list.php">
                            <button accesskey="p" title="ALT+P" type="submit" class="btn btn-danger" data-toggle="modal"
                                data-target="#modal-default"> <i style="font-size: 27px;" class="fa fa-truck"
                                    aria-hidden="true"></i> &nbsp;
                                <span style="font-size: 27px;">PRODUÇÃO</span></button>
                        </a>
                    </div>
                    <!-- /.card-header -->

                    <form action="./receber-item-cadastro.php" method="POST">

                        <div class="modal-body">

                            <div class="row">
                                <input type="hidden" value="<?= $id ?>" name="receber_id">
                                <div class="col-3">

                                    <div class="form-group">
                                        <label>Início da entrega</label>
                                        <input value="<?php
                                                        date_default_timezone_set('America/Sao_Paulo');
                                                        echo date('Y-m-d\TH:i:s', time()); ?>" type="datetime-local"
                                            class="form-control" name="data_inicio" required>
                                    </div>
                                </div>
                                <div class="col-4">

                                    <div class="form-group">
                                        <label>Final da entrega</label>
                                        <input value="<?php
                                                        date_default_timezone_set('America/Sao_Paulo');
                                                        echo date('Y-m-d\TH:i:s', time()); ?>" type="datetime-local"
                                            class="form-control" name="data_fim" required>
                                    </div>
                                </div>


                            </div>

                            <div class="row">

                                <div class="col-3">
                                    <label>Entregadores</label>
                                    <select class="form-control select2" style="width: 100%;" name="entregador_id"
                                        id="entregadores" onchange="rotas(this.value);" required>
                                        <option value=""> Selecione um entregador </option>
                                        <?php

                                        foreach ($entregadores as $item) {
                                            echo '<option style="text-transform: uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                                        }
                                        ?>

                                    </select>

                                </div>

                                <div class="col-4">
                                    <label>Rotas</label>
                                    <select class="form-control" name="rotas_id" id="rota" required></select>

                                </div>

                            </div>
                            <br>
                            <div class="row">
                                <div class="col-3">
                                    <div class="form-group">

                                        <label>Status</label>
                                        <div>
                                            <div class="form-check form-check-inline">
                                                <label class="form-control">
                                                    <input type="radio" name="setores" value="3" checked> Editorial
                                                </label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <label class="form-control ">
                                                    <input type="radio" name="setores" value="1"> E- commerce
                                                </label>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="col-4">
                                    <div class="form-group">

                                        <label>Serviços</label>
                                        <div>
                                            <div class="form-check form-check-inline">
                                                <label class="form-control ">
                                                    <input type="radio" name="servicos" value="3" checked> Boletos
                                                </label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <label class="form-control">
                                                    <input type="radio" name="servicos" value="4"> Cartões
                                                </label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <label class="form-control ">
                                                    <input type="radio" name="servicos" value="1"> Pequenos
                                                    volumes
                                                </label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <label class="form-control">
                                                    <input type="radio" name="servicos" value="5"> Grandes volumes
                                                </label>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <br>

                            <div class="row">

                                <div class="col-3">
                                    <label class="vermelho">Quantidade para entrega</label>
                                    <input type="text" name="qtd" value="" class="form-control menor" required>

                                </div>
                                <div class="col-4">
                                    <label class="vermelho"></label>
                                    <button name="enviar" class="btn btn-primary float-right" type="submit"
                                        <?= $block ?>> Entergar
                                    </button>

                                </div>

                            </div>

                        </div>


                    </form>

                </div>

            </div>

        </div>

    </div>

</section>