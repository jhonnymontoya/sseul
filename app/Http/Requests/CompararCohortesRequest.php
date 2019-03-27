<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CompararCohortesRequest extends FormRequest
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
			"desde" => [
				"bail",
				"required_with:hasta",
				"string"
			],
			"hasta" => [
				"bail",
				"required_with:desde",
				"string"
			],
		];
	}

	public function withValidator($validator) {
		if(is_null($this->desde) && empty($this->desde)) return null;
		if(is_null($this->hasta) && empty($this->hasta)) return null;

		$validator->after(function ($validator) {
			if($this->desde > $this->hasta) {
				$validator->errors()->add('desde', 'El campo "desde" debe ser menor o igual que el campo "hasta".');
				$validator->errors()->add('hasta', 'El campo "hasta" debe ser mayor o igual que el campo "desde".');
			}
		});
	}

}
