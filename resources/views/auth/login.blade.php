@extends('layouts.general')

@section('content')
<div class="row justify-content-center">
<div class="col-xl-10 col-lg-12 col-md-9">
	<div class="card o-hidden border-0 shadow-lg my-5">
		<div class="card-body p-0">
			<div class="row">
				<div class="col-lg-6 d-none d-lg-block text-center">
					<br>
					<img src="{{ asset('img/logo_ul.png') }}" width="85%">
				</div>
				<div class="col-lg-6">
					<div class="p-5">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">Inicie sesión</h1>
						</div>
						{!! Form::open(["route" => "login", "method" => "post", "class" => "user"]) !!}
						<div class="form-group">
							{!! Form::text("email", null, ["class" => "form-control form-control-user", "placeholder" => "Correo electrónico", "autocomplete" => "off"]) !!}
						</div>
						<div class="form-group">
							{!! Form::password("password", ["class" => "form-control form-control-user", "placeholder" => "Contraseña"]) !!}
						</div>
						{!! Form::submit("Ingresar", ["class" => "btn btn-danger btn-user btn-block"]) !!}
						{!! Form::close() !!}
						<hr>
						<div class="text-center">
						<a class="small" href="#">Olvidé mi contraseña</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
@endsection
