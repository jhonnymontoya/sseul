@extends('layouts.app')

@section('content')
	<h3><i class="fa fa-users"></i> Usuarios</h3>

	<br>

	@if (Session::has("message"))
		<div class="card mb-4 py-1 border-left-success">
			<div class="card-body">
				{{ Session::get("message") }}
			</div>
		</div>
	@endif

	{!! Form::model($usuario, ['route' => ['usuarios.edit.put', $usuario], 'method' => 'put']) !!}
	<div class="mb-12">
		<div class="form-group">
			<label class="control-label">
				Nombre
			</label>
			{!! Form::text('name', null, ['class' => ['form-control', ($errors->has('name') ? 'is-invalid' : '')], 'autocomplete' => 'off', 'placeholder' => 'Nombre']) !!}
			@if ($errors->has('name'))
				<span class="invalid-feedback">{{ $errors->first('name') }}</span>
			@endif
		</div>
	</div>

	<div class="mb-12">
		<div class="form-group">
			<label class="control-label">
				Rol
			</label>
			{!! Form::select('rol', $roles, null, ['class' => ['form-control', ($errors->has('rol') ? 'is-invalid' : '')], 'autocomplete' => 'off']) !!}
			@if ($errors->has('rol'))
				<span class="invalid-feedback">{{ $errors->first('rol') }}</span>
			@endif
		</div>
	</div>

	<div class="mb-12">
		<div class="form-group">
			<label class="control-label">
				Correo electrónico
			</label>
			{!! Form::text('email', null, ['class' => ['form-control', ($errors->has('email') ? 'is-invalid' : '')], 'autocomplete' => 'off', 'placeholder' => 'Correo electrónico']) !!}
			@if ($errors->has('email'))
				<span class="invalid-feedback">{{ $errors->first('email') }}</span>
			@endif
		</div>
	</div>

	<div class="mb-12">
		<hr>
	</div>

	<div class="mb-12">
		<div class="form-group">
			<label class="control-label">
				Contraseña
			</label>
			{!! Form::password('password', ['class' => ['form-control', ($errors->has('password') ? 'is-invalid' : '')], 'autocomplete' => 'off', 'placeholder' => 'Contraseña']) !!}
			@if ($errors->has('password'))
				<span class="invalid-feedback">{{ $errors->first('password') }}</span>
			@endif
		</div>
	</div>

	<div class="mb-12">
		<div class="form-group">
			<label class="control-label">
				Confirmar contraseña
			</label>
			{!! Form::password('confirm_password', ['class' => ['form-control', ($errors->has('confirm_password') ? 'is-invalid' : '')], 'autocomplete' => 'off', 'placeholder' => 'Confirmar contraseña']) !!}
			@if ($errors->has('confirm_password'))
				<span class="invalid-feedback">{{ $errors->first('confirm_password') }}</span>
			@endif
		</div>
	</div>

	<div class="row">
		<div class="col-md-1">
			{!! Form::submit("Modificar", ["class" => "btn btn-danger btn-sm"]) !!}
		</div>
		<div class="col-md-1">
			<a href="{{ url('usuarios') }}" class="btn btn-secondary btn-sm">Cancelar</a>
		</div>
	</div>
	{!! Form::close() !!}

@endsection

@push('style')
@endpush

@push('scripts')
@endpush