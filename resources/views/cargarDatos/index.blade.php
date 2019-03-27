@extends('layouts.app')

@section('content')
<h3><i class="fa fa-upload"></i> Cargar datos</h3>

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
		<a href="{{ url('cargarDatos/nuevo') }}" class="btn btn-danger">Subir nuevo archivo</a>
	</div>
</div>

<br>

@if($archivos->count())
	<div class="row">
		<div class="col-md-12 table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Nombre archivo</th>
						<th>Cargado por</th>
						<th>Fecha carga</th>
						<th>No. Registros</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					@foreach($archivos as $archivo)
						<tr>
							<td>{{ $archivo->nombre }}</td>
							<td>{{ $archivo->cargado_por }}</td>
							<td>{{ $archivo->created_at }} ({{ $archivo->created_at->diffForHumans() }})</td>
							<td>{{ number_format($archivo->datos->count()) }}</td>
							<td>
								<a class="dropdown-item" href="#" data-toggle="modal" data-target="#borrarArchivo" data-nombre="{{ $archivo->nombre }}" data-id="{{ $archivo->id }}">
									<i class="fa fa-trash"></i>
								</a>
							</td>
						</tr>
					@endforeach
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 text-center">
			{!! $archivos->appends([])->render() !!}
		</div>
	</div>
@else
	<h4>No se encontraron datos.</h4>
@endif

<div class="modal fade" id="borrarArchivo" tabindex="-1" role="dialog" aria-labelledby="borrarArchivoLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="borrarArchivoLabel">¿Borrar archivo?</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">¿Desea borrar el archivo '<span id="borrarArchivoNombre"></span>'?</div>
			<div class="modal-footer">
				<button class="btn btn-danger" type="button" data-dismiss="modal">Cancelar</button>
				{!! Form::open(['route' => ['cargar.datos.borrar', ":id"], 'method' => 'delete', "id" => "frmEliminarArchivo"]) !!}
				{!! Form::submit('Eliminar', ["class" => "btn btn-primary"]) !!}
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>
@endsection

@push('style')
@endpush

@push('scripts')
<script type="text/javascript">
	$(function(){
		$("#borrarArchivo").on("show.bs.modal", function(event){
			var info = $(event.relatedTarget);
			var modal = $(this);
			var id = info.data("id");
			var nombre = info.data("nombre");
			modal.find("#borrarArchivoNombre").text(nombre);
			frm = modal.find("#frmEliminarArchivo");
			action = frm.attr("action");
			action = action.replace(":id", id);
			frm.attr("action", action);
		});
	});
</script>
@endpush