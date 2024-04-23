document.addEventListener('DOMContentLoaded', function () {
    const calendarContainer = document.getElementById('calendar-container');
    const prevMonthBtn = document.getElementById('prevMonth');
    const nextMonthBtn = document.getElementById('nextMonth');
    const monthYearHeader = document.getElementById('monthYear');
    const hijos = obtenerHijos();

    let currentDate = new Date();
    let currentMonth = currentDate.getMonth();
    let currentYear = currentDate.getFullYear();

    renderCalendars(currentYear, currentMonth);

    prevMonthBtn.addEventListener('click', () => {
        currentMonth -= 1;
        if (currentMonth < 0) {
            currentYear -= 1;
            currentMonth = 11;
        }
        renderCalendars(currentYear, currentMonth);
    });
    function obtenerHijos() {
        return [
            {
                nombre: 'Hijo 1',
                diasReservados: [1, 5, 15] // Ejemplo de días reservados para el primer hijo
            },
            {
                nombre: 'Hijo 2',
                diasReservados: [8, 10, 25] // Ejemplo de días reservados para el segundo hijo
            },
        ];
    }
    
    nextMonthBtn.addEventListener('click', () => {
        currentMonth += 1;
        if (currentMonth > 11) {
            currentYear += 1;
            currentMonth = 0;
        }
        renderCalendars(currentYear, currentMonth);
    });

    function renderCalendars(year, month) {
        calendarContainer.innerHTML = '';

        // Renderizar calendario para cada hijo
        hijos.forEach(hijo => {
            const childCalendar = document.createElement('div');
            childCalendar.classList.add('child-calendar');

            const monthNames = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
            const daysOfWeek = ['L', 'M', 'X', 'J', 'V', 'S', 'D']; // Modificado para que comience en Domingo
            const daysInMonth = new Date(year, month + 1, 0).getDate();
            const firstDayIndex = new Date(year, month, 1).getDay();

            const childMonthYearHeader = document.createElement('h2');
            childMonthYearHeader.textContent = `${monthNames[month]} ${year} - ${hijo.nombre}`;
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
                if (new Date(year, month, i).getDay() === 5 || new Date(year, month, i).getDay() === 6) { // Domingo o Sábado
                    day.classList.add('weekend');
                }

                // Identificar días reservados y marcarlos
                if (hijo.diasReservados.includes(i)) {
                    day.classList.add('reserved-day');
                }

                // Identificar días festivos y marcarlos
                if (esFestivo(year, month, i)) {
                    day.classList.add('festivo');
                }

                daysList.appendChild(day);
            }
            childCalendar.appendChild(daysList);
            calendarContainer.appendChild(childCalendar);
        });
    }

    // Función para determinar si un día es festivo
    function esFestivo(year, month, day) {
        // IMPLEMENTAR LISTA FESTIVOS
        if (year === 2024 && month === 3 && day === 1) { // Verifica si es el 1 de mayo de 2024
            return true;
        }
        return false;
    }
});
