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
        this.festivos = null;
        this.hijos = null;
      

        this.prevMonthBtn.addEventListener('click', () => {
            this.changeMonth(-1);
        });
        
        this.nextMonthBtn.addEventListener('click', () => {
            this.changeMonth(1);
        });
    }

    changeMonth(change) {
        console.log
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

    obtenerFestivos(festivos) {
        this.festivos = festivos;
        this.controlador.dameHijosCalendarioGestion(this.idPadre);
        
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

            const daysOfWeek = ['D', 'L', 'M', 'X', 'J', 'V', 'S']; // Domingo a Sábado
            const daysInMonth = new Date(this.currentYear, this.currentMonth + 1, 0).getDate();
            const firstDayIndex = new Date(this.currentYear, this.currentMonth, 1).getDay();

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
                if (new Date(this.currentYear, this.currentMonth, i).getDay() === 0 || new Date(this.currentYear, this.currentMonth, i).getDay() === 6) { // Domingo o Sábado
                    day.classList.add('weekend');
                }
                setTimeout(() => {
                    console.log(day); // suponiendo que 'day' es un elemento DOM
                    console.log(this.diasComedor); // suponiendo que 'this.diasComedor' es un array de objetos
                    this.diasComedor.forEach((objeto) => {
                        const dia = objeto.dia.split("-")[2]; // obtener el día del objeto
                     
                   console.log(day.textContent)
                    
                    if (day.textContent == dia) {
                        day.classList.add('blue-day');
                    }
                });
                    daysList.appendChild(day); // suponiendo que 'daysList' es un elemento DOM
                }, 2000);
                
            }
           
            childCalendar.appendChild(daysList);
            this.calendarContainer.appendChild(childCalendar);
        });
    }
    this.monthYearHeader.textContent = `${this.currentYear} - ${this.currentMonth + 1}`;
}

}
