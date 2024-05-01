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
        setTimeout(() => {
            this.renderCalendars();
        }, 2000);
        

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
        this.renderCalendars();
    }

    obtenerPadre(datos) {
        this.idPadre = datos.id;
        
    }
    obtenerDiasComedor(datos) {
        // Verificar si datos es un array antes de intentar mapearlo
        if (Array.isArray(datos)) {
            // Extraer el idPersona y el día de los objetos en la lista de días de comedor
            this.diasComedor = datos.map(item => {
                return { idPersona: item.idPersona, dia: new Date(item.dia).getDate() };
            });
        } else {
            // Si datos no es un array, asignar null a this.diasComedor o manejarlo según corresponda
            this.diasComedor = null; // O cualquier otra lógica de manejo de errores
        }
    }
    

    obtenerFestivos(festivos) {
        this.festivos = festivos;
        this.controlador.dameHijosCalendarioGestion(this.idPadre);
        
    }

    actualizar(datos) {
        this.idUsuario = datos.id;
        this.controlador.dameHijosGestion(this.idUsuario);
        
    }

    renderCalendars(hijos) {
        if (hijos != null) {
            let hasMarkedDays = false; // Variable para verificar si hay algún día marcado
    
            hijos.forEach(hijo => {
                const childCalendar = document.createElement('div');
                childCalendar.classList.add('child-calendar');
    
                // Obtener el nombre del mes actual
                const monthNames = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                const currentDate = new Date();
                const currentMonth = currentDate.getMonth();
                const monthName = monthNames[currentMonth];
    
                // Agregar el nombre del hijo y el nombre del mes al título del calendario
                const childMonthYearHeader = document.createElement('h2');
                childMonthYearHeader.textContent = `${hijo.nombre} - ${monthName} Calendario`;
                childCalendar.appendChild(childMonthYearHeader);
    
                const daysOfWeek = ['L', 'M', 'X', 'J', 'V', 'S', 'D']; // Lunes a Domingo
                const year = currentDate.getFullYear(); // Año actual
                const daysInMonth = new Date(year, currentMonth + 1, 0).getDate();
                const firstDayIndex = new Date(year, currentMonth, 1).getDay();
                const adjustedFirstDayIndex = (firstDayIndex === 0) ? 6 : firstDayIndex - 1;
    
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
                for (let i = 0; i < adjustedFirstDayIndex; i++) {
                    const emptyDay = document.createElement('div');
                    emptyDay.classList.add('day');
                    emptyDay.textContent = '';
                    daysList.appendChild(emptyDay);
                }
                for (let i = 1; i <= daysInMonth; i++) {
                    const day = document.createElement('div');
                    day.classList.add('day');
                    day.textContent = i;
    
                    // Identificar si el día es un sábado o domingo y no aplicar el estilo azul
                    const currentDay = new Date(year, currentMonth, i).getDay();
                    if (currentDay === 0 || currentDay === 6) { // Domingo o Sábado
                        day.classList.add('weekend');
                    } else {
                        setTimeout(() => {
                            // Identificar si this.diasComedor no es null y luego filtrar los días marcados
                            if (this.diasComedor !== null) {
                                const comedorHijo = this.diasComedor.filter(item => item.idPersona === hijo.id && item.dia === i);
                                if (comedorHijo.length > 0) {
                                    day.classList.add('blue-day');
                                    hasMarkedDays = true; // Hay al menos un día marcado
                                }
                            }
    
                            // Verificar si todos los días han sido procesados y mostrar el mensaje de error si no hay días marcados
                            if (i === daysInMonth) {
                                if (!hasMarkedDays) {
                                    // Si no hay ningún día marcado en ningún calendario, mostrar mensaje de error
                                    const errorMessage = document.createElement('p');
                                    errorMessage.textContent = 'No hay ningún día marcado en el calendario.';
                                    this.calendarContainer.appendChild(errorMessage);
                                }
                            }
                        }, 2000);
                    }
    
                    daysList.appendChild(day);
                }
    
                childCalendar.appendChild(daysList);
                this.calendarContainer.appendChild(childCalendar);
            });
        }
    
        this.monthYearHeader.textContent = `${this.currentYear} - ${this.currentMonth + 1}`;
    }
    
    
}
