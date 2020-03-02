<?php

namespace App\Http\Requests\Usuarios;

use Illuminate\Foundation\Http\FormRequest;

class CrearUsuarioRequest extends FormRequest
{

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
			'nombre'			=> 'bail|required|string|min:4|max:250',
			'rol'				=> 'bail|required|string|in:ADMINISTRADOR,USUARIO',
			'mail'				=> [
				'bail',
				'required',
				'email:rfc,dns',
				'unique:users,email,NULL,id,deleted_at,NULL'
			],
			'password'			=> 'bail|required|string|min:6',
			'confirm_password'	=> 'bail|required|same:password',
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
			'mail'				=> 'correo electrónico',
			'confirm_password'	=> 'confirmar contraseña'
		];
	}

}
