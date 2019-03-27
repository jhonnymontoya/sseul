<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cohorte extends Model
{
	use SoftDeletes;

	protected $table = "cohortes";

	/**
	 * Atributos que se pueden masivamente asignar.
	 *
	 * @var array
	 */
	protected $fillable = [
		"programa_id",
		"codigo",
		"nombre",
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

	public function estudiantes() {
		return $this->hasMany(Estudiante::class, 'cohorte_id', 'id');
	}

	public function registros() {
		return $this->hasMany(Registro::class, 'cohorte_id', 'id');
	}

	/**
	 * Relaciones Muchos a uno
	 */

	public function programa() {
		return $this->belongsTo(Programa::class, 'programa_id', 'id');
	}
	
	/**
	 * Relaciones Muchos a Muchos
	 */
}
