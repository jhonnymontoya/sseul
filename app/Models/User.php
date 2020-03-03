<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Exception;

class User extends Authenticatable
{
	use Notifiable;

	const ADMINISTRADOR = 'Administrador';
	const USUARIO = 'Usuario';

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'name', 'email', 'rol', 'password',
	];

	/**
	 * The attributes that should be hidden for arrays.
	 *
	 * @var array
	 */
	protected $hidden = [
		'password', 'remember_token',
	];

	/**
	 * The attributes that should be cast to native types.
	 *
	 * @var array
	 */
	protected $casts = [
		'email_verified_at' => 'datetime',
	];

	public function setNameAttribute($value) {
		$this->attributes["name"] = mb_convert_case($value,  MB_CASE_TITLE, "UTF-8");
	}

	public function setPasswordAttribute($value) {
		if(!empty($value)) {
			$this->attributes["password"] = bcrypt($value);
		}
	}

	public function setRolAttribute($value) {
		if(empty($value)) {
			$this->attributes["rol"] = null;
			return;
		}

		if(strcasecmp($value, User::ADMINISTRADOR) == 0) {
			$this->attributes["rol"] = User::ADMINISTRADOR;
			return;
		}
		elseif(strcasecmp($value, User::USUARIO) == 0) {
			$this->attributes["rol"] = User::USUARIO;
			return;
		}

		throw new Exception("Error asignando el rol, rol no reconocido", 1);
		
	}
}
