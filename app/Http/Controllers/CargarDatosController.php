<?php

namespace App\Http\Controllers;

use App\Models\Archivo;
use App\Models\Dato;
use DB;
use Illuminate\Http\Request;
use Log;
use Session;
use Storage;
use Validator;
use Auth;

class CargarDatosController extends Controller
{
	public function __construct() {
		$this->middleware('auth');
	}

	/**
	 * Ingreso a la pantalla principal de cargar Datos
	 * @return type
	 */
	public function index() {
		$archivos = Archivo::orderBy("created_at", "desc")->paginate();
		return view("cargarDatos.index")->withArchivos($archivos);
	}


	public function nuevo() {
		return view("cargarDatos.nuevo");
	}

	public function cargar(Request $request) {
		Validator::make($request->all(), [
			'archivo'	=> 'bail|required|file|max:10240|mimetypes:text/plain'
		],
		[
			'archivo.max'		=> 'El tamaño de :attribute no debe superar 10MB',
			'archivo.mimetypes'	=> 'El :attribute debe ser un CSV válido',
			'archivo.required'	=> 'El :attribute es requerido',
		], ['archivo' => 'archivo de estudiantes'])->validate();
		$rutaArchivo = $request->archivo->store('subidos');
		$nombreArchivo = $request->archivo->getClientOriginalName();

		$datos = Storage::get($rutaArchivo);
		$datos = explode("\n", $datos);
		if(count($datos) <= 1) {
			return redirect()->back()->withErrors(["archivo" => "El archivo de estudiantes se encuenta vacío"]);
		}
		$data = collect();
		$cabecera = true;
		foreach ($datos as $dato) {
			if($cabecera) {
				$cabecera = false;
				continue;
			}
			$dato = str_ireplace("\r", "", $dato);
			$dato = explode(";", $dato);
			if(count($dato) < 6) continue;

			$objDato = new Dato;
			$objDato->codigo = $dato[0];
			$objDato->identificacion = $dato[1];
			$objDato->nombre = $dato[2];
			$objDato->email = $dato[3];
			$objDato->movil = $dato[4];
			$objDato->periodo = $dato[5];
			$data->push($objDato);
		}
		try {
			DB::beginTransaction();
			$archivo = new Archivo;
			$archivo->nombre = $nombreArchivo;
			$archivo->cargado_por = Auth::User()->name;

			$archivo->save();
			$archivo->datos()->saveMany($data);
			DB::commit();
		} catch(Exception $e) {
			DB::rollBack();
			Log::error('Mensaje de error: ' . $e->getMessage());
		}
		$mensaje = "Se ha guardado correctamente el archivo '%s'";
		$mensaje = sprintf($mensaje, $nombreArchivo);
		Session::flash('message', $mensaje);
		return redirect("cargarDatos");
	}

	public function eliminar(Archivo $obj) {
		$obj->delete();
		$mensaje = "Se ha eliminado correctamente el archivo '%s'";
		$mensaje = sprintf($mensaje, $obj->nombre);
		Session::flash('message', $mensaje);
		return redirect("cargarDatos");
	}
}
