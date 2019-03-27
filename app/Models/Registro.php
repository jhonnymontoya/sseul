<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Registro extends Model
{
	protected $table = "datos";

	/**
	 * Atributos que se pueden masivamente asignar.
	 *
	 * @var array
	 */
	protected $fillable = [
		"archivo_id",
		"cohorte_id",
		"programa_id",
		"estudiante_id",
		"codigo",
		"identificacion",
		"nombre",
		"email",
		"movil",
		"altura_semestral",
	];

	/**
	 * Atributos que deben ser convertidos a fechas.
	 *
	 * @var array
	 */
	protected $dates = [
		'created_at',
		'updated_at',
	];

	/**
	 * Atributos que deben ser convertidos a tipos nativos.
	 *
	 * @var array
	 */
	protected $casts = [
		"archivo_id" => "integer",
		"cohorte_id" => "integer",
		"programa_id" => "integer",
		"estudiante_id" => "integer",
	];

	/**
	 * Getters personalizados
	 */

	public function getTieneEmailAttribute() {
		return is_null($this->attributes['email']) ? false : true;
	}

	public function getTieneMovilAttribute() {
		return is_null($this->attributes['movil']) ? false : true;
	}

	public function getMovilFormateadoAttribute() {
		return $this->formatearTelefono($this->attributes['movil']);
	}
	
	/**
	 * Setters Personalizados
	 */

	public function setNombreAttribute($value) {
		$this->attributes['nombre'] = mb_convert_case($value, MB_CASE_UPPER, "UTF-8");
	}

	public function setEmailAttribute($value) {
		$this->attributes['email'] = mb_convert_case($value, MB_CASE_LOWER, "UTF-8");
	}

	public function setPeriodoAttribute($value) {
		$this->attributes['periodo'] = mb_convert_case($value, MB_CASE_UPPER, "UTF-8");
	}
		
	/**
	 * Scopes
	 */
	
	/**
	 * Funciones
	 */

	private function formatearTelefono($telefono) {
		if(!isset($telefono{3})){
			return null;
		}

		$telefono = preg_replace("/[^0-9]/", "", $telefono);
		$length = strlen($telefono);
		switch($length) {
			case 7:
				return preg_replace("/([0-9]{3})([0-9]{4})/", "$1-$2", $telefono);
				break;
			case 10:
				return preg_replace("/([0-9]{3})([0-9]{3})([0-9]{4})/", "($1) $2-$3", $telefono);
				break;
			case 11:
				return preg_replace("/([0-9]{1})([0-9]{3})([0-9]{3})([0-9]{4})/", "$1($2) $3-$4", $telefono);
				break;
			default:
				return $telefono;
		break;
		}
	}
	 
	/**
	 * Relaciones Uno a Uno
	 */
	
	/**
	 * Relaciones Uno a muchos
	 */
	
	public function archivo() {
		return $this->belongsTo(Archivo::class, 'archivo_id', 'id');
	}

	public function cohorte() {
		return $this->belongsTo(Cohorte::class, 'cohorte_id', 'id');
	}

	public function programa() {
		return $this->belongsTo(Programa::class, 'programa_id', 'id');
	}

	public function estudiante() {
		return $this->belongsTo(Estudiante::class, 'estudiante_id', 'id');
	}

	/**
	 * Relaciones Muchos a uno
	 */
	
	/**
	 * Relaciones Muchos a Muchos
	 */
}
