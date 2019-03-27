@extends('layouts.app')

@section('content')
<h3><i class="fa fa-upload"></i> Cargar datos</h3>
<br>
@if ($errors->count())
	<div class="card mb-4 py-1 border-left-danger">
		<div class="card-body">
			{{ $errors->first("archivo") }}
		</div>
	</div>
@endif
<hr>
{!! Form::open(["url" => "cargarDatos/nuevo", "method" => "post", "files" => true]) !!}
<div class="row">
	<div class="col-md-3">
		<div class="form-group">
			<label>Archivo de estudiantes</label>
			{!! Form::file('archivo'); !!}
		</div>
	</div>
	<div class="col-md-3">
		<label>&nbsp;</label><br>
		<a href="{{ asset('plantillas/sseul.csv') }}" class="btn btn-info btn-sm"><i class="fa fa-download"></i> Descargar plantilla</a>
	</div>
</div>
<br>
<div class="row">
	<div class="col-md-1">
		{!! Form::submit("Cargar", ["class" => "btn btn-danger btn-sm"]) !!}
	</div>
	<div class="col-md-1">
		<a href="{{ route('cargar.datos') }}" class="btn btn-secondary btn-sm">Volver</a>
	</div>
</div>
{!! Form::close() !!}
@endsection
