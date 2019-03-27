<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Programa extends Model
{

	use SoftDeletes;

	protected $table = "programas";

	/**
	 * Atributos que se pueden masivamente asignar.
	 *
	 * @var array
	 */
	protected $fillable = [
		"facultad_id",
		"codigo",
		"nombre",
		"esta_activo",
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
		"esta_activo" => "boolean"
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

	public function scopeActivo($query, $value = true) {
		return $query->whereEstaActivo($value);
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
	
	public function cohortes() {
		return $this->hasMany(Cohorte::class, 'programa_id', 'id');
	}

	public function estudiantes() {
		return $this->hasMany(Estudiante::class, 'programa_id', 'id');
	}

	public function registros() {
		return $this->hasMany(Registro::class, 'programa_id', 'id');
	}

	/**
	 * Relaciones Muchos a uno
	 */

	public function facultad() {
		return $this->belongsTo(Facultad::class, 'facultad_id', 'id');
	}
	
	/**
	 * Relaciones Muchos a Muchos
	 */
}
