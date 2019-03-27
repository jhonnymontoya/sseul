@extends('layouts.app')

@section('content')
<h3><i class="fa fa-search"></i> Datos del cohorte {{ $periodo }}</h3>

<br>

@if (Session::has("message"))
	<div class="card mb-4 py-1 border-left-success">
		<div class="card-body">
			{{ Session::get("message") }}
		</div>
	</div>
@endif

@if($datos->count())
	<div class="row">
		<div class="col-md-3">
			<a href="{{ route('consultar.cohortes') }}" class="btn btn-danger btn-sm">Volver</a>
		</div>
		<div class="col-md-6 text-center">
			{!! $datos->appends([])->render() !!}
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Código</th>
						<th>No. Identificación</th>
						<th>Nombres</th>
						<th>Email</th>
						<th>Movil</th>
					</tr>
				</thead>
				<tbody>
					@foreach($datos as $dato)
						<tr>
							<td>{{ $dato->codigo }}</td>
							<td>{{ number_format($dato->identificacion) }}</td>
							<td>{{ $dato->nombre }}</td>
							<td>
								@if($dato->tiene_email)
									<a href="mailto:{{ $dato->email }}" title="Enviar correo a {{ $dato->nombre }}">{{ $dato->email }}</a>
								@else
									N/A
								@endif
							</td>
							<td>
								@if($dato->tiene_movil)
									{{ $dato->movil_formateado }}
								@else
									N/A
								@endif
							</td>
						</tr>
					@endforeach
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<a href="{{ route('consultar.cohortes') }}" class="btn btn-danger btn-sm">Volver</a>
		</div>
		<div class="col-md-6 text-center">
			{!! $datos->appends([])->render() !!}
		</div>
	</div>
@else
	<h4>No se encontraron datos.</h4>
@endif


@endsection

@push('style')
@endpush

@push('scripts')
@endpush