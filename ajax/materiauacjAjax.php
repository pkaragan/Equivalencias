<?php
	$peticionAjax=true;
	require_once "../core/configGeneral.php";
	if(isset($_POST['privilegio-admin']) || isset($_POST['nombreMateriaAgregar']) || isset($_POST['carreraUacjSelect']) || isset($_POST['codigo-del']) || isset($_POST['materiaObl']) || isset($_POST['MateriaUacjNombre']) || isset($_POST['MateriaUacjClave'])){

		require_once "../controladores/materiauacjControlador.php";
		$InsMateria= new materiaUacjControlador();

		if(isset($_POST['nombreMateriaAgregar']) && isset($_POST['claveMateriaAgregar'])){
			echo $InsMateria->agregar_materia_uacj_controlador();
		}
	
		if(isset($_POST['codigo-del']) && isset($_POST['privilegio-admin'])){
			echo $InsMateria->eliminar_materia_uacj_controlador();
		}
		
		if(isset($_POST['MateriaUacjNombre']) && isset($_POST['MateriaUacjClave'])){
			echo $InsMateria->actualizar_materia_uacj_controlador();
		}
		
		if(isset($_POST['materiaObl'])){
			session_start(['name'=>'SBP']);
			$_SESSION['materiaObl']=$_POST['materiaObl'];		
		}

		if(isset($_POST['carreraUacjSelect'])){
			session_start(['name'=>'SBP']);
			if($_POST['carreraUacjSelect']=='0'){
				unset($_SESSION['carreraUacjSelect']);
			}else{
				$_SESSION['carreraUacjSelect']=$_POST['carreraUacjSelect'];		
			}
			var_dump($_SESSION['carreraUacjSelect']);
		}

	}else{
		session_start(['name'=>'SBP']);
		session_destroy();
		echo '<script> window.location.href="'.SERVERURL.'login/" </script>';
    }