import Announcements from "@/components/Annoucements"
import AttendanceChart from "@/components/AttendanceChart"
import CountChart from "@/components/CountChart"
import EventCalendar from "@/components/EventCalendar"
import FinanceChart from "@/components/FinanceChart"
import UserCard from "@/components/UserCard"

const AdminPage = () => {
    return (
        <div className="p-4 flex gap-4 flex-col md:flex-row">
            {/* Левая панель */}
            <div className="w-full lg:w-[67%] flex flex-col gap-8">
             {/* Карточки кол-ва юзеров */}
             <div className="flex gap-4 justify-between flex-wrap">
                <UserCard type="Учеников"/>
                <UserCard type="Преподавателей"/>
                <UserCard type="Родителей"/>
                <UserCard type="Админов"/>
            </div>
            {/* Диаграммы по-центру */}
            <div className="flex gap-4 flex-col lg:flex-row">
                {/* Нижняя полов */}
                <div className="w-full lg-1/3 h-[450px]">
                <CountChart />
                </div>
                {/* Нижняя посещений */}
                <div className="w-full lg-2/3 h-[450px]">
                <AttendanceChart/>
                </div>
            </div>
            {/* Финансовая диаграмма */}
            <div className="w-full h-[500px]">
                <FinanceChart/>
            </div>
            </div>
             {/* Правая панель */}
             <div className="w-full lg:w-[33%] flex flex-col gap-8">
             <EventCalendar/>
             <Announcements/>
             </div>

        </div>
    )
}

export default AdminPage