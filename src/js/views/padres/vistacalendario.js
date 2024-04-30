import { Vista } from '../vista.js'; 

export class VistaCalendario extends Vista {
    constructor(controlador, div) {
        super(controlador, div);
        this.calendarContainer = document.getElementById('calendarGestion-container');
        this.prevMonthBtn = document.getElementById('prevMonth');
        this.nextMonthBtn = document.getElementById('nextMonth');
        this.monthYearHeader = document.getElementById('monthYear');
        let currentDate = new Date();
        this.currentMonth = currentDate.getMonth();
        this.idPadre = 0;
        this.currentYear = currentDate.getFullYear();
        

        this.renderCalendars(this.hijos,this.currentYear, this.currentMonth);

        this.prevMonthBtn.addEventListener('click', () => {
            this.currentMonth -= 1;
            if (this.currentMonth < 0) {
                this.currentYear -= 1;
                this.currentMonth = 11;
            }
            this.renderCalendars(); // No necesitas pasar this.hijos aquí
        });
        
        this.nextMonthBtn.addEventListener('click', () => {
            this.currentMonth += 1;
            if (this.currentMonth > 11) {
                this.currentYear += 1;
                this.currentMonth = 0;
            }
            this.renderCalendars(); // No necesitas pasar this.hijos aquí
        });
        
    }

    /**
     * Hacer set del ID del padre, y pedir los hijos del padre al controlador.
     * @param {Object} datos Datos del padre.
     */
    obtenerPadre(datos) {
        this.idPadre = datos.id;
    }
    /**
     * Obtener los días festivos que haya en el mes actual.
     * @param {Array} festivos 
     */
    obtenerFestivos(festivos) {
        this.festivos = festivos;
        this.controlador.dameHijosCalendarioGestion(this.idPadre);
    }

    /**
     * Actualiza el listado.
     * @param {Object} datos Datos del padre.
     */
    actualizar(datos) {
        this.idUsuario = datos.id;
        this.controlador.dameHijosGestion(this.idUsuario);
    }

    /**
     * Recibir los hijos, y hacer llamada para obtener todos los días de comedor de los hijos.
     * @param {Array} hijos Array de los hijos.
     */
    inicializar(hijos) {
        this.hijos = hijos;
        let idHijos = [];

        if (this.hijos.length > 0) {
            for (let hijo of this.hijos)  
                idHijos.push(hijo.id);

            this.controlador.obtenerDiasComedorGestion(idHijos);
        }
        else {
            this.renderCalendars(hijos);   // Iniciar calendario en blanco (no se mostrará).
        }
    }

    renderCalendars(hijos) {
        console.log(this.hijos);
        if (hijos != null) {
            hijos.forEach(hijo => {
                const childCalendar = document.createElement('div');
                childCalendar.classList.add('child-calendar');
    
                // Agregar el nombre del hijo al título del calendario
                const childMonthYearHeader = document.createElement('h2');
                childMonthYearHeader.textContent = `${hijo.nombre}`;
                childCalendar.appendChild(childMonthYearHeader);
    
                const monthNames = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                const daysOfWeek = ['D','L', 'M', 'X', 'J', 'V', 'S']; // Domingo a Sábado
                const currentDate = new Date(); // Fecha actual para obtener año y mes
                const year = currentDate.getFullYear(); // Año actual
                const month = currentDate.getMonth(); // Mes actual (0-11)
                const daysInMonth = new Date(year, month + 1, 0).getDate();
                const firstDayIndex = new Date(year, month, 1).getDay();
    
                const weekRow = document.createElement('div');
                weekRow.classList.add('calendar', 'week-row');
                daysOfWeek.forEach(day => {
                    const weekDay = document.createElement('div');
                    weekDay.classList.add('day', 'week-day');
                    weekDay.textContent = day;
                    weekRow.appendChild(weekDay);
                });
                childCalendar.appendChild(weekRow);
            const weekRow = document.createElement('div');
            weekRow.classList.add('calendar', 'week-row');
            daysOfWeek.forEach(day => {
                const weekDay = document.createElement('div');
                weekDay.classList.add('day', 'week-day');https://github.com/ManuNB7/AppComedor/blob/manuelSprint2/src/js/views/padres/vistacalendario.js
                weekDay.textContent = day;
                weekRow.appendChild(weekDay);
            });
            childCalendar.appendChild(weekRow);
    
                const daysList = document.createElement('div');
                daysList.classList.add('calendar');
                for (let i = 0; i < firstDayIndex; i++) {
                    const emptyDay = document.createElement('div');
                    emptyDay.classList.add('day');
                    emptyDay.textContent = '';
                    daysList.appendChild(emptyDay);
                }
                for (let i = 1; i <= daysInMonth; i++) {
                    const day = document.createElement('div');
                    day.classList.add('day');
                    day.textContent = i;
    
                    // Identificar fines de semana (Sábado y Domingo)
                    if (new Date(year, month, i).getDay() === 0 || new Date(year, month, i).getDay() === 6) { // Domingo o Sábado
                        day.classList.add('weekend');
                    }
    
                    daysList.appendChild(day);
                }
                childCalendar.appendChild(daysList);
                this.calendarContainer.appendChild(childCalendar);
            });
        }
    }
    
    
    
    /*mostrar(ver) {
        super.mostrar(ver);
        if (ver) {
            this.renderCalendars(this.hijos);
            this.renderCalendars(hijos);
        }
    }*/
}
