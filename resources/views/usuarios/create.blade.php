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

	<div class="mb-12">
		<div class="form-group {{ ($errors->has('nombre')?'has-error':'') }}">
			<label class="control-label">
				@if ($errors->has('nombre'))
					<i class="fa fa-times-circle-o"></i>
				@endif
				Nombre
			</label>
			{!! Form::text('nombre', null, ['class' => 'form-control', 'autocomplete' => 'off', 'placeholder' => 'Nombre']) !!}
			@if ($errors->has('nombre'))
				<span class="help-block">{{ $errors->first('nombre') }}</span>
			@endif
		</div>
	</div>

	<div class="mb-12">
		<div class="form-group {{ ($errors->has('rol')?'has-error':'') }}">
			<label class="control-label">
				@if ($errors->has('rol'))
					<i class="fa fa-times-circle-o"></i>
				@endif
				Rol
			</label>
			{!! Form::select('rol', $roles, null, ['class' => 'form-control select2', 'autocomplete' => 'off']) !!}
			@if ($errors->has('rol'))
				<span class="help-block">{{ $errors->first('rol') }}</span>
			@endif
		</div>
	</div>

	<div class="mb-12">
		<div class="form-group {{ ($errors->has('mail')?'has-error':'') }}">
			<label class="control-label">
				@if ($errors->has('mail'))
					<i class="fa fa-times-circle-o"></i>
				@endif
				Correo electrónico
			</label>
			{!! Form::text('mail', null, ['class' => 'form-control', 'autocomplete' => 'off', 'placeholder' => 'Correo electrónico']) !!}
			@if ($errors->has('mail'))
				<span class="help-block">{{ $errors->first('mail') }}</span>
			@endif
		</div>
	</div>

@endsection

@push('style')
@endpush

@push('scripts')
@endpush