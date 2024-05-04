<?php

/**
 * Clase para manejar constantes relacionadas con precios.
 */
class Constantes {
    /**
     * @var float|null Precio del tupperware.
     */
    public static $precioTupper = null;

    /**
     * @var float|null Precio del menú.
     */
    public static $precioMenu = null;

    /**
     * Obtiene el precio solicitado.
     *
     * @param array $pathParams Parámetros de la ruta.
     * @param array $queryParams Parámetros de la consulta.
     * @param mixed $usuario Usuario actual.
     * @return void
     */
    public function get($pathParams, $queryParams, $usuario) {
        // Si no existe $usuario, es porque la autorización ha fallado.
        if (!$usuario) {
            header('HTTP/1.1 401 Unauthorized');
            die();
        }

        if (count($queryParams) && isset($queryParams['proceso'])) {
            switch ($queryParams['proceso']) {
                case 'tupper':
                    $this->obtenerTupper(self::$precioTupper);
                    break;
                case 'menu':
                    $this->obtenerMenu(self::$precioMenu);
                    break;
            }
        } else {
            header('HTTP/1.1 400 Bad Request');
            die();
        }
    }

    /**
     * Obtiene el precio del tupperware.
     *
     * @param float|null $constante Precio del tupperware.
     * @return void
     */
    public function obtenerTupper($constante){
        header('Content-type: application/json; charset=utf-8');
        header('HTTP/1.1 200 OK');
        echo json_encode($constante);
        die();
    }

    /**
     * Obtiene el precio del menú.
     *
     * @param float|null $constante Precio del menú.
     * @return void
     */
    public function obtenerMenu($constante){
        header('Content-type: application/json; charset=utf-8');
        header('HTTP/1.1 200 OK');
        echo json_encode($constante);
        die();
    }
}
