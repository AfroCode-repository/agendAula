$.ajax({
    url: "{{ $url }}",
    type: 'POST',
    data: {id:id,status:status,"_token": "{{ csrf_token() }}",},
    dataType: 'json',
    success: function(response){
        desbloquear();
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
});// fim ajax mudar status
