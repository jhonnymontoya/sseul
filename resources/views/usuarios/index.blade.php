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

<div class="row">
	<div class="col-md-12">
		<a href="{{ url('usuarios/create') }}" class="btn btn-danger">Nuevo usuario</a>
	</div>
</div>

<br>
@if($usuarios->count())
	<div class="row">
		<div class="col-md-12 table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Rol</th>
						<th>Correo</th>
						<th>Fecha de creación</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					@foreach($usuarios as $usuario)
						<tr>
							<td>
								<a href="{{ route('usuarios.edit', $usuario) }}">
									{{ $usuario->name }}
								</a>
							</td>
							<td>{{ $usuario->rol }}</td>
							<td>
								<a href="mailto:{{ $usuario->email }}?subject=Contacto desde SSEUL&body=Contacto desde SSEUL">
									{{ $usuario->email }}
								</a>
							</td>
							<td>{{ $usuario->created_at }} ({{ $usuario->created_at->diffForHumans() }})</td>
							<td>
								<a href="{{ route('usuarios.edit', $usuario) }}">
									<i class="fa fa-edit"></i>
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
			{!! $usuarios->appends([])->render() !!}
		</div>
	</div>
@else
	<h4>No se encontraron usuarios.</h4>
@endif
@endsection

@push('style')
@endpush

@push('scripts')
@endpush