<?php

namespace App\Http\Controllers;

use App\Models\User;
use Auth;
use Illuminate\Http\Request;

class UsuariosController extends Controller
{
	public function __construct() {
		$this->middleware('auth');
	}

	public function index(Request $request) {
		$this->verificarAdministrador();
		$users = User::paginate();
		return view("usuarios.index")->withUsuarios($users);
	}

	public function create() {
		$this->verificarAdministrador();
		$roles = [
			"USUARIO" => 'Usuario',
			"ADMINISTRADOR" => 'Administrador'
		];
		return view("usuarios.create")->withRoles($roles);
	}

	public function verificarAdministrador() {
		if(Auth::user()->rol != User::ADMINISTRADOR) {
			abort(401, "No posee el permiso para esta consulta");
		}
	}
}
