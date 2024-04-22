<?php
// Aquí realizarías la lógica para obtener los días marcados, por ejemplo, consultar una base de datos
// En este ejemplo, simplemente simularemos algunos días marcados
$reservedDays = array("2024-04-05", "2024-04-10", "2024-04-20", "2024-05-05");

// Devolver los días marcados en formato JSON
echo json_encode($reservedDays);
?>
