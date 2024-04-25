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
        this.currentYear = currentDate.getFullYear();

        this.renderCalendars(this.currentYear, this.currentMonth);

        this.prevMonthBtn.addEventListener('click', () => {
            this.currentMonth -= 1;
            if (this.currentMonth < 0) {
                this.currentYear -= 1;
                this.currentMonth = 11;
            }
            this.renderCalendars(this.currentYear, this.currentMonth);
        });

        this.nextMonthBtn.addEventListener('click', () => {
            this.currentMonth += 1;
            if (this.currentMonth > 11) {
                this.currentYear += 1;
                this.currentMonth = 0;
            }
            this.renderCalendars(this.currentYear, this.currentMonth);
        });
    }
/**
     * Devuelve los hijos de un padre a la vista de gestión de hijos.
     * @param {Number} id ID del padre. 
     */
dameHijos(id) {
    this.modelo.dameHijos(id)
     .then(hijos => {
         this.vistaGestionHijos.cargarListado(hijos);
     })
     .catch(e => {
         console.error(e)
     })
}
    
/**
     * Obtiene los días de comedor de los hijos.
     * @param {Array} idHijos Array con los IDs de los hijos.
     */
    obtenerDiasComedor(idHijos) {
        console.log("ENTRANDO EN DIA")
        this.modelo.obtenerDiasComedor(idHijos)
        .then(dias => {
            this.vistaInicio.montarCalendario(dias);
        })
        .catch(e => {
            console.error(e);
        })
    }

    renderCalendars(year, month) {
        this.calendarContainer.innerHTML = '';

        // Renderizar calendario para cada hijo
        
            const childCalendar = document.createElement('div');
            childCalendar.classList.add('child-calendar');

            const monthNames = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
            const daysOfWeek = ['L', 'M', 'X', 'J', 'V', 'S', 'D']; // Modificado para que comience en Domingo
            const daysInMonth = new Date(year, month + 1, 0).getDate();
            const firstDayIndex = new Date(year, month, 1).getDay();

            const childMonthYearHeader = document.createElement('h2');
            childMonthYearHeader.textContent = `${monthNames[month]} ${year}`;
            childCalendar.appendChild(childMonthYearHeader);

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
                if (new Date(year, month, i).getDay() === 6 || new Date(year, month, i).getDay() === 6) { // Domingo o Sábado
                    day.classList.add('weekend');
                }

                daysList.appendChild(day);
            }
            childCalendar.appendChild(daysList);
            this.calendarContainer.appendChild(childCalendar);
    
    }
    mostrar(ver) {
        super.mostrar(ver);
        if (ver) {
            this.renderCalendars(this.currentYear, this.currentMonth);
        }
    }
}