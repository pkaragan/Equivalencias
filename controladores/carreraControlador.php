<?php
	if($peticionAjax){
		require_once "../modelos/carreraModelo.php";
	}else{
		require_once './modelos/carreraModelo.php';
	}

    class carreraControlador extends carreraModelo{
		public function agregar_carrera_controlador(){
			if(isset($_POST['nombreAlumnoCarrera']) && isset($_SESSION['codigoUni'])){
				$nombre=mainModel::limpiar_cadena($_POST['nombreAlumnoCarrera']);
				$codigoUniversidad=mainModel::limpiar_cadena($_SESSION['codigoUni']);
				$agregarDesdeAlumno=true;
				unset($_POST['nombreAlumnoCarrera']);
				unset($_SESSION['codigoUni']);
			}else{
				$nombre=mainModel::limpiar_cadena($_POST['nombreCarreraAgregar']);
				$codigoUniversidad=mainModel::decryption($_POST['codigoUniAgregarCarrera']);
			}


            $consulta1=mainModel::ejecutar_consulta_simple("SELECT id FROM carrera WHERE CarreraNombre='$nombre' AND CarreraCodigoUniversidad='$codigoUniversidad'");
	
			if($consulta1->rowCount()>=1){
                $alerta=[
                    "Alerta"=>"simple",
                    "Titulo"=>"Ocurrió un error inesperado",
                    "Texto"=>"La carrera ya existe en el sistema, favor de intentar nuevamente!",
                    "Tipo"=>"error"
                ];
			}else{
				
				$consulta=mainModel::ejecutar_consulta_simple("SELECT id FROM carrera");
				$numero=($consulta->rowCount())+1;
				$codigoCarrera=mainModel::generar_codigo_aleatorio("CR",7,$numero);
				$dataAc=[
					"Nombre"=>$nombre,
                    "Codigo"=>$codigoCarrera,
                    "CodigoUniversidad"=>$codigoUniversidad,
				];

				$guardarCarrera=carreraModelo::agregar_carrera_modelo($dataAc);

				if($guardarCarrera->rowCount()>=1){
					if(isset($agregarDesdeAlumno)){
						$alerta=[
							"Alerta"=>"limpiar",
							"Titulo"=>"Carrera registrada",
							"Texto"=>"La carrera se registro con exito en el sistema",
							"Tipo"=>"success"
						];
						unset($agregarDesdeAlumno);
					}else{
						$alerta=[
							"Alerta"=>"recargar",
							"Titulo"=>"Carrera registrada",
							"Texto"=>"La carrera se registro con exito en el sistema",
							"Tipo"=>"success"
						];
					}					
				}else{
					$alerta=[
						"Alerta"=>"simple",
						"Titulo"=>"Ocurrió un error inesperado",
						"Texto"=>"No hemos podido registrar la carrera, por favor intente nuevamente",
						"Tipo"=>"error"
					];
				}
			}
            return mainModel::sweet_alert($alerta);
        }

		// Controlador para paginar universidades
		public function paginador_carrera_controlador($pagina,$registros,$privilegio,$uniSelect){
			$pagina=mainModel::limpiar_cadena($pagina);
			$registros=mainModel::limpiar_cadena($registros);
			$privilegio=mainModel::limpiar_cadena($privilegio);
			$uniSelect=mainModel::limpiar_cadena($uniSelect);
			
			if($uniSelect!=""){
				$codigoUni=mainModel::decryption($_SESSION['uniSelect']);	
			}else{
				$codigoUni="";
			}
			
			$tabla="";

			$pagina= (isset($pagina) && $pagina>0) ? (int) $pagina : 1;
			$inicio= ($pagina>0) ? (($pagina*$registros)-$registros) : 0;

			$consulta="SELECT SQL_CALC_FOUND_ROWS * FROM carrera WHERE CarreraCodigoUniversidad='$codigoUni' ORDER BY CarreraNombre ASC LIMIT $inicio,$registros";
			
			$paginaurl="carrera";			

			$conexion = mainModel::conectar();

			$datos = $conexion->query($consulta);
			$datos= $datos->fetchAll();

			$total= $conexion->query("SELECT FOUND_ROWS()");
			$total= (int) $total->fetchColumn();

			$Npaginas= ceil($total/$registros);

			$tabla.='
			<div class="table-responsive">
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th class="text-center">NOMBRE</th>
							<th class="text-center">VER MATERIAS</th>';
						if($privilegio<=2){
							$tabla.='								
								<th class="text-center">RENOMBRAR</th>
							';
						}
						if($privilegio==1){
							$tabla.='
								<th class="text-center">ELIMINAR</th>
							';
						}
							
			$tabla.='</tr>
					</thead>
					<tbody>
			';

			if($total>=1 && $pagina<=$Npaginas){

				$contador=$inicio+1;
		
				foreach($datos as $rows){

					$datosRen=mainModel::encryption($rows['CarreraCodigo']).'||'.$rows['CarreraNombre'].'||'.mainModel::encryption($privilegio);

					$tabla.='	
								<tr>
									<td>'.$contador.'</td>
									<td>'.$rows['CarreraNombre'].'</td>
									<td>
										<form action="'.SERVERURL.'ajax/carreraAjax.php" method="POST">
											<input type="hidden" name="carreraSelect" value="'.$rows['CarreraCodigo'].'">									
											<button type="submit" class="btn btn-success btn-raised btn-xs">
												<i class="zmdi zmdi-bookmark"></i>
											</button>
										</form>						
									</td>'
									;
					if($privilegio<=2){
						$tabla.='<td>									
									<button class="btn btn-success btn-raised btn-xs" data-toggle="modal" data-target="#ren-carrera-pop" data-dismiss="modal" data-backdrop="false" onclick="ModalRenombrarCarrera(\'' . $datosRen . '\')">
									<i class="zmdi zmdi-refresh"></i></button>
								</td>
								';
					}
					if($privilegio==1){
						$tabla.='
									<td>
										<form action="'.SERVERURL.'ajax/carreraAjax.php" method="POST" class="FormularioAjax" data-form="delete" entype="multipart/form-data" autocomplete="off">
											<input type="hidden" name="codigo-del" value="'.mainModel::encryption($rows['CarreraCodigo']).'">
											<input type="hidden" name="privilegio-admin" value="'.mainModel::encryption($privilegio).'">
											<button type="submit" class="btn btn-danger btn-raised btn-xs">
												<i class="zmdi zmdi-delete"></i>
											</button>
											<div class="RespuestaAjax"></div>
										</form>
									</td>
								';	
					}

					$contador++;
				}
				
				$tabla.='</tr>';
				
			}else{
				if($total>=1){
					$tabla.='
						<tr>
							<td colspan="5">
								<a href="'.SERVERURL.$paginaurl.'/" class="btn btn-sm btn-info btn-raised">
									Haga clic aca para recargar el listado
								</a>
							</td>
						</tr>
					';
				}else{
					$tabla.='
						<tr>
							<td colspan="5">No hay registros en el sistema</td>
						</tr>
					';	
				}
			}

			$tabla.='</tbody></table></div>';

			if($total>=1 && $pagina<=$Npaginas){
				$tabla.='<nav class="text-center"><ul class="pagination pagination-sm">';

				if($pagina==1){
					$tabla.='<li class="disabled"><a><i class="zmdi zmdi-arrow-left"></i></a></li>';
				}else{
					$tabla.='<li><a href="'.SERVERURL.$paginaurl.'/'.($pagina-1).'/"><i class="zmdi zmdi-arrow-left"></i></a></li>';
				}

				for($i=1; $i<=$Npaginas; $i++){
					if($pagina==$i){
						$tabla.='<li class="active"><a href="'.SERVERURL.$paginaurl.'/'.$i.'/">'.$i.'</a></li>';
					}else{
						$tabla.='<li><a href="'.SERVERURL.$paginaurl.'/'.$i.'/">'.$i.'</a></li>';
					}
				}

				if($pagina==$Npaginas){
					$tabla.='<li class="disabled"><a><i class="zmdi zmdi-arrow-right"></i></a></li>';
				}else{
					$tabla.='<li><a href="'.SERVERURL.$paginaurl.'/'.($pagina+1).'/"><i class="zmdi zmdi-arrow-right"></i></a></li>';
				}
				$tabla.='</ul></nav>	
						';
				$contador++;
			}

			return $tabla;
		}

		public function eliminar_carrera_controlador(){
			$codigo=mainModel::decryption($_POST['codigo-del']);
			$adminPrivilegio=mainModel::decryption($_POST['privilegio-admin']);

			$codigo=mainModel::limpiar_cadena($codigo);
			$adminPrivilegio=mainModel::limpiar_cadena($adminPrivilegio);

			if($adminPrivilegio==1){
				
				$DelCarrera=carreraModelo::eliminar_carrera_modelo($codigo);
				
				if($DelCarrera->rowCount()>=1){
					unset($codigo);	
					$alerta=[
						"Alerta"=>"recargar",
						"Titulo"=>"Carrera eliminada",
						"Texto"=>"La carrera fue eliminado del sistema con éxito",
						"Tipo"=>"success"
					];
				}else{
					$alerta=[
						"Alerta"=>"simple",
						"Titulo"=>"Ocurrió un error inesperado",
						"Texto"=>"No podemos eliminar esta carrera, favor de intentar nuevamente!!",
						"Tipo"=>"error"
					];
				}
				return mainModel::sweet_alert($alerta);
			}
		}

		public function datos_carrera_controlador($tipo,$codigo){
			$tipo=mainModel::limpiar_cadena($tipo);
			if($codigo!="")
				$codigo=mainModel::decryption($codigo);
			return carreraModelo::datos_carrera_modelo($tipo,$codigo);
		}

		public function lista_carrera_controlador(){
			
			$codigoCarreraEditar=$_SESSION['codigoCarreraEditar'];	
					
			if(isset($_SESSION['alumnoUniSelect'])){
				if($_SESSION['alumnoUniSelect']!=""){
					$codigoUni=mainModel::encryption($_SESSION['alumnoUniSelect']);					
				}else{
					$codigoUni=mainModel::encryption($_POST['alumnoUniSelect']);
				}			
			}else{
				$codigoUni=mainModel::encryption($_POST['alumnoUniSelect']);
			}			

			$listaC=self::datos_carrera_controlador("Lista",$codigoUni);

			if($listaC->rowCount()>=1){
				$listaCarrera=$listaC->fetchAll();						
				$cadena='
						<div class="col-xs-12 col-sm-4" style="margin-top: 7px;">
							<div class="form-group label-floating">
								<select class="selectpicker input-lg" id="carreraSelect" name="carreraSelect" data-live-search="true">
									<option value="0">Seleciona una carrera</option>			
									<option value="1">Agregar carrera</option>						
									<option disabled>-----------------------------------------</option>';

				foreach($listaCarrera as $rows){
					
					$cadena.='						
						<option value="'.$rows['CarreraCodigo'];											
					if(isset($codigoCarreraEditar)){ 						
						if($codigoCarreraEditar==$rows["CarreraCodigo"]){
							$cadena.='" selected>';
						}else{
							$cadena.='">';
						}
					}
					
					$cadena.='	
								'.$rows['CarreraNombre'].'
							</option>';
				}
				$cadena.='
								</select>
							</div>
						</div>';				
			}else{
				$cadena='
						<div class="col-xs-12 col-sm-4" style="margin-top: 7px;">
							<div class="form-group label-floating">
								<select class="selectpicker input-lg" id="carreraSelect" name="carreraSelect">
									<option value="0">Seleciona una carrera</option>
								</select>
							</div>
						</div>';				
			}
			$cadena.="
						<script type='text/javascript'>
							$(document).ready(function(){
								$('#carreraSelect').select2();								
								if($('#carreraSelect').val()==0){
									$('span.select2-selection.select2-selection--single span#select2-carreraSelect-container.select2-selection__rendered').css('color','#999');
								}else{
									$('span.select2-selection.select2-selection--single span#select2-carreraSelect-container.select2-selection__rendered').css('color','#111');
								}
								$('#carreraSelect').change(function(){
									if($('#carreraSelect').val()==0){
										$('span.select2-selection.select2-selection--single span#select2-carreraSelect-container.select2-selection__rendered').css('color','#999');
									}else{
										$('span.select2-selection.select2-selection--single span#select2-carreraSelect-container.select2-selection__rendered').css('color','#111');
									}
									if($('#carreraSelect').val()==1){
										ModalAgregarCarrera();										
									}
								});																											
							});";
			return $cadena;
		}		
		
		public function actualizar_carrera_controlador(){
			$nombre=mainModel::limpiar_cadena($_POST['CarreraNombreUpdate']);
			$codigo=mainModel::decryption($_POST['CarreraCodigoUpdate']);
			$adminPrivilegio=mainModel::decryption($_POST['CarreraPrivilegioUpdate']);

			$query1=mainModel::ejecutar_consulta_simple("SELECT * FROM carrera WHERE CarreraCodigo='$codigo'");
			$DatosCarrera=$query1->fetch();

			if($adminPrivilegio==1){

				if($nombre!=$DatosCarrera['CarreraNombre']){
					$consulta1=mainModel::ejecutar_consulta_simple("SELECT CarreraNombre FROM carrera WHERE CarreraNombre='$nombre'");
					
					if($consulta1->rowCount()>=1)
					{
						$alert=[
							"Alerta"=>"simple",
							"Titulo"=>"Ocurrió un error inesperado",
							"Texto"=>"El nombre de la carrera que acaba de ingresar ya se encuentran registrado en esta universidad",
							"Tipo"=>"error"
						];
						return mainModel::sweet_alert($alert);
						exit();
					}
					
					$guardarCarrera=carreraModelo::actualizar_carrera_modelo($codigo,$nombre);
				
					if($guardarCarrera->rowCount()>=1){
						unset($codigo);	
						$alerta=[
							"Alerta"=>"recargar",
							"Titulo"=>"Datos actualizados!",
							"Texto"=>"El nombre de la carrera ha sido actualizado correctamente",
							"Tipo"=>"success"
						];
					}else{
						$alerta=[
							"Alerta"=>"simple",
							"Titulo"=>"Ocurrió un error inesperado",
							"Texto"=>"No hemos podido actualizar el nombre de la carrera, por favor intente nuevamente",
							"Tipo"=>"error"
						];
					}
					return mainModel::sweet_alert($alerta);
				}
			}
		}
	}