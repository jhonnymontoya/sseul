<?php

namespace App\Http\Requests\Usuarios;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Routing\Route;

class EditUsuarioRequest extends FormRequest
{

	private $obj;

	public function __construct(Route $route) {
		$this->obj = $route->obj;
	}

	/**
	 * Determine if the user is authorized to make this request.
	 *
	 * @return bool
	 */
	public function authorize() {
		return true;
	}

	/**
	 * Get the validation rules that apply to the request.
	 *
	 * @return array
	 */
	public function rules() {
		return [
			'name'			=> 'bail|required|string|min:4|max:250',
			'rol'				=> 'bail|required|string|in:ADMINISTRADOR,USUARIO',
			'email'				=> [
				'bail',
				'required',
				'email:rfc,dns',
				'unique:users,email,' . $this->obj->id . ',id,deleted_at,NULL'
			],
			'password'			=> 'bail|nullable|string|min:6',
			'confirm_password'	=> 'bail|nullable|required_with:password|same:password',
		];
	}

	/**
	 * Get custom messages for validator errors.
	 *
	 * @return array
	 */
	public function messages() {
		return [];
	}

	/**
	 * Get custom attributes for validator errors.
	 *
	 * @return array
	 */
	public function attributes() {
		return [
			'name'				=> 'nombre',
			'mail'				=> 'correo electrónico',
			'confirm_password'	=> 'confirmar contraseña'
		];
	}
}
