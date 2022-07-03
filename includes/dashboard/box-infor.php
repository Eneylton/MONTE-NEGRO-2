  <?php

  use App\Session\Login;

  $usuariologado = Login::getUsuarioLogado();

  $acesso = $usuariologado['acessos_id'];

  $ocorrencias_key = 0;

  foreach ($total_ocorrencias as $key) {

    $ocorrencias_key += $key->total;
  }

  ?>

  <div class="container-fluid">
      <!-- Small boxes (Stat box) -->
      <div class="row">
          <div class="col-lg-3 col-6" style="display:<?php

                                                  switch ($acesso) {
                                                    case '2':
                                                      echo "none";
                                                      break;
                                                    case '3':
                                                      echo "none";
                                                      break;
                                                    case '4':
                                                      echo "none";
                                                      break;

                                                    default:
                                                      echo "";
                                                      break;
                                                  }

                                                  ?>">
              <!-- small box -->
              <div class="small-box bg-primary">
                  <div class="inner">
                      <h3><?= $total_entrega  ?> &nbsp; <i class="ion ion-android-bicycle"></i></h3>

                      <p>TOTAL DE ENTREGAS POR MÊS</p>
                  </div>
                  <div class="icon">
                      <i class="ion ion-android-car"></i>
                  </div>

                  <a href="#" data-toggle="modal" data-target="#modal-data" class="small-box-footer">GERAR RELATÓRIOS <i
                          class="fas fa-arrow-circle-right"></i></a>
              </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6" style="display:<?php

                                                  switch ($acesso) {
                                                    case '2':
                                                      echo "none";
                                                      break;
                                                    case '3':
                                                      echo "";
                                                      break;
                                                    case '4':
                                                      echo "none";
                                                      break;

                                                    default:
                                                      echo "";
                                                      break;
                                                  }

                                                  ?>">
              <!-- small box -->
              <div class="small-box bg-warning">
                  <div class="inner">
                      <h3><?= $ocorrencias_key ?><sup style="font-size: 20px">% &nbsp;&nbsp;</sup><i
                              class="ion ion-android-car"></i>
                      </h3>

                      <p>TOTAL MENSAL DE OCORRÊNCIAS POR MÊS</p>
                  </div>
                  <div class="icon">
                      <i class="fa fa-motorcycle" aria-hidden="true"></i>
                  </div>
                  <a href="#" class="small-box-footer">GERAR RELATÓRIO <i class="fas fa-arrow-circle-right"></i></a>
              </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6" style="display:<?php

                                                  switch ($acesso) {
                                                    case '2':
                                                      echo "";
                                                      break;
                                                    case '3':
                                                      echo "none";
                                                      break;
                                                    case '4':
                                                      echo "none";
                                                      break;

                                                    default:
                                                      echo "";
                                                      break;
                                                  }

                                                  ?>">
              <!-- small box -->
              <div class="small-box bg-gray">
                  <div class="inner">
                      <h3>44</h3>

                      <p>User Registrations</p>
                  </div>
                  <div class="icon">
                      <i class="ion ion-person-add"></i>
                  </div>
                  <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
              </div>
          </div>
          <div class="col-lg-3 col-6" style="display:<?php

                                                  switch ($acesso) {
                                                    case '2':
                                                      echo "";
                                                      break;
                                                    case '3':
                                                      echo "none";
                                                      break;
                                                    case '4':
                                                      echo "none";
                                                      break;

                                                    default:
                                                      echo "";
                                                      break;
                                                  }

                                                  ?>">
              <!-- small box -->
              <div class="small-box bg-dark">
                  <div class="inner">
                      <h3>44</h3>

                      <p>User Registrations</p>
                  </div>
                  <div class="icon">
                      <i class="ion ion-person-add"></i>
                  </div>
                  <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
              </div>
          </div>
          <div class="col-lg-3 col-6" style="display:<?php

                                                  switch ($acesso) {
                                                    case '2':
                                                      echo "";
                                                      break;
                                                    case '3':
                                                      echo "none";
                                                      break;
                                                    case '4':
                                                      echo "none";
                                                      break;

                                                    default:
                                                      echo "none";
                                                      break;
                                                  }

                                                  ?>">
              <!-- small box -->
              <div class="small-box bg-navy">
                  <div class="inner">
                      <h3>44</h3>

                      <p>User Registrations</p>
                  </div>
                  <div class="icon">
                      <i class="ion ion-person-add"></i>
                  </div>
                  <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
              </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6" style="display:<?php

                                                  switch ($acesso) {
                                                    case '2':
                                                      echo "";
                                                      break;
                                                    case '3':
                                                      echo "";
                                                      break;
                                                    case '4':
                                                      echo "";
                                                      break;

                                                    default:
                                                      echo "none";
                                                      break;
                                                  }

                                                  ?>">
              <!-- small box -->
              <div class="small-box bg-black
