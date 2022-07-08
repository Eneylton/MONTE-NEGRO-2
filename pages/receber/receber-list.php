<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Cliente;
use App\Entidy\Entregador;
use App\Entidy\Gaiola;
use App\Entidy\Receber;
use App\Entidy\Regiao;
use App\Entidy\Setor;
use App\Session\Login;

define('TITLE', 'Receber Itens');
define('BRAND', 'Itens');

Login::requireLogin();

$usuariologado = Login::getUsuarioLogado();

$acesso = $usuariologado['acessos_id'];

$usuario = $usuariologado['id'];
$user_acesso = $usuariologado['acessos_id'];


if (isset($_GET['acao'])) {
    if ($_GET['acao'] == 'up') {

        if (isset($_POST['val'])) {

            foreach ($_POST['val'] as $id => $valor) {

                $item = Receber::getID('*', 'receber', $id, null, null);

                $val1 = $item->qtd;

                if ($item->disponivel != 0) {

                    $item->qtd = $valor;
                    $item->disponivel  = $valor;
                }
                $item->atualizar();
            }
        }
    }
}


if (isset($_POST['id_regioes'])) {
    $id_regioes = $_POST['id_regioes'];

    $servicos = Entregador::getList('*', 'entregadores', 'regioes_id= ' . $id_regioes, null, null);

    foreach ($servicos as $item) {
        echo '
            

              <option value="' . $item->id . '">' . $item->nome . '</option>';
    }
}
if (isset($_POST['id'])) {
    $id = $_POST['id'];

    $servicos = Entregador::getList('*', 'servicos', 'setores_id= ' . $id, null, null);

    foreach ($servicos as $item) {
        echo '
            

              <option value="' . $item->id . '">' . $item->nome . '</option>';
    }
}

