@extends('layouts.app')

@section('content')
<div class="container">
	<h3>Bienvenido {{ Auth::user()->name }}.</h3>
</div>
@endsection
