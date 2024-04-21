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
            // Marcando solo los días de abril y mayo
            if ((month === 3 && i === 5) || (month === 4 && (i === 10 || i === 20))) {
                day.classList.add('reserved-day');
            }
            daysList.appendChild(day);
        }
        for (let i = lastDayIndex; i < 6; i++) {
            const emptyDay = document.createElement('div');
            emptyDay.classList.add('day');
            emptyDay.textContent = '';
            daysList.appendChild(emptyDay);
        }
        calendar.appendChild(daysList);
    }
});
