/**
 * Contiene la vista del menú de secretaría.
 */
export class VistaMenuSecretaria {
    constructor(controlador, nav) {
        this.controlador = controlador;
        this.nav = nav;

        this.liHamburger = this.nav.getElementsByTagName('li')[0];
        this.liGestionDiaria = this.nav.getElementsByTagName('li')[1];
        this.liGestionMensual = this.nav.getElementsByTagName('li')[2];
        this.liCerrarSesion = this.nav.getElementsByTagName('li')[3];
        
        this.liHamburger.onclick = this.toggleMenu.bind(this);
        this.liGestionDiaria.onclick = this.gestionDiaria.bind(this);
        this.liGestionMensual.onclick = this.gestionMensual.bind(this);
        this.liCerrarSesion.onclick = this.cerrarSesion.bind(this);
    }

    /**
     * Muestra/oculta menú de navegación.
     */
    toggleMenu() {
        this.nav.classList.toggle('responsive');
    }

    /**
     * Atención al evento de mostrar vista de gestión diaria.
     */
    gestionDiaria() {
        this.controlador.verVistaGestionDiaria();

        this.liGestionDiaria.classList.add('active');
        this.liGestionMensual.classList.remove('active');
    }

    /**
     * Atención al evento de mostrar vista de gestión mensual.
     */
    gestionMensual() {
        this.controlador.verVistaGestionMensual();

        this.liGestionDiaria.classList.remove('active');
        this.liGestionMensual.classList.add('active');
    }

    /**
     * Atención al evento de cerrar sesión.
     */
    cerrarSesion() {
        this.controlador.cerrarSesion();
    }
}