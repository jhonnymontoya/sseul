<?php

namespace App\Http\Controllers;

use App\Http\Requests\CompararCohortesRequest;
use Illuminate\Http\Request;
use App\Models\Archivo;
use App\Models\Dato;
use Validator;
use DB;


class CompararCohortesController extends Controller
{
    public function __construct() {
		$this->middleware('auth');
	}

	public function index(CompararCohortesRequest $request) {
		$cohortes = Dato::select("periodo")->distinct()->orderBy("periodo")->pluck("periodo", "periodo");

		$data = collect();

		if(isset($request->desde) && isset($request->hasta)) {
			$data = Dato::select("periodo", DB::raw('COUNT(*) as total'))
				->whereBetween("periodo", [$request->desde, $request->hasta])
				->groupBy("periodo")
				->orderBy("periodo")
				->get();
			$anterior = 0;
			$diferenciaAcumulada = 0;
			foreach ($data as $cohorte) {
				$diferencia = $anterior - $cohorte->total;
				$diferencia = $diferencia < 0 ? 0 : $diferencia;
				$diferenciaAcumulada += $diferencia;
				$cohorte->diferencia = $diferencia;
				$cohorte->diferencia_acumulada = $diferenciaAcumulada;
				$anterior = $cohorte->total;
			}
		}
		//dd($data);

		return view("compararCohortes.index")->withCohortes($cohortes)->withData($data);
	}
}
