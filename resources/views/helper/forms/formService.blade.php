<form class="form-post-Cliente" autocomplete="off" name="{{ $typeForm }}">
    @csrf
    <h4 class="header-title">Dados Do Serviço</h4>
    <p class="text-muted font-14">
        {{ $description_title }}
    </p>
    <div class="row">

        @if (true == $id)
                <input type="hidden" class="form-control id" name="id" required />
        @endif

        <input type="hidden" class="form-control id_company" value="{!! $id_company !!}" name="id_company" required />

        <div class="col-md-6 spaceForm">
            <label for="name" class="form-label">Nome</label>
            <input type="text" name="name" id="name" class="form-control name">
        </div>
        <div class="col-md-6 spaceForm">
            <label for="price" class="form-label">Preço Base</label>
            <input type="text" name="price" id="price" class="form-control price" data-toggle="input-mask" data-mask-format="000.000.000.000,00" data-reverse="true">
        </div>
        <div class="spaceForm"></div>
        <hr>
        <div class="form-group col-md-12">

            @if ('salvar' == $iconeSubmit)
                <center><a type="submit" class="{{ $classSubmit }}"><i class="far fa-save"></i> {{ $submitText }}</a></center>
            @else
                <center><a type="submit" class="{{ $classSubmit }}"><i class="far fa-edit"></i> {{ $submitText }}</a></center>
            @endif

        </div>
    </div>
</form>