">
                  <div class="inner">
                      <h3>65</h3>

                      <p>Unique Visitors</p>
                  </div>
                  <div class="icon">
                      <i class="ion ion-pie-graph"></i>
                  </div>
                  <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
              </div>
          </div>

      </div>

      <div class="row">
          <div class="col-lg-6" style="display:<?php

                                            switch ($acesso) {
                                              case '2':
                                                echo "none";
                                                break;
                                              case '3':
                                                echo "none";
                                                break;
                                              case '4':
                                                echo "none";
                                                break;

                                              default:
                                                echo "";
                                                break;
                                            }

                                            ?>">

              <div class="card">
                  <div class="card-header border-0">
                      <div class="d-flex justify-content-between">
                          <h3 class="card-title">
                              <P>PRODUÇÃO MENSAL ENTREGADORES</P>
                          </h3>
                          <div class="card-tools">
                              <h2 style="color:#ff0000"><button class="btn btn-outline-danger">DETALHADO</button></h2>
                          </div>
                      </div>
                  </div>
                  <div class="card-body">

                      <!-- /.d-flex -->

                      <div class="card-body">

                          <canvas id="myChart" width="400" height="130"></canvas>

                      </div>

                      <div class="d-flex flex-row justify-content-end">
                          <span class="mr-2 gd">
                              <i class="fas fa-square text-success"></i> PRODUÇÃO:
                              <?= $total_entrega ?>
                          </span>


                      </div>
                  </div>
              </div>

          </div>
          <div class="col-lg-6" style="display:<?php

                                            switch ($acesso) {
                                              case '2':
                                                echo "none";
                                                break;
                                              case '3':
                                                echo "none";
                                                break;
                                              case '4':
                                                echo "none";
                                                break;

                                              default:
                                                echo "";
                                                break;
                                            }

                                            ?>">
              <div class="card">
                  <div class="card-header border-0">
                      <div class="d-flex justify-content-between">
                          <h3 class="card-title">
                              <P>TOTAL MENSAL DE OCORRÊNCIAS POR MÊS</P>
                          </h3>
                          <div class="card-tools">
                              <h2 style="color:#ff0000"><button class="btn btn-outline-primary">DETALHADO</button></h2>
                          </div>
                      </div>
                  </div>
                  <div class="card-body">

                      <!-- /.d-flex -->

                      <div class="card-body">

                          <canvas id="myChart2" width="400" height="130"></canvas>

                      </div>

                      <div class="d-flex flex-row justify-content-end">
                          <span class="mr-2">
                              <i class="fas fa-square text-warning"></i> DEVOLUÇÕES:
                              <?= $ocorrencias_key ?>%

                          </span>


                      </div>
                  </div>
              </div>


          </div>

      </div>
  </div>



  <div class="modal fade" id="modal-data">
      <div class="modal-dialog modal-lg">
          <div class="modal-content ">
              <form action="pages/carteira/gerar-pdf.php" method="GET" enctype="multipart/form-data">
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

                              <div class="col-lg-6 col-6">
                                  <input class="form-control" type="date" value="<?php date_default_timezone_set('America/Sao_Paulo');
                                                                  echo date('Y-m-d') ?>" name="dataInicio">
                              </div>


                              <div class="col-lg-6 col-6">
                                  <input class="form-control" type="date" value="<?php date_default_timezone_set('America/Sao_Paulo');
                                                                  echo date('Y-m-d') ?>" name="dataFim">
                              </div>

                              <br>
                              <br>
                              <br>
                              <div class="col-12">
                                  <div class="form-group">
                                      <label>ENTREGADORES</label>
                                      <select class="form-control select" style="width: 100%;" name="id_caixa" required>
                                          <option value=""> SELECIONE UM ENTREGADOR </option>
                                          <?php

                      foreach ($entregadores as $item) {
                        echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                      }
                      ?>

                                      </select>
                                  </div>
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