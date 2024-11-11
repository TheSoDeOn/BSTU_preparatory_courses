export const WEEK_DAYS = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье',
  ];
  
  export const WEEK_DAYS_SHORT = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  
  export const MONTHS_COUNTABLE = [
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря',
  ];
  
  export const MONTHS = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];
  
  export const getDayFormat = (date: Date) => {
    const dateNumber = date.getDate();
    const monthNumber = date.getMonth();
    return `${`0${dateNumber.toString()}`.slice(-2)} ${
      MONTHS_COUNTABLE[monthNumber]
    }, ${WEEK_DAYS[date.getDay() === 0 ? 6 : date.getDay() - 1]?.toLowerCase()}`;
  };
  
  export const getMonthFormat = (date: Date) => {
    const monthNumber = date.getMonth();
    return `${MONTHS[monthNumber]} ${date.getFullYear()}`;
  };
  
  export const getWeekFormat = (start: Date, end: Date) => {
    const startDate = `${`0${start.getDate().toString()}`.slice(-2)} ${
      MONTHS_COUNTABLE[start.getMonth()]
    }`;
    const endDate = `${`0${end.getDate().toString()}`.slice(-2)} ${
      MONTHS_COUNTABLE[end.getMonth()]
    }`;
    return `${startDate} — ${endDate}`;
  };
  
  export const getWeekDayFormat = (date: Date) => {
    return `${
      WEEK_DAYS_SHORT[date.getDay() === 0 ? 6 : date.getDay() - 1]
    }, ${`0${date.getDate().toString()}`.slice(-2)}`;
  };
  
  export const getHoursFormat = (date: Date) => {
    return `${`0${date.getHours().toString()}`.slice(-2)}:${`0${date
      .getMinutes()
      .toString()}`.slice(-2)}`;
  };
  
  export const getShowMoreMessage = (count: number): string => {
    const val = count % 10;
    if ((val === 0 && val >= 5 && val <= 9) || (count > 10 && count < 20)) {
      return `+ ${count} событий`;
    }
    if (val === 1) {
      return `+ ${count} событие`;
    }
    if (val >= 2 && val <= 4) {
      return `+ ${count} события`;
    }
    return `+ ${count} событий`;
  };
  
  export const getTimeRangeEvent = (start: Date, end: Date) => {
    return `${getHoursFormat(start)} — ${getHoursFormat(end)}`;
  };