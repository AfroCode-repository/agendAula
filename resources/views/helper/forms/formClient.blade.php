<form class="form-post-Cliente" autocomplete="off" name="{{ $typeForm }}">
    @csrf
    <h4 class="header-title">Dados Do Cliente</h4>
    <p class="text-muted font-14">
        Informe os dados cadastrais do cliente
    </p>
    <div class="row">

        @if (true == $id)
                <input type="hidden" class="form-control id" name="id" required />
        @endif

        <input type="hidden" class="form-control id_company" value="{!! $id_company !!}" name="id_company" required />

        <div class="col-md-6 spaceForm">
            <label for="name" class="form-label">Nome</label>
            <input type="text" name="name" id="name" class="form-control">
        </div>
        <div class="col-md-6 spaceForm">
            <label for="register" class="form-label">Registro</label>
            <input type="text" name="register" id="register" class="form-control">
        </div>

        <div class="col-md-12 spaceForm">
            <label for="simpleinput" class="form-label">Endereço</label>
            <input type="text" name="address" id="address" class="form-control">
        </div>

        <div class="col-md-4 spaceForm">
            <label for="city" class="form-label">Cidade</label>
            <input type="text" id="city" name="city" class="form-control">
        </div>

        <div class="col-md-4 spaceForm">
            <label for="state" class="form-label">Estado</label>
            <input type="text" id="state" name="state" class="form-control">
        </div>

        <div class="col-md-4 spaceForm">
            <label for="postal_code" class="form-label">Codigo Postal</label>
            <input type="text" id="postal_code" name="postal_code" class="form-control">
        </div>
        <div class="spaceForm"></div>
        <hr>
        <h4 class="header-title">dados de Telefones</h4>
        <p class="text-muted font-14">
            Informe pelo menos 1 Telefone
        </p>
        <?php
            for ($i=1; $i <= 3; $i++) {
                if (1 === $i) {
                    $required = 'required';
                }else{
                    $required = '';
                }
                ?>
                <div class="col-md-4 spaceForm">
                    <label for="phone_{{$i}}" class="form-label">Telefone {{ (1 === $i) ? ' Principal' : $i ; }}</label>
                    <input type="text" id="phone_{{$i}}" name="phone_{{$i}}" {{$required}} class="form-control" data-toggle="input-mask" data-mask-format="(000) 000-0000">
                </div>
                <div class="col-md-4 spaceForm">
                    <label for="typePhone_{{$i}}" class="form-label">tipo {{ (1 === $i) ? ' Principal' : $i ; }}</label>
                    <select class="form-control select2" id="typePhone_{{$i}}" name="typePhone_{{$i}}" {{$required}}>
                        <option value="" >selecione uma opção</option>
                        <option value="Comercial">Comercial</option>
                        <option value="Pessoal">Pessoal</option>
                        <option value="ND">Não sabe</option>
                    </select>
                </div>
                <div class="col-md-4 spaceForm">
                    <label for="callSms_{{$i}}" class="form-label">Aceita ligação e Mensagem {{ (1 === $i) ? ' Principal' : $i ; }}</label>
                    <select class="form-control select2" id="callSms_{{$i}}" name="callSms_{{$i}}" {{$required}}>
                        <option value="" >selecione uma opção</option>
                        <option value="Y">Sim</option>
                        <option value="N">Não</option>
                        <option value="ND">Não sabe</option>
                    </select>
                </div>
            <?php } ?>
        <div class="spaceForm"></div>
        <hr>
        <h4 class="header-title">dados de Emails</h4>
        <p class="text-muted font-14">
            Informe pelo menos 1 Email
        </p>
        <?php
            for ($i=1; $i <= 3; $i++) {
                ?>
                <div class="col-md-4 spaceForm">
                    <label for="email_{{$i}}" class="form-label">Email {{ (1 === $i) ? 'Principal' : $i ; }}</label>
                    <input type="email" id="email_{{$i}}" name="email_{{$i}}" class="form-control">
                </div>
                <div class="col-md-4 spaceForm">
                    <label for="typeEmail_{{$i}}" class="form-label">tipo {{ (1 === $i) ? 'Principal' : $i ; }}</label>
                    <select class="form-control select2" id="typeEmail_{{$i}}" name="typeEmail_{{$i}}">
                        <option value="" >selecione uma opção</option>
                        <option value="Comercial">Comercial</option>
                        <option value="Pessoal">Pessoal</option>
                        <option value="ND">Não sabe</option>
                    </select>
                </div>
                <div class="col-md-4 spaceForm">
                    <label for="emailMarketing_{{$i}}" class="form-label">Aceita Email Marketing {{ (1 === $i) ? 'Principal' : $i ; }}</label>
                    <select class="form-control select2" id="emailMarketing_{{$i}}" name="emailMarketing_{{$i}}">
                        <option value="" >selecione uma opção</option>
                        <option value="Y">Sim</option>
                        <option value="N">Não</option>
                        <option value="ND">Não sabe</option>
                    </select>
                </div>
            <?php } ?>
        <div class="spaceForm"></div>
        <hr>
        <div class="form-group col-md-12">
                <center><button type="submit" class="{{ $classSubmit }}">{{ $submitText }}</a></center>
        </div>
    </div>
</form>
