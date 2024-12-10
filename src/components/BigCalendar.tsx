"use client";

import { Calendar, momentLocalizer, View, Views } from "react-big-calendar";
import moment from "moment";
import "react-big-calendar/lib/css/react-big-calendar.css";
import { useState } from "react";
import {
  getDayFormat,
  getMonthFormat,
  getWeekDayFormat,
  getWeekFormat,
} from "@/lib/days";


const localizer = momentLocalizer(moment);

const BigCalendar = ({
  data,
}: {
  data: { title: string; start: Date; end: Date }[];
}) => {
  const [view, setView] = useState<View>(Views.WORK_WEEK);

  const handleOnChangeView = (selectedView: View) => {
    setView(selectedView);
  };

  return (
    <Calendar
      localizer={localizer}
      events={data}
      startAccessor="start"
      endAccessor="end"
      views={["work_week", "day"]}
      view={view}
      style={{ height: "98%", display: "flex"}}
      onView={handleOnChangeView}
      min={new Date(2024, 1, 0, 12, 0, 0)}
      max={new Date(2025, 1, 0, 21, 0, 0)}
      messages={{
        next: "вперёд",
        previous: "назад",
        today: "сегодня",
        month: "месяц",
        week: "неделя",
        day: "день",
        work_week: "неделя",
      }}
      formats={{
        timeGutterFormat: "HH:mm",
        dayHeaderFormat: (date) => getDayFormat(date),
        dayRangeHeaderFormat: (date) => getWeekFormat(date.start, date.end),
        monthHeaderFormat: (date) => getMonthFormat(date),
        dayFormat: getWeekDayFormat,
        eventTimeRangeFormat: ({ start, end }) => {
          return `${moment(start).format("HH:mm")} - ${moment(end).format(
            "HH:mm"
          )}`;
        },
      }}
    />
  );
};

export default BigCalendar;
