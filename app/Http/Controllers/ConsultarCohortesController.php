<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Archivo;
use App\Models\Dato;
use Validator;
use DB;

class ConsultarCohortesController extends Controller
{
	public function __construct() {
		$this->middleware('auth');
	}

	public function index() {
		$cohortes = Dato::select("periodo", DB::raw('COUNT(*) as total'))->groupBy("periodo")->orderBy("periodo")->get();
		$anterior = 0;
		$diferenciaAcumulada = 0;
		foreach ($cohortes as $cohorte) {
			$diferencia = $anterior - $cohorte->total;
			$diferencia = $diferencia < 0 ? 0 : $diferencia;
			$diferenciaAcumulada += $diferencia;
			$cohorte->diferencia = $diferencia;
			$cohorte->diferencia_acumulada = $diferenciaAcumulada;
			$anterior = $cohorte->total;
		}
		$cohortes = $cohortes->sortByDesc("periodo");

		return view("consultarCohortes.index")->withCohortes($cohortes);
	}

	public function ver($periodo) {
		$val = Validator::make(
			["periodo" => $periodo],
			[
				"periodo" => [
					"bail",
					"required",
					"string",
					"exists:pgsql.datos,periodo"
				]
			]
		);
		if($val->fails()) {
			$mensaje = "El periodo '%s' no existe";
			$mensaje = sprintf($mensaje, $periodo);
			return redirect('consultarCohortes')->withErrors(["periodo" => $mensaje]);
		}
		$datos = Dato::wherePeriodo($periodo)->orderBy("nombre")->paginate();
		return view("consultarCohortes.ver")->withPeriodo($periodo)->withDatos($datos);
	}
}
