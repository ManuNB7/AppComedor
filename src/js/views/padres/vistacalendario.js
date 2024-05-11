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
        this.diasComedor = null;
        this.hijos = null;
      

        this.prevMonthBtn.addEventListener('click', () => {
            this.changeMonth(-1);
        });
        
        this.nextMonthBtn.addEventListener('click', () => {
            this.changeMonth(1);
        });
    }

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

    obtenerPadre(datos) {
        this.idPadre = datos.id;
        
    }
    obtenerDiasComedor(datos) {
        this.diasComedor =datos;      
    }

    actualizar(datos) {
        this.idUsuario = datos.id;
        this.controlador.dameHijosGestion(this.idUsuario);
    }
    cargarHijos(hijos){
        this.hijos = hijos;
    }

    renderCalendars(hijos) {
        if (hijos != null) {
            this.calendarContainer.innerHTML = ''; // Limpiar el contenedor antes de renderizar

            hijos.forEach(child => {
                const childCalendar = document.createElement('div');
                childCalendar.classList.add('child-calendar');
    
                // Obtener el nombre del mes actual
                const monthNames = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                const monthName = monthNames[this.currentMonth]; // Utilizar this.currentMonth
                // Agregar el nombre del hijo y el nombre del mes al título del calendario
                const childMonthYearHeader = document.createElement('h2');
                childMonthYearHeader.textContent = `${child.nombre} - ${monthName} Calendario`; // Utilizar child.currentMonth
                childCalendar.appendChild(childMonthYearHeader);
    
                // Cambiar los días de la semana para que empiecen en lunes
                const daysOfWeek = ['L', 'M', 'X', 'J', 'V', 'S', 'D']; // Lunes a Domingo
                const daysInMonth = new Date(this.currentYear, this.currentMonth + 1, 0).getDate();
                // Obtener el índice del primer día del mes, ajustando si es necesario para que sea lunes
                let firstDayIndex = new Date(this.currentYear, this.currentMonth, 1).getDay();
                if (firstDayIndex === 0) {
                    firstDayIndex = 6; // Si es domingo, cambiar a 6 (último día de la semana)
                } else {
                    firstDayIndex -= 1; // Restar 1 para que el lunes sea el primer día
                }
    
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
    
                setTimeout(() => {
                    // Filtrar los días reservados que pertenecen al mes actual y al hijo actual
                    const reservedDaysThisMonth = this.diasComedor.filter(objeto => {
                        const dayMonth = new Date(objeto.dia).getMonth();
                        const dayYear = new Date(objeto.dia).getFullYear();
                        return dayMonth === this.currentMonth && dayYear === this.currentYear && objeto.idPersona === child.id;
                    });
    
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
                        if (new Date(this.currentYear, this.currentMonth, i).getDay() === 6 || new Date(this.currentYear, this.currentMonth, i).getDay() === 0) { // Sábado o Domingo
                            day.classList.add('weekend');
                        }
    
                        // Verificar si el día está reservado y agregar la clase correspondiente
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
        this.monthYearHeader.textContent = `${this.currentYear} - ${this.currentMonth + 1}`;
    }
    
    mostrar(ver) {
        console.log("ENTRANDO EN MOSTRAR")
        super.mostrar(ver);
        if (ver) this.renderCalendars();    // Al volver a mostrar la vista, refrescar calendario.
    }
}