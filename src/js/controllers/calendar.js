document.addEventListener('DOMContentLoaded', function () {
    const calendar = document.getElementById('calendar');
    const prevMonthBtn = document.getElementById('prevMonth');
    const nextMonthBtn = document.getElementById('nextMonth');
    const monthYearHeader = document.getElementById('monthYear');

    let currentDate = new Date();
    let currentMonth = currentDate.getMonth();
    let currentYear = currentDate.getFullYear();

    renderCalendar(currentYear, currentMonth);

    prevMonthBtn.addEventListener('click', () => {
        currentMonth -= 1;
        if (currentMonth < 0) {
            currentYear -= 1;
            currentMonth = 11;
        }
        renderCalendar(currentYear, currentMonth);
    });

    nextMonthBtn.addEventListener('click', () => {
        currentMonth += 1;
        if (currentMonth > 11) {
            currentYear += 1;
            currentMonth = 0;
        }
        renderCalendar(currentYear, currentMonth);
    });

    function renderCalendar(year, month) {
        calendar.innerHTML = '';
        const monthNames = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
        const daysInMonth = new Date(year, month + 1, 0).getDate();
        const firstDayIndex = new Date(year, month, 1).getDay();
        const lastDayIndex = new Date(year, month, daysInMonth).getDay();

        monthYearHeader.textContent = `${monthNames[month]} ${year}`;

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
            daysList.appendChild(day);
        }
        for (let i = lastDayIndex; i < 6; i++) {
            const emptyDay = document.createElement('div');
            emptyDay.classList.add('day');
            emptyDay.textContent = '';
            daysList.appendChild(emptyDay);
        }
        calendar.appendChild(daysList);

        // Hacer la llamada AJAX para obtener los días marcados
        fetch('../controllers/getReservedDays.php')
            .then(response => response.json())
            .then(data => {
                // Marcar los días devueltos como reservados
                data.forEach(reservedDay => {
                    const dayElement = calendar.querySelector(`.day:nth-child(${reservedDay})`);
                    if (dayElement) {
                        dayElement.classList.add('reserved-day');
                    }
                });
            })
            .catch(error => {
                console.error('Error al obtener los días marcados:', error);
            });
    }
});
