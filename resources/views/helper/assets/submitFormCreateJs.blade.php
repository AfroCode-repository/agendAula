
$('form[name="formCreate"]').submit(function (){
    event.preventDefault();
    bloquear();
    $.ajax({
        url: "{{ $url }}",
        type: 'POST',
        data: $(this).serialize(),
        dataType: 'json',
        success: function(response){
            if(true == response.success){
                desbloquear()
                Swal.fire({
                    title: 'Êxito!',
                    text: response.message,
                    icon: 'success',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'Ok'
                    }).then(function () {
                        bloquear();
                        window.location = "{{ $redirect }}";
                })
            }else{
                desbloquear();
                Swal.fire(
                    'Atenção!',
                    response.message,
                    'warning'
                )
            }
        }
    });//fim ajax
});
