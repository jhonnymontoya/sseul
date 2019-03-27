@extends('layouts.app')

@section('content')
<h3><i class="fa fa-exchange-alt"></i> Comparar cohortes</h3>

<br>

@if (Session::has("message"))
	<div class="card mb-4 py-1 border-left-success">
		<div class="card-body">
			{{ Session::get("message") }}
		</div>
	</div>
@endif

@if ($errors->count())
	<div class="card mb-4 py-1 border-left-danger">
		<div class="card-body">
			<ul>
				@if($errors->has("desde"))
					<li>{{ $errors->first("desde") }}</li>
				@endif
				@if($errors->has("hasta"))
					<li>{{ $errors->first("hasta") }}</li>
				@endif
			</ul>
		</div>
	</div>
@endif

{!! Form::model(Request::only(["desde", "hasta"]), ["route" => "comparar.cohortes", "method" => "get"]) !!}
<div class="row">
	<div class="col-md-5">
		<div class="form-group row">
			<label class="col-md-3 col-form-label">Cohorte inicial:</label>
			<div class="col-md-9">
				{!! Form::select("desde", $cohortes, null, ["class" => "form-control", "placeholder" => "Inicio"]) !!}
			</div>
		</div>
	</div>

	<div class="col-md-5">
		<div class="form-group row">
			<label class="col-md-3 col-form-label">Cohorte final:</label>
			<div class="col-md-9">
				{!! Form::select("hasta", $cohortes, null, ["class" => "form-control", "placeholder" => "Fin"]) !!}
			</div>
		</div>
	</div>

	<div class="col-md-2">
		<div class="form-group row">
			<div class="col-md-9">
				{!! Form::submit("Comparar", ["class" => "btn btn-danger"]) !!}
			</div>
		</div>
	</div>
</div>
{!! Form::close() !!}

<br>

<div class="row">
	<div class="col-md-12">
		<div class="chart-area">
			<canvas id="grafico"></canvas>
		</div>
	</div>
</div>

@endsection

@push('style')
@endpush

@push('scripts')
<script type="text/javascript">
	@if($data->count())
		Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#858796';

		var ctx = document.getElementById("grafico");
		var myLineChart = new Chart(ctx, {
		  type: 'line',
		  data: {
			labels: [
				@foreach($data as $dato)
					"{{ $dato->periodo }}",
				@endforeach
			],
			datasets: [{
			  label: "Inscritos",
			  lineTension: 0.3,
			  backgroundColor: "rgba(78, 115, 223, 0.05)",
			  borderColor: "rgba(78, 115, 223, 1)",
			  pointRadius: 3,
			  pointBackgroundColor: "rgba(78, 115, 223, 1)",
			  pointBorderColor: "rgba(78, 115, 223, 1)",
			  pointHoverRadius: 3,
			  pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
			  pointHoverBorderColor: "rgba(78, 115, 223, 1)",
			  pointHitRadius: 10,
			  pointBorderWidth: 2,
			  data: [
			  	@foreach($data as $dato)
					{{ $dato->total }},
				@endforeach
			  ],
			},
			{
			  label: "Diferencia",
			  lineTension: 0.3,
			  backgroundColor: "rgba(78, 115, 223, 0.05)",
			  borderColor: "rgba(255, 0, 0, 1)",
			  pointRadius: 3,
			  pointBackgroundColor: "rgba(78, 115, 223, 1)",
			  pointBorderColor: "rgba(78, 115, 223, 1)",
			  pointHoverRadius: 3,
			  pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
			  pointHoverBorderColor: "rgba(78, 115, 223, 1)",
			  pointHitRadius: 10,
			  pointBorderWidth: 2,
			  data: [
			  	@foreach($data as $dato)
					{{ $dato->diferencia }},
				@endforeach
			  ],
			}],
		  },
		  options: {
			maintainAspectRatio: false,
			layout: {
			  padding: {
				left: 10,
				right: 25,
				top: 25,
				bottom: 0
			  }
			},
			scales: {
			  xAxes: [{
				time: {
				  unit: 'date'
				},
				gridLines: {
				  display: false,
				  drawBorder: false
				},
				ticks: {
				  maxTicksLimit: 7
				}
			  }],
			  yAxes: [{
				ticks: {
				  maxTicksLimit: 5,
				  padding: 10,
				  // Include a dollar sign in the ticks
				  callback: function(value, index, values) {
					return value;
				  }
				},
				gridLines: {
				  color: "rgb(234, 236, 244)",
				  zeroLineColor: "rgb(234, 236, 244)",
				  drawBorder: false,
				  borderDash: [2],
				  zeroLineBorderDash: [2]
				}
			  }],
			},
			legend: {
			  display: false
			},
			tooltips: {
			  backgroundColor: "rgb(255,255,255)",
			  bodyFontColor: "#858796",
			  titleMarginBottom: 10,
			  titleFontColor: '#6e707e',
			  titleFontSize: 14,
			  borderColor: '#dddfeb',
			  borderWidth: 1,
			  xPadding: 15,
			  yPadding: 15,
			  displayColors: false,
			  intersect: false,
			  mode: 'index',
			  caretPadding: 10,
			  callbacks: {
				label: function(tooltipItem, chart) {
				  var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
				  return datasetLabel + ': ' + tooltipItem.yLabel;
				}
			  }
			}
		  }
		});
	@endif
</script>
@endpush