const base_URL = 'http://localhost:8000'
function bloquear() {
    $.blockUI({
        css: {
            border: "none",
            padding: "15px",
            backgroundColor: "transparent",
            color: "#fff",
            "z-index": 9999
        },
        message:
            '<div class="loadingio-spinner-ripple-kpzf7g4rqf"><div class="ldio-s13gk5kbh9a"><div></div><div></div></div></div>'
    })
}

function desbloquear() {
    $.unblockUI();
}

!(function(t) {
    t(window).on("load", function() {
        t("#status").fadeOut(),
            t("#preloader")
                .delay(350)
                .fadeOut("slow");
    })
})

$(document).ready( function () {
    $('.dataTables').DataTable();
    $('.select2').select2();

    /*sidebar functions*/
    $(".select2modal").select2({
        dropdownParent: $("#lista-cliente-modal")
    });
    /*fim sidebar functions*/

    $('#listarClienteServico').click(function(){
        let client = $('#listaCliente').val()

        if (0 == client || '' == client || null == client) {
            Swal.fire(
                'Atenção!',
                'Por Favor Selecione um Cliente',
                'info'
              )
        } else {
            bloquear();
            window.location =  base_URL+'/dadosCliente/'+client
        }
    })
});
