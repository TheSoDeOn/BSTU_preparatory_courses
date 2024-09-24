import EventCalendar from "@/components/EventCalendar"
import Announcements from "@/components/Annoucements"
import BigCalendar from "@/components/BigCalendar"

const StudentPage = () => {
    return (
        <div className="p-4 flex gap-4 flex-col xl:flex-row">
            {/* Левая часть */}
            <div className="w-full xl:w-[67%]">
                <div className="h-full bg-white p-4 rounded-md">
                    <h1 className="text-xl font-semibold">Расписание</h1>
                    <BigCalendar />
                </div>
            </div>
             {/* Правая панель */}
             <div className="w-full xl:w-[33%] flex flex-col gap-8">
             <EventCalendar/>
             <Announcements/>
             </div>
        </div>
    )
}

export default StudentPage