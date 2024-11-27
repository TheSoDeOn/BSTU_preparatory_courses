import Announcements from "@/components/Annoucements";
import BigCalendar from "@/components/BigCalendar";

const TeacherPage = () => {
  return (
    <div className="flex-1 p-4 flex gap-4 flex-col xl:flex-row">
      {/* Левая панель */}
      <div className="w-full xl:w-2/3">
        <div className="h-full bg-white p-4 rounded-md">
          <h1 className="text-xl font-semibold">Расписание</h1>
          <BigCalendar />
        </div>
      </div>
      {/* Правая панель */}
      <div className="w-full xl:w-1/3 flex flex-col gap-8">
        <Announcements />
      </div>
    </div>
  );
};

export default TeacherPage;