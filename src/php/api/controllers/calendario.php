<?php
    require_once(dirname(__DIR__) . '/daos/daousuario.php');


    /**
     * Controlador de hijos.
     */
    class Calendario {
        /**
         * Obtener filas de la tabla dias.
         * @param array $pathParams No utilizado.
         * @param array $queryParams Array de IDs.
         * @param object $usuario Usuario que realiza el proceso.
         */
        // function get($pathParams, $queryParams, $usuario) {
        //     // Si no existe $usuario, es porque la autorización ha fallado.
        //     if (!$usuario) {
        //         header('HTTP/1.1 401 Unauthorized');
        //         die();
        //     }

        //     if (count($queryParams) && isset($queryParams['accion'])) {
        //         switch ($queryParams['accion']) {
        //             case 'coger':
        //                 $resultado = DAOUsuario::obtenerDiasCalendario($queryParams['idPadre']);

        //                 break;
    
              
        //         header('Content-type: application/json; charset=utf-8');
        //         header('HTTP/1.1 200 OK');
        //         echo(json_encode($resultado));
        //         die();
        //     }
        // }
        //     else {
        //         header('HTTP/1.1 400 Bad Request');
        //         die();
        //     }
        // }
        function get($pathParams, $queryParams, $usuario) {
            // Si no existe $usuario, es porque la autorización ha fallado.
            if (!$usuario) {
                header('HTTP/1.1 401 Unauthorized');
                die();
            }

            if ($queryParams) {
                
                        $resultado = DAOUsuario::obtenerDiasCalendario($queryParams);

                     
              
                header('Content-type: application/json; charset=utf-8');
                header('HTTP/1.1 200 OK');
                echo(json_encode($resultado));
                die();
            }
        
            else {
                header('HTTP/1.1 400 Bad Request');
                die();
            }
        }
    }
    
  