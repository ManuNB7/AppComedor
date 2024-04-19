// Definir una constante para la duración de la notificación en milisegundos
const DURACION_NOTIFICACION = 3000; // 3000 milisegundos = 3 segundos
// Ancho fijo para las notificaciones
const NOTIFICACION_WIDTH = 220; // Ancho fijo en píxeles
// Altura fija para las notificaciones
const NOTIFICACION_HEIGHT = 45; // Altura fija en píxeles

// Variable para controlar la posición vertical de las notificaciones
let verticalPosition = 80; // Empezar en 20px desde la parte superior
const MAX_VERTICAL_POSITION = 600; // Reiniciar la posición vertical después de alcanzar los 300px

// Variable para almacenar los meses marcados
let mesesMarcados = [];

// Función para mostrar la notificación
function mostrarNotificacion(estado, checkboxId) {
    // Obtener el elemento divnotificacion
    var divNotificacion = document.getElementById('divnotificacion');

    // Crear un elemento de notificación
    var notificacion = document.createElement('div');

    // Establecer el texto de acuerdo al estado de la casilla
    if (estado === 'marcada') {
        if (checkboxId.startsWith('fecha')) {
            // Si es una fecha, obtener el día del ID del checkbox
            var dia = checkboxId.substr(16, 2); // Extraer los dos caracteres correspondientes al día
            notificacion.textContent = `Ha marcado día ${dia}.`;
        } else if (checkboxId.startsWith('mes')) {
            // Si es un mes, obtener el nombre del mes del ID del checkbox
            var mes = checkboxId.substr(4); // Extraer el nombre del mes del ID del checkbox
            if (!mesesMarcados.includes(mes)) {
                mesesMarcados.push(mes); // Agregar el mes a la lista de meses marcados
            }
            notificacion.textContent = `Ha marcado el mes de.`;
        } else {
            // Si no es ni una fecha ni un mes, interpretarlo como una semana marcada
            notificacion.textContent = `Ha marcado una semana.`;
        }
        notificacion.style.background = 'linear-gradient(to right, #2C95FF, #53D7FF)'; // Gradiente de azul a verde
    } else if (estado === 'desmarcada') {
        if (checkboxId.startsWith('fecha')) {
            // Si es una fecha, obtener el día del ID del checkbox
            var dia = checkboxId.substr(16, 2); // Extraer los dos caracteres correspondientes al día
            notificacion.textContent = `Ha desmarcado día ${dia}.`;
        } else if (checkboxId.startsWith('mes')) {
            // Si es un mes, obtener el nombre del mes del ID del checkbox
            var mes = checkboxId.substr(4); // Extraer el nombre del mes del ID del checkbox
            if (mesesMarcados.includes(mes)) {
                mesesMarcados = mesesMarcados.filter(item => item !== mes); // Eliminar el mes de la lista de meses marcados
            }
            notificacion.textContent = `Ha desmarcado el mes.`;
        } else {
            // Si no es ni una fecha ni un mes, interpretarlo como una semana marcada
            notificacion.textContent = `Ha desmarcado una semana.`;
        }
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
    notificacion.style.width = NOTIFICACION_WIDTH + 'px'; // Establecer ancho fijo
    notificacion.style.height = NOTIFICACION_HEIGHT + 'px'; // Establecer altura fija
    notificacion.style.top = verticalPosition + 'px'; // Establecer la posición vertical
    notificacion.style.right = '20px'; // Establecer la posición horizontal
    notificacion.style.zIndex = '9999'; // Asegurar que esté sobre otros elementos
    notificacion.style.transition = 'top 0.3s ease-out'; // Añadir transición suave al cambiar la posición

    // Incrementar la posición vertical para la próxima notificación
    verticalPosition += notificacion.offsetHeight + 60; // Altura de la notificación más espacio entre ellas

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
    var checkboxId = event.target.id; // Obtener el ID del checkbox
    mostrarNotificacion(estado, checkboxId); // Pasar el ID del checkbox a la función mostrarNotificacion
}

document.addEventListener('DOMContentLoaded', function () {
    var contadorSemanas = 100; // Contador inicial de semanas

    function capturarCheckboxes() {
        var checkboxes = document.querySelectorAll('tbody input[type=checkbox]');
        console.log("Cantidad de checkboxes encontrados:", checkboxes.length);
        checkboxes.forEach(function (checkbox) {
            checkbox.addEventListener('change', botonClicado);
            checkbox.addEventListener('change', checkboxCambiado); // Agregar manejo de cambio para desmarcar también
        });
    }

    // Función para actualizar el contador de semanas
    function actualizarContador() {
        if (contadorSemanas === 0) {
            // Detener el bucle
            clearInterval(intervalo);
            console.log("El contador de semanas ha llegado a cero");
            return;
        }
        contadorSemanas--;
        console.log("Contador de semanas actualizado:", contadorSemanas);
    }

    // Iniciar el bucle
    var intervalo = setInterval(function() {
        if (contadorSemanas === 0) {
            // Detener el bucle si el contador llega a cero
            clearInterval(intervalo);
            console.log("El contador de semanas ha llegado a cero");
            return;
        }
        capturarCheckboxes();
        actualizarContador();
    }, 2000); // Ejecutar cada 2 segundos

    var semanaSiguienteBtn = document.getElementById('semanaSiguiente');

    semanaSiguienteBtn.addEventListener('click', function() {     
        // Restablecer el contador de semanas al hacer clic en el botón
        contadorSemanas = 100;
        console.log("Contador de semanas restablecido:", contadorSemanas);
    });
});
