import Announcements from "@/components/Annoucements";
import AttendanceChartContainer from "@/components/AttendanceChartContainer";
import CountChartContainer from "@/components/CountChartContainer";
import EventCalendar from "@/components/EventCalendar";
import EventCalendarContainer from "@/components/EventCalendarContainer";
import FinanceChart from "@/components/FinanceChart";
import UserCard from "@/components/UserCard";

const AdminPage = ({
  searchParams,
}: {
  searchParams: { [keys: string]: string | undefined };
}) => {
  return (
    <div className="p-4 flex gap-4 flex-col md:flex-row">
      {/* Левая панель */}
      <div className="w-full lg:w-[67%] flex flex-col gap-8">
        {/* Карточки кол-ва юзеров */}
        <div className="flex gap-4 justify-between flex-wrap">
          <UserCard type="student" />
          <UserCard type="teacher" />
          <UserCard type="parent" />
          <UserCard type="admin" />
        </div>
        {/* Диаграммы по-центру */}
        <div className="flex gap-4 flex-col lg:flex-row">
          {/* Нижняя полов */}
          <div className="w-full lg-1/3 h-[450px]">
            <CountChartContainer />
          </div>
          {/* Нижняя посещений */}
          <div className="w-full lg-2/3 h-[450px]">
            <AttendanceChartContainer />
          </div>
        </div>
        {/* Финансовая диаграмма */}
        <div className="w-full h-[500px]">
          <FinanceChart />
        </div>
      </div>
      {/* Правая панель */}
      <div className="w-full lg:w-[33%] flex flex-col gap-8">
        <EventCalendarContainer searchParams={searchParams} />
        <Announcements />
      </div>
    </div>
  );
};

export default AdminPage;