if ($user_acesso == 1) {

    $listar = Receber::getList('r.id AS id,
r.data AS data,
r.qtd AS qtd,
r.clientes_id AS clientes_id,
r.disponivel AS disponivel,
c.nome AS cliente,
g.nome as baias,
st.nome AS setores,
s.nome AS servicos ', ' receber AS r
INNER JOIN
clientes AS c ON (r.clientes_id = c.id)
INNER JOIN
gaiolas AS g ON (r.gaiolas_id = g.id)
INNER JOIN
setores AS st ON (r.setores_id = st.id)
INNER JOIN
servicos AS s ON (r.servicos_id = s.id)', null, 'r.id DESC LIMIT 50', null);
} else {
    $listar = Receber::getList('r.id AS id,
r.data AS data,
r.qtd AS qtd,
r.clientes_id AS clientes_id,
r.disponivel AS disponivel,
c.nome AS cliente,
g.nome as baias,
st.nome AS setores,
s.nome AS servicos ', ' receber AS r
INNER JOIN
clientes AS c ON (r.clientes_id = c.id)
INNER JOIN
gaiolas AS g ON (r.gaiolas_id = g.id)
INNER JOIN
setores AS st ON (r.setores_id = st.id)
INNER JOIN
servicos AS s ON (r.servicos_id = s.id)', 'r.usuarios_id=' . $usuario, 'r.id DESC LIMIT 50', null);
}

$clientes = Cliente::getList('*', 'clientes');
$baias    = Gaiola::getList('*', 'gaiolas', null, 'nome ASC');
$setores =  Setor::getList('*', 'setores', null, 'nome ASC');
$regioes =  Regiao::getList('*', 'regioes', null, 'nome ASC');


include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/receber/receber-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
$("#setores").on("change", function() {

    var idEstado = $("#setores").val();
    $.ajax({
        url: 'receber-list.php',
        type: 'POST',
        data: {
            id: idEstado
        },

        success: function(data) {
            $("#servicos").css({
                'display': 'block'
            });
            $("#servicos").html(data);
        }
    })

});
</script>

<script>
$(document).ready(function() {
    $('.editbtn').on('click', function() {
        $('#editmodal').modal('show');

        $tr = $(this).closest('tr');

        var data = $tr.children("td").map(function() {
            return $(this).text();
        }).get();

        $('#id').val(data[0]);
        $('#data').val(data[1]);
        $('#qtd').val(data[2]);
        $('#disponivel').val(data[3]);
        $('#clientes_id').val(data[4]);

    });
});
</script>

<script>
$(document).ready(function() {
    $('.editbtn2').on('click', function() {
        $('#editmodal2').modal('show');

        $tr = $(this).closest('tr');

        var data = $tr.children("td").map(function() {
            return $(this).text();
        }).get();

        $('#id2').val(data[0]);
        $('#data2').val(data[1]);
        $('#disponivel2').val(data[2]);
        $('#clientes_id2').val(data[3]);
        $('#clid2').val(data[4]);
        $('#cli').val(data[5]);
        $('#quantidade').val(data[6]);


    });
});
</script>


<script>
$(document).ready(function() {
    $("#test").CreateMultiCheckBox({
        width: '100%',
        defaultText: 'SELECIONE AS ROTAS',
        height: '250px'
    });
});

$(document).ready(function() {
    $(document).on("click", ".MultiCheckBox", function() {
        var detail = $(this).next();
        detail.show();
    });

    $(document).on("click", ".MultiCheckBoxDetailHeader input", function(e) {
        e.stopPropagation();
        var hc = $(this).prop("checked");
        $(this).closest(".MultiCheckBoxDetail").find(".MultiCheckBoxDetailBody input").prop("checked",
            hc);
        $(this).closest(".MultiCheckBoxDetail").next().UpdateSelect();
    });

    $(document).on("click", ".MultiCheckBoxDetailHeader", function(e) {
        var inp = $(this).find("input");
        var chk = inp.prop("checked");
        inp.prop("checked", !chk);
        $(this).closest(".MultiCheckBoxDetail").find(".MultiCheckBoxDetailBody input").prop("checked", !
            chk);
        $(this).closest(".MultiCheckBoxDetail").next().UpdateSelect();
    });

    $(document).on("click", ".MultiCheckBoxDetail .cont input", function(e) {
        e.stopPropagation();
        $(this).closest(".MultiCheckBoxDetail").next().UpdateSelect();

        var val = ($(".MultiCheckBoxDetailBody input:checked").length == $(
            ".MultiCheckBoxDetailBody input").length)
        $(".MultiCheckBoxDetailHeader input").prop("checked", val);
    });

    $(document).on("click", ".MultiCheckBoxDetail .cont", function(e) {
        var inp = $(this).find("input");
        var chk = inp.prop("checked");
        inp.prop("checked", !chk);

        var multiCheckBoxDetail = $(this).closest(".MultiCheckBoxDetail");
        var multiCheckBoxDetailBody = $(this).closest(".MultiCheckBoxDetailBody");
        multiCheckBoxDetail.next().UpdateSelect();

        var val = ($(".MultiCheckBoxDetailBody input:checked").length == $(
            ".MultiCheckBoxDetailBody input").length)
        $(".MultiCheckBoxDetailHeader input").prop("checked", val);
    });

    $(document).mouseup(function(e) {
        var container = $(".MultiCheckBoxDetail");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            container.hide();
        }
    });
});

var defaultMultiCheckBoxOption = {
    width: 'auto',
    defaultText: 'SELECIONE AS ROTAS',
    height: '200px'
};

jQuery.fn.extend({
    CreateMultiCheckBox: function(options) {

        var localOption = {};
        localOption.width = (options != null && options.width != null && options.width != undefined) ?
            options.width : defaultMultiCheckBoxOption.width;
        localOption.defaultText = (options != null && options.defaultText != null && options.defaultText !=
            undefined) ? options.defaultText : defaultMultiCheckBoxOption.defaultText;
        localOption.height = (options != null && options.height != null && options.height != undefined) ?
            options.height : defaultMultiCheckBoxOption.height;

        this.hide();
        this.attr("multiple", "multiple");
        var divSel = $("<div class='MultiCheckBox'>" + localOption.defaultText +
            "<span class='k-icon k-i-arrow-60-down'><svg aria-hidden='true' focusable='false' data-prefix='fas' data-icon='sort-down' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 320 512' class='svg-inline--fa fa-sort-down fa-w-10 fa-2x'><path fill='currentColor' d='M41 288h238c21.4 0 32.1 25.9 17 41L177 448c-9.4 9.4-24.6 9.4-33.9 0L24 329c-15.1-15.1-4.4-41 17-41z' class=''></path></svg></span></div>"
        ).insertBefore(this);
        divSel.css({
            "width": localOption.width
        });

        var detail = $(
            "<div class='MultiCheckBoxDetail'><div class='MultiCheckBoxDetailHeader'><input type='checkbox' class='mulinput' value='-1982' /><div>SELECIONAR TODOS</div></div><div class='MultiCheckBoxDetailBody'></div></div>"
        ).insertAfter(divSel);
        detail.css({
            "width": parseInt(options.width) + 10,
            "max-height": localOption.height
        });
        var multiCheckBoxDetailBody = detail.find(".MultiCheckBoxDetailBody");

        this.find("option").each(function() {
            var val = $(this).attr("value");

            if (val == undefined)
                val = '';

            multiCheckBoxDetailBody.append(
                "<div class='cont'><div style='padding-right:7px'><input type='checkbox' class='mulinput' value='" +
                val + "' /></div><div>" + $(this).text() + "</div></div>");
        });

        multiCheckBoxDetailBody.css("max-height", (parseInt($(".MultiCheckBoxDetail").css("max-height")) -
            28) + "px");
    },
    UpdateSelect: function() {
        var arr = [];

        this.prev().find(".mulinput:checked").each(function() {
            arr.push($(this).val());
        });

        this.val(arr);
    },
});
</script>

<script>
$("#quantidade").on("change", function() {

    var qtd = $("#quantidade").val();
    $.ajax({
        url: 'receber-list.php',
        type: 'POST',
        data: {
            id: qtd
        }

    })

});
</script>



<script>
$("#regioes").on("change", function() {

    var id = $("#regioes").val();
    $.ajax({
        url: 'receber-list.php',
        type: 'POST',
        data: {
            id_regioes: id
        },

        success: function(data) {
            $("#entregadores").css({
                'display': 'block'
            });
            $("#entregadores").html(data);
        }
    })

});
</script>


<script>
async function Entregar(id) {
    const dadosResp = await fetch('receber-entreg-modal.php?id=' + id);
    const result = await dadosResp.json();

    const entregModal = new bootstrap.Modal(document.getElementById("entregModal"));
    entregModal.show();
    document.querySelector(".end-modal").innerHTML = result['dados'];

}
</script>