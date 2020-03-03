<?php

namespace App\Http\Controllers;

use App\Http\Requests\Perfil\EditPerfilRequest;
use Illuminate\Http\Request;
use Session;
use Auth;

class PerfilController extends Controller
{
	public function __construct() {
		$this->middleware('auth');
	}

	public function index() {
		return view("perfil.index")->withUsuario(Auth::user());
	}

	public function edit() {
		return view("perfil.edit")->withUsuario(Auth::user());
	}

	public function update(EditPerfilRequest $request) {
		$usuario = Auth::user();

		$usuario->name = $request->name;
		$usuario->email = $request->email;
		$usuario->password = $request->password;
		$usuario->save();

		Session::flash("message", "Se ha actualizado su perfil");
		return redirect('perfil');
	}
}
