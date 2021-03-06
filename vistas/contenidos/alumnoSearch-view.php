<?php 
	if($_SESSION['tipo_sbp']!="Administrador"){
		echo $lc->forzar_cierre_sesion_controlador();
	}

	//Se obtienen los datos del alumno enviado por URL	----------------->

	require_once "./controladores/alumnoControlador.php";
	$insAlumno= new alumnoControlador();
	$datos=explode("/", $_GET['views']);
	if(isset($datos[1])){
		$tipo="Unico";
		$filesAlumno=$insAlumno->datos_alumno_controlador($tipo,$datos[1]);
		if($filesAlumno->rowCount()==1){
			$campos=$filesAlumno->fetch();
		}
	}
?>


<div class="container-fluid">
	<div class="page-header">
	  <h1 class="text-titles"><i class="zmdi zmdi-account zmdi-hc-fw"></i> Alumno <small>BUSCAR ALUMNO</small></h1>
	</div>
</div>

<div class="container-fluid">
	<ul class="breadcrumb breadcrumb-tabs">
	  	<li>
	  		<a href="<?php echo SERVERURL; ?>alumno/" class="btn btn-info">
	  			<i class="zmdi zmdi-plus"></i> &nbsp; NUEVO ALUMNO
	  		</a>
	  	</li>
	  	<li>
	  		<a href="<?php echo SERVERURL; ?>alumnoList/" class="btn btn-success">
	  			<i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE ALUMNOS
	  		</a>
	  	</li>
	  	<li>
	  		<a href="<?php echo SERVERURL; ?>alumnoSearch/" class="btn btn-primary">
	  			<i class="zmdi zmdi-search"></i> &nbsp; BUSCAR ALUMNO
	  		</a>
	  	</li>
	</ul>
</div>
<?php 
	require_once "./controladores/alumnoControlador.php";
	$insAlumno= new alumnoControlador();

	if(isset($_POST['busqueda_inicial_alumno'])){
		$_SESSION['busqueda_alumno']=$_POST['busqueda_inicial_alumno'];
	}

	if(isset($_POST['eliminar_busqueda_alumno'])){
		unset($_SESSION['busqueda_alumno']);
	}

	if(!isset($_SESSION['busqueda_alumno']) && empty($_SESSION['busqueda_alumno'])):
?>
<div class="container-fluid">
	<form class="well" method="POST" action="" autocomplete="off">
		<div class="row">
			<div class="col-xs-12 col-md-8 col-md-offset-2">
				<div class="form-group label-floating">
					<span class="control-label">Ingresa algún dato del alumno:</span>
					<input class="form-control" type="text" name="busqueda_inicial_alumno" required="">
				</div>
			</div>
			<div class="col-xs-12">
				<p class="text-center">
					<button type="submit" class="btn btn-primary btn-raised btn-sm"><i class="zmdi zmdi-search"></i> &nbsp; Buscar</button>
				</p>
			</div>
		</div>
	</form>
</div>
<?php else: ?>
<div class="container-fluid">
	<form class="well" method="POST" action="">
		<p class="lead text-center">Su última búsqueda  fue <strong>“<?php echo $_SESSION['busqueda_alumno']; ?>”</strong></p>
		<div class="row">
			<input class="form-control" type="hidden" name="eliminar_busqueda_alumno" value="1">
			<div class="col-xs-12">
				<p class="text-center">
					<button type="submit" class="btn btn-danger btn-raised btn-sm"><i class="zmdi zmdi-delete"></i> &nbsp; Eliminar búsqueda</button>
				</p>
			</div>
		</div>
	</form>
</div>

<!-- Panel listado de busqueda de alumnos -->
<div class="container-fluid">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="zmdi zmdi-search"></i> &nbsp; BUSCAR ALUMNOS</h3>
		</div>
		<div class="panel-body">
			<?php 
				$pagina = explode("/", $_GET['views']);
				echo $insAlumno->paginador_alumno_controlador($pagina[1],10,$_SESSION['privilegio_sbp'],$_SESSION['busqueda_alumno']);
			?>
		</div>
	</div>
</div>
<?php endif; ?>