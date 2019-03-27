@extends('layouts.app')

@section('content')
<h3><i class="fa fa-search"></i> Consultar cohortes</h3>

<br>

@if (Session::has("message"))
	<div class="card mb-4 py-1 border-left-success">
		<div class="card-body">
			{{ Session::get("message") }}
		</div>
	</div>
@endif

@if ($errors->count())
	<div class="card mb-4 py-1 border-left-danger">
		<div class="card-body">
			{{ $errors->first("periodo") }}
		</div>
	</div>
@endif

@if($cohortes->count())
	<div class="row">
		<div class="col-md-12 table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Cohorte</th>
						<th>No. Registros</th>
						<th>Diferencia</th>
						<th>Diferencia acumulada</th>
					</tr>
				</thead>
				<tbody>
					@foreach($cohortes as $cohorte)
						<tr>
							<td><a href="{{ route('consultar.cohortes.ver', $cohorte->periodo) }}">{{ $cohorte->periodo }}</a></td>
							<td>{{ number_format($cohorte->total) }}</td>
							<td>{{ number_format($cohorte->diferencia) }}</td>
							<td>{{ number_format($cohorte->diferencia_acumulada) }}</td>
						</tr>
					@endforeach
				</tbody>
			</table>
		</div>
	</div>
@else
	<h4>No se encontraron cohortes.</h4>
@endif

@endsection

@push('style')
@endpush

@push('scripts')
@endpush