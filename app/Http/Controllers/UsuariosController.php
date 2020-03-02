<?php

namespace App\Http\Controllers;

use App\Models\User;
use Auth;
use Illuminate\Http\Request;
use App\Http\Requests\Usuarios\CrearUsuarioRequest;
use Session;


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

	public function post(CrearUsuarioRequest $request) {
		$this->verificarAdministrador();

		$usuario = new User;
		$usuario->name = $request->nombre;
		$usuario->rol = $request->rol;
		$usuario->email = $request->mail;
		$usuario->password = bcrypt($request->password);

		$usuario->save();

		Session::flash("message", "Se ha creado el usuario '$usuario->name'");
		return redirect('usuarios');
	}


	public function edit(User $obj) {
		$this->verificarAdministrador();
		$roles = [
			"USUARIO" => 'Usuario',
			"ADMINISTRADOR" => 'Administrador'
		];
		return view("usuarios.edit")->withRoles($roles)->withUsuario($obj);
	}

	private function verificarAdministrador() {
		if(Auth::user()->rol != User::ADMINISTRADOR) {
			abort(401, "No posee el permiso para esta consulta");
		}
	}
}
