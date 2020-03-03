<?php

namespace App\Http\Requests\Perfil;

use Illuminate\Foundation\Http\FormRequest;
use Auth;

class EditPerfilRequest extends FormRequest
{
	/**
	 * Determine if the user is authorized to make this request.
	 *
	 * @return bool
	 */
	public function authorize()
	{
		return true;
	}

	/**
	 * Get the validation rules that apply to the request.
	 *
	 * @return array
	 */
	public function rules()
	{
		$user = Auth::user();
		return [
			'name'			=> 'bail|required|string|min:4|max:250',
			'email'			=> [
				'bail',
				'required',
				'email:rfc,dns',
				'unique:users,email,' . $user->id . ',id,deleted_at,NULL'
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
