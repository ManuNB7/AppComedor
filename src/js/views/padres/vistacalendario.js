/**
 * Clase para gestionar la visualización y la interacción relacionada con un calendario.
 * Esta clase extiende la clase Vista.
 */
import { Vista } from '../vista.js'; 

export class VistaCalendario extends Vista {
    /**
     * Constructor de la clase VistaCalendario.
     * @param {Controlador} controlador - El controlador asociado a la vista.
     * @param {HTMLElement} div - El elemento HTML donde se renderizará la vista.
     */
    constructor(controlador, div) {
        super(controlador, div); // Llama al constructor de la clase padre
        
        // Inicialización de variables de la clase
        this.calendarContainer = document.getElementById('calendarGestion-container');
        this.prevMonthBtn = document.getElementById('prevMonth');
        this.nextMonthBtn = document.getElementById('nextMonth');
        this.monthYearHeader = document.getElementById('monthYear');
        let currentDate = new Date();
        this.currentMonth = currentDate.getMonth();
        this.idPadre = 0;
        this.currentYear = currentDate.getFullYear();
        this.diasComedor = null;
        this.hijos = null;

        // Event listeners para los botones de cambiar de mes
        this.prevMonthBtn.addEventListener('click', () => {
            this.changeMonth(-1);
        });
        
        this.nextMonthBtn.addEventListener('click', () => {
            this.changeMonth(1);
        });
    }

    /**
     * Método para cambiar de mes.
     * @param {number} change - El cambio en el mes (positivo o negativo).
     */
    changeMonth(change) {
        this.currentMonth += change;
        if (this.currentMonth < 0) {
            this.currentYear -= 1;
            this.currentMonth = 11;
        } else if (this.currentMonth > 11) {
            this.currentYear += 1;
            this.currentMonth = 0;
        }
      
        this.renderCalendars(this.hijos); // Renderiza los calendarios con los hijos dados
    }

    /**
     * Método para obtener el padre.
     * @param {object} datos - Los datos del padre.
     */
    obtenerPadre(datos) {
        this.idPadre = datos.id;
    }

    /**
     * Método para obtener los días de comedor.
     * @param {object} datos - Los datos de los días de comedor.
     */
    obtenerDiasComedor(datos) {
        this.diasComedor = datos;      
    }

    /**
     * Método para actualizar datos.
     * @param {object} datos - Los nuevos datos.
     */
    actualizar(datos) {
        this.idUsuario = datos.id;
        this.controlador.dameHijosGestion(this.idUsuario); // Llama al controlador para obtener los hijos del usuario
    }

    /**
     * Método para cargar los hijos.
     * @param {array} hijos - La lista de hijos.
     */
    cargarHijos(hijos){
        this.hijos = hijos;
    }

    /**
     * Método para renderizar los calendarios.
     * @param {array} hijos - La lista de hijos a renderizar.
     */
    renderCalendars(hijos) {
        // Verifica si hay hijos para renderizar los calendarios
        if (hijos != null) {
            this.calendarContainer.innerHTML = ''; // Limpia el contenedor antes de renderizar
    
        // Obtiene el nombre del mes actual
        const monthNames = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
        const monthName = monthNames[this.currentMonth];

        // Actualizar el título del mes y año del calendario con el nombre del mes y el año actual
        this.monthYearHeader.textContent = `${monthName} ${this.currentYear}`;
    
            // Itera sobre cada hijo para renderizar su calendario
            hijos.forEach(child => {
                // Crea un elemento div para el calendario del hijo
                const childCalendar = document.createElement('div');
                childCalendar.classList.add('child-calendar');
    
                // Crea un título para el calendario con el nombre del hijo y el nombre del mes
                const childMonthYearHeader = document.createElement('h2');
                childMonthYearHeader.textContent = `${child.nombre}`;
                childCalendar.appendChild(childMonthYearHeader);
    
                // Cambia los días de la semana para que empiecen en lunes
                const daysOfWeek = ['L', 'M', 'X', 'J', 'V', 'S', 'D']; // Lunes a Domingo
                const daysInMonth = new Date(this.currentYear, this.currentMonth + 1, 0).getDate();
                let firstDayIndex = new Date(this.currentYear, this.currentMonth, 1).getDay();
                if (firstDayIndex === 0) {
                    firstDayIndex = 6; // Si es domingo, cambia a 6 (último día de la semana)
                } else {
                    firstDayIndex -= 1; // Resta 1 para que el lunes sea el primer día
                }
    
                // Crea una fila para los días de la semana
                const weekRow = document.createElement('div');
                weekRow.classList.add('calendar', 'week-row');
                daysOfWeek.forEach(day => {
                    const weekDay = document.createElement('div');
                    weekDay.classList.add('day', 'week-day');
                    weekDay.textContent = day;
                    weekRow.appendChild(weekDay);
                });
                childCalendar.appendChild(weekRow);
    
                // Crea una lista de días para el calendario
                const daysList = document.createElement('div');
                daysList.classList.add('calendar');
    
                setTimeout(() => {
                    // Filtra los días reservados que pertenecen al mes actual y al hijo actual
                    const reservedDaysThisMonth = this.diasComedor.filter(objeto => {
                        const dayMonth = new Date(objeto.dia).getMonth();
                        const dayYear = new Date(objeto.dia).getFullYear();
                        return dayMonth === this.currentMonth && dayYear === this.currentYear && objeto.idPersona === child.id;
                    });
    
                    // Agrega días vacíos al principio del calendario para que el primer día sea el día correcto de la semana
                    for (let i = 0; i < firstDayIndex; i++) {
                        const emptyDay = document.createElement('div');
                        emptyDay.classList.add('day');
                        emptyDay.textContent = '';
                        daysList.appendChild(emptyDay);
                    }
    
                    // Agrega los días del mes al calendario
                    for (let i = 1; i <= daysInMonth; i++) {
                        const day = document.createElement('div');
                        day.classList.add('day');
                        day.textContent = i;
    
                        // Identifica fines de semana (Sábado y Domingo)
                        if (new Date(this.currentYear, this.currentMonth, i).getDay() === 6 || new Date(this.currentYear, this.currentMonth, i).getDay() === 0) { // Sábado o Domingo
                            day.classList.add('weekend');
                        }
    
                        // Verifica si el día está reservado y agrega la clase correspondiente
                        reservedDaysThisMonth.forEach(objeto => {
                            const dia = new Date(objeto.dia).getDate();
                            if (i === dia) {
                                day.classList.add('blue-day');
                            }
                        });
    
                        daysList.appendChild(day);
                    }
                }, 100);
    
                childCalendar.appendChild(daysList);
                this.calendarContainer.appendChild(childCalendar);
            });
        }
      
    }

    /**
     * Método para mostrar la vista.
     * @param {boolean} ver - Indica si se debe mostrar o no la vista.
     */
    mostrar(ver) {
        console.log("ENTRANDO EN MOSTRAR")
        
        super.mostrar(ver); // Llama al método mostrar de la clase padre
        this.controlador.dameHijosGestion(this.idUsuario);
        this.renderCalendars();    // Al volver a mostrar la vista, refrescar calendario.
    
    }
}