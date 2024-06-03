import { Rest } from "../services/rest.js";
/**
 * Clase que representa la funcionalidad de login.
 */
class Login {
      /**
     * Crea una instancia de Login.
     * Vincula el método iniciar a window.onload y configura un manejador global de errores.
     */
    constructor() {
        window.onload = this.iniciar.bind(this);
        window.onerror = (error) => console.error('Error capturado. ' + error);
        
    }
    /**
     * Inicializa los elementos del formulario de login y los event listeners.
     */

    iniciar() {
        this.form = document.getElementsByTagName('form')[0];
        this.email = document.getElementsByTagName('input')[0];
        this.clave = document.getElementsByTagName('input')[1];
        this.verClave = document.querySelector('.toggle-password'); // Usar la clase para seleccionar la imagen
        this.btnAceptar = document.getElementsByTagName('button')[0];
        this.divCargando = document.getElementById('loadingImg');
        this.divError = document.getElementById('divError');
    
        this.btnAceptar.addEventListener('click', this.validarFormulario.bind(this));
        this.email.addEventListener('change', this.comprobarCorreo.bind(this));
        this.verClave.addEventListener('click', this.mostrarClave.bind(this));
    }

    /**
     * Verifica el dominio del correo y muestra un mensaje si coincide con criterios específicos.
     */
    comprobarCorreo() {
        const correo = this.email.value.trim().toLowerCase();
    
        if (correo.endsWith('@fundacionloyola.es')) {
            this.btnAceptar.disabled = true;
            this.mostrarMensaje('El personal de la Escuela Virgen de Guadalupe debe acceder con su correo corporativo a través del login de Google', 'login_google.html');
        } else if (correo.endsWith('@alumnado.fundacionloyola.net')) {
            this.btnAceptar.disabled = true;
            this.mostrarMensaje('Los alumnos de la Escuela Virgen de Guadalupe deben acceder con su correo corporativo a través del login de Google', 'login_google.html');
        }
    }

    /**
        Cambia la visibilidad del campo de clave y alterna la imagen del ojo
    **/
    mostrarClave() {
        if (this.clave.type === 'password') {
            this.clave.type = 'text';
            this.verClave.src = 'img/icons/eye-closed.svg'; 
        } else {
            this.clave.type = 'password';
            this.verClave.src = 'img/icons/eye-open.svg'; 
        }
    }
 /**
     * Muestra un mensaje y un enlace en el div de error.
     * @param {string} mensaje - El mensaje a mostrar.
     * @param {string} enlace - El enlace a incluir en el mensaje.
     */
    mostrarMensaje(mensaje, enlace) {
        this.divError.innerHTML = `<p>${mensaje}</p><a href="${enlace}">Haz clic aquí</a>`;
        this.divError.style.display = 'block';
    }
/**
     * Valida el formulario y, si es válido, inicia el proceso de login.
     */
    validarFormulario() {
        this.form.classList.add('was-validated');

        if (this.email.checkValidity() && this.clave.checkValidity()) {
            this.btnAceptar.disabled = true;
            this.login();
        }
    }
 /**
     * Realiza la solicitud de login y maneja la respuesta.
     */
    login() {
        this.divCargando.style.display = 'block';

        if (this.divError.style.display == 'block')
            this.divError.style.display = 'none';

        const login = {
            usuario: this.email.value,
            clave: this.clave.value
        };

        Rest.post('login', [], login, true)
         .then(usuario => {
             this.btnAceptar.disabled = false;
             this.divCargando.style.display = 'none'; 
             sessionStorage.setItem('usuario', JSON.stringify(usuario));
             window.location.href = 'index.html';
         })
         .catch(e => {
             this.btnAceptar.disabled = false;
             this.divCargando.style.display = 'none';
             this.error(e);
         })
    }
/**
     * Maneja los errores de la solicitud de login y muestra un mensaje apropiado.
     * @param {string} e - El mensaje de error.
     */
    error(e) {
        if (e != null) {
            if (e == 'Error: 401 - Unauthorized') {
                this.divError.innerHTML = '<p>Los datos introducidos no son correctos.</p>';
            }
            else if (e == 'Error: 408 - Request Timeout') {
                this.divError.innerHTML = '<p>No hay conexión con la base de datos. Intente de nuevo más tarde.</p>';
            }
            else {
                this.divError.innerHTML = '<p>' + e + '</p>';
            }

            this.divError.style.display = 'block';
            this.form.classList.remove('was-validated');
            window.scrollTo(0, document.body.scrollHeight);
        }
        else {
            this.divError.style.display = 'none';
        }
    }
}

new Login();