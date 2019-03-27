<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Facultad extends Model
{
	use SoftDeletes;

	protected $table = "facultades";

	/**
	 * Atributos que se pueden masivamente asignar.
	 *
	 * @var array
	 */
	protected $fillable = [
		"codigo",
		"nombre",
		"esta_activa",
	];

	/**
	 * Atributos que deben ser convertidos a fechas.
	 *
	 * @var array
	 */
	protected $dates = [
		'created_at',
		'updated_at',
		'deleted_at',
	];

	/**
	 * Atributos que deben ser convertidos a tipos nativos.
	 *
	 * @var array
	 */
	protected $casts = [
		"esta_activa" => "boolean"
	];

	/**
	 * Getters personalizados
	 */
	
	/**
	 * Setters Personalizados
	 */

	public function setCodigoAttribute($value) {
		$this->attributes['codigo'] = mb_convert_case($value, MB_CASE_UPPER, "UTF-8");
	}

	public function setNombreAttribute($value) {
		$this->attributes['nombre'] = mb_convert_case($value, MB_CASE_UPPER, "UTF-8");
	}
		
	/**
	 * Scopes
	 */

	public function scopeActiva($query, $value = true) {
		return $query->whereEstaActiva($value);
	}

	public function scopeSearch($query, $value) {
		if(!empty($value)) {
			$value = mb_convert_case($value, MB_CASE_UPPER, "UTF-8");
			return $query->where("codigo", "like", "%$value%")
				->orWhere("nombre", "like", "%$value%");
		}
	}
	
	/**
	 * Funciones
	 */
	 
	/**
	 * Relaciones Uno a Uno
	 */
	
	/**
	 * Relaciones Uno a muchos
	 */
	
	public function programas() {
		return $this->hasMany(Programa::class, 'facultad_id', 'id');
	}

	/**
	 * Relaciones Muchos a uno
	 */
	
	/**
	 * Relaciones Muchos a Muchos
	 */
}
