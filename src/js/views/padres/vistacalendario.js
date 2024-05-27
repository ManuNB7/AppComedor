// Importamos la clase 'Vista' desde el archivo '../vista.js'
import { Vista } from '../vista.js'; 

/**
 * Clase VistaCalendario que extiende de la clase Vista.
 * Representa una vista específica para manejar y mostrar un calendario.
 */
export class VistaCalendario extends Vista {
    /**
     * Constructor de la clase VistaCalendario.
     * @param {Object} controlador - El controlador asociado a esta vista.
     * @param {HTMLElement} div - El contenedor HTML donde se renderiza la vista.
     */
    constructor(controlador, div) {
        // Llamada al constructor de la clase base 'Vista'
        super(controlador, div);
        
        // Inicialización de elementos del DOM y variables de instancia
        this.calendarContainer = document.getElementById('calendarGestion-container');
        this.loadingMessage = document.createElement('p');
        this.loadingMessage.textContent = 'Cargando...';
        this.calendarContainer.appendChild(this.loadingMessage);

        this.prevMonthBtn = document.getElementById('prevMonth');
        this.nextMonthBtn = document.getElementById('nextMonth');
        this.monthYearHeader = document.getElementById('monthYear');
        
        // Obtener la fecha actual
        let currentDate = new Date();
        this.currentMonth = currentDate.getMonth();
        this.currentYear = currentDate.getFullYear();
        this.hijos = [];
        
        // Configurar eventos para los botones de navegación de mes
        this.prevMonthBtn.addEventListener('click', () => {
            this.changeMonth(-1);
            this.controlador.obtenerDatosCalendario(this.currentYear, this.currentMonth + 1);
        });
        
        this.nextMonthBtn.addEventListener('click', () => {
            this.changeMonth(1);
            this.controlador.obtenerDatosCalendario(this.currentYear, this.currentMonth + 1);
        });
    }

    /**
     * Método para cambiar el mes actualmente mostrado.
     * @param {number} change - El cambio en meses (puede ser positivo o negativo).
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
        this.renderCalendars(this.hijos);
    }

    /**
     * Método para cargar y mostrar datos del calendario.
     * @param {Array} hijos - Lista de objetos que contienen los datos de los calendarios hijos.
     */
    loadCalendarData(hijos) {
        // Mostrar el mensaje de "Cargando..."
        this.calendarContainer.innerHTML = '';
        this.calendarContainer.appendChild(this.loadingMessage);
    
        // Renderizar los datos
        this.renderCalendars(hijos);
    }

    /**
     * Método para renderizar los calendarios de los hijos.
     * @param {Array} hijos - Lista de objetos que contienen los datos de los calendarios hijos.
     */
    renderCalendars(hijos) {
        this.hijos = hijos;
        if (hijos && hijos.length > 0) {
            this.calendarContainer.innerHTML = '';
    
            const monthNames = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
            const monthName = monthNames[this.currentMonth];
            this.monthYearHeader.textContent = `${monthName} ${this.currentYear}`;
    
            hijos.forEach(child => {
                const childCalendar = document.createElement('div');
                childCalendar.classList.add('child-calendar');
    
                const childMonthYearHeader = document.createElement('h2');
                childMonthYearHeader.textContent = `${child.nombre}`;
                childCalendar.appendChild(childMonthYearHeader);
    
                const daysOfWeek = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
                const daysInMonth = new Date(this.currentYear, this.currentMonth + 1, 0).getDate();
                let firstDayIndex = new Date(this.currentYear, this.currentMonth, 1).getDay();
                firstDayIndex = (firstDayIndex === 0) ? 6 : firstDayIndex - 1;
    
                const weekRow = document.createElement('div');
                weekRow.classList.add('calendar', 'week-row');
                daysOfWeek.forEach(day => {
                    const weekDay = document.createElement('div');
                    weekDay.classList.add('day', 'week-day');
                    weekDay.textContent = day;
                    weekRow.appendChild(weekDay);
                });
                childCalendar.appendChild(weekRow);
    
                const daysList = document.createElement('div');
                daysList.classList.add('calendar');
    
                // Añadir días vacíos antes del primer día del mes
                for (let i = 0; i < firstDayIndex; i++) {
                    const emptyDay = document.createElement('div');
                    emptyDay.classList.add('day');
                    emptyDay.textContent = '';
                    daysList.appendChild(emptyDay);
                }
    
                // Añadir los días del mes
                for (let i = 1; i <= daysInMonth; i++) {
                    const day = document.createElement('div');
                    day.classList.add('day');
                    day.textContent = i;
                
                    const date = new Date(this.currentYear, this.currentMonth, i);
                    if (date.getDay() === 6 || date.getDay() === 0) {
                        day.classList.add('weekend');
                    }
                
                    const formattedDate = `${('0' + i).slice(-2)}-${('0' + (this.currentMonth + 1)).slice(-2)}-${this.currentYear}`;
                    if (child.dias.includes(formattedDate)) {
                        day.classList.add('blue-day');
                    }
                
                    daysList.appendChild(day);
                }
    
                childCalendar.appendChild(daysList);
                this.calendarContainer.appendChild(childCalendar);
            });
        } else {
            this.calendarContainer.innerHTML = '<p>No hay días marcados para mostrar.</p>';
        }
    }

    /**
     * Método para mostrar u ocultar la vista.
     * @param {boolean} ver - Determina si se muestra (true) u oculta (false) la vista.
     */
    mostrar(ver) {
        super.mostrar(ver);
        this.controlador.obtenerDatosCalendario(this.currentYear, this.currentMonth + 1);
    }
}