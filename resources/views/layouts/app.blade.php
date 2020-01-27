<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<meta name="csrf-token" content="{{ csrf_token() }}">

		<title>{{ config('app.name', 'SSEUL') }}</title>

		<link href="{{ asset('vendor/fontawesome-free/css/all.min.css') }}" rel="stylesheet" type="text/css">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

		<link href="{{ asset('css/sb-admin-2.min.css') }}" rel="stylesheet">

		@stack('style')

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body id="page-top">

		<div id="wrapper">
			<ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">
				<a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{ url('home') }}">
					<div class="sidebar-brand-icon rotate-n-15">
						<i class="fas fa-book-open"></i>
					</div>
					<div class="sidebar-brand-text mx-3">SSEUL<sup>BETA</sup></div>
				</a>

				@if (Auth::user()->rol == \App\Models\User::ADMINISTRADOR)
					<hr class="sidebar-divider">

					<li class="nav-item">
						<a class="nav-link" href="{{ url('usuarios') }}">
							<i class="fas fa-fw fa-users"></i>
							<span>Usuarios</span>
						</a>
					</li>
				@endif

				<hr class="sidebar-divider">

				<li class="nav-item">
					<a class="nav-link" href="{{ route('cargar.datos') }}">
						<i class="fas fa-fw fa-upload"></i>
						<span>Cargar datos</span>
					</a>
				</li>

				<hr class="sidebar-divider">

				<li class="nav-item">
					<a class="nav-link" href="{{ route('consultar.cohortes') }}">
						<i class="fas fa-fw fa-search"></i>
						<span>Consultar cohortes</span>
					</a>
				</li>

				<hr class="sidebar-divider">

				<li class="nav-item">
					<a class="nav-link" href="{{ route('comparar.cohortes') }}">
						<i class="fas fa-fw fa-exchange-alt"></i>
						<span>Comparar cohortes</span>
					</a>
				</li>

				<hr class="sidebar-divider">

				<li class="nav-item">
					<a class="nav-link" href="#">
						<i class="fas fa-fw fa-graduation-cap"></i>
						<span>Graduados</span>
					</a>
				</li>

				<hr class="sidebar-divider d-none d-md-block">

				<div class="text-center d-none d-md-inline">
					<button class="rounded-circle border-0" id="sidebarToggle"></button>
				</div>

			</ul>

			<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
					<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
						<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>

						
						<span>SISTEMA DE SEGUIMIENTO DE ESTUDIANTES EN LA UNIVERSIDAD LIBRE</span>

						<ul class="navbar-nav ml-auto">
							<div class="topbar-divider d-none d-sm-block"></div>

							<li class="nav-item dropdown no-arrow">
								<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<span class="mr-2 d-none d-lg-inline text-gray-600 small">{{ Auth::user()->name }}</span>
									<i class="fa fa-user"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
									<a class="dropdown-item" href="#">
										<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
										Perfil
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
										Salir
									</a>
								</div>
							</li>
						</ul>
					</nav>

					<div class="container-fluid">
						@yield('content')
					</div>
				</div>

				<footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; <a target="_blank" href="http://www.unilibre.edu.co/Bogota/">Universidad Libre de Colombia Sede Bosque Popular</a> {{ date("Y") }}</span>
						</div>
					</div>
				</footer>

			</div>

		</div>

		<a class="scroll-to-top rounded" href="#page-top">
			<i class="fas fa-angle-up"></i>
		</a>

		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="salirModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="salirModalLabel">¿Salir?</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">¿Salir del sistema?</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
						{!! Form::open(['route' => 'logout', 'method' => 'post']) !!}
						{!! Form::submit('Salir', ["class" => "btn btn-primary"]) !!}
						{!! Form::close() !!}
					</div>
				</div>
			</div>
		</div>

		<script src="{{ asset('vendor/jquery/jquery.min.js') }}"></script>
		<script src="{{ asset('vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

		<script src="{{ asset('vendor/jquery-easing/jquery.easing.min.js') }}"></script>

		<script src="{{ asset('js/sb-admin-2.min.js') }}"></script>

		<script src="{{ asset('vendor/chart.js/Chart.min.js') }}"></script>

		@stack('scripts')
	</body>
</html>
