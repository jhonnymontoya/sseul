@extends('layouts.app')

@section('content')
<h3><i class="fa fa-user"></i> Perfil</h3>

<br>

@if (Session::has("message"))
	<div class="card mb-4 py-1 border-left-success">
		<div class="card-body">
			{{ Session::get("message") }}
		</div>
	</div>
@endif

<div class="row">
	<div class="col-md-12">
		<a href="{{ url('perfil/edit') }}" class="btn btn-danger">Editar perfil</a>
	</div>
</div>

<br>

<div class="mb-12">
	<div class="form-group">
		<label class="control-label">
			Nombre
		</label>
		{!! Form::text('name', $usuario->name, ['class' => 'form-control', 'autocomplete' => 'off', 'placeholder' => 'Nombre', 'disabled']) !!}
	</div>
</div>

<div class="mb-12">
	<div class="form-group">
		<label class="control-label">
			Correo electrónico
		</label>
		{!! Form::text('email', $usuario->email, ['class' => 'form-control', 'autocomplete' => 'off', 'placeholder' => 'Correo electrónico', 'disabled']) !!}
	</div>
</div>

@endsection

@push('style')
@endpush

@push('scripts')
@endpush
