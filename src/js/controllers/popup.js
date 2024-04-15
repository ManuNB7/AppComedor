// Definir una constante para la duración de la notificación en milisegundos
const DURACION_NOTIFICACION = 3000; // 3000 milisegundos = 3 segundos

// Variable para controlar la posición vertical de las notificaciones
let verticalPosition = 60; // Empezar en 20px desde la parte superior
const MAX_VERTICAL_POSITION = 600; // Reiniciar la posición vertical después de alcanzar los 300px

// Función para mostrar la notificación
function mostrarNotificacion(estado) {
    // Obtener el elemento divnotificacion
    var divNotificacion = document.getElementById('divnotificacion');

    // Crear un elemento de notificación
    var notificacion = document.createElement('div');

    // Establecer el texto de acuerdo al estado de la casilla
    if (estado === 'marcada') {
        notificacion.textContent = 'Casilla marcada';
        notificacion.style.background = 'linear-gradient(to right, #2C95FF, #53D7FF)'; // Gradiente de azul a verde
    } else if (estado === 'desmarcada') {
        notificacion.textContent = 'Casilla desmarcada';
        notificacion.style.background = 'linear-gradient(to right, #FFC3A0, #FF6F91)'; // Gradiente de rojo claro a naranja
    } else {
        return;
    }

    // Establecer estilos de la notificación
    notificacion.style.padding = '8px 12px'; // Ajustar el relleno
    notificacion.style.color = 'white'; // Establecer el color de texto
    notificacion.style.borderRadius = '4px'; // Añadir esquinas redondeadas
    notificacion.style.fontSize = '16px'; // Ajustar el tamaño de fuente
    notificacion.style.fontWeight = 'bold'; // Hacer el texto en negrita
    notificacion.style.position = 'fixed'; // Fijar la posición
    notificacion.style.top = verticalPosition + 'px'; // Establecer la posición vertical
    notificacion.style.right = '20px'; // Establecer la posición horizontal
    notificacion.style.zIndex = '9999'; // Asegurar que esté sobre otros elementos
    notificacion.style.transition = 'top 0.3s ease-out'; // Añadir transición suave al cambiar la posición

    // Incrementar la posición vertical para la próxima notificación
    verticalPosition += notificacion.offsetHeight + 44; // Altura de la notificación más espacio entre ellas

    // Reiniciar la posición vertical si se alcanza la posición máxima
    if (verticalPosition > MAX_VERTICAL_POSITION) {
        verticalPosition = 20; // Reiniciar en la parte superior
        // Eliminar las notificaciones anteriores para evitar el desbordamiento
        while (divNotificacion.firstChild) {
            divNotificacion.removeChild(divNotificacion.firstChild);
        }
    }

    // Agregar la notificación al divnotificacion
    divNotificacion.appendChild(notificacion);

    // Quitar la notificación después de unos segundos
    setTimeout(function () {
        divNotificacion.removeChild(notificacion);
    }, DURACION_NOTIFICACION);
}

// Función para manejar el clic del botón
function botonClicado() {
    console.log("clicado");
    mostrarNotificacion();
}

// Función para manejar el cambio en las casillas de verificación
function checkboxCambiado(event) {
    // Obtener el estado actual de la casilla
    var estado = event.target.checked ? 'marcada' : 'desmarcada';
    mostrarNotificacion(estado);
}

document.addEventListener('DOMContentLoaded', function () {
    setTimeout(function () {
        var checkboxes = document.querySelectorAll('tbody input[type=checkbox]');
        console.log(checkboxes);

        checkboxes.forEach(function (checkbox) {
            checkbox.addEventListener('change', botonClicado);
            checkbox.addEventListener('change', checkboxCambiado); // Agregar manejo de cambio para desmarcar también
        });
    }, 2000); // Espera 2 segundos antes de capturar los checkboxes
});