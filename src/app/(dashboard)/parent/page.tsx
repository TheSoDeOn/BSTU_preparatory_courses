import Announcements from "@/components/Annoucements";
import BigCalendarContainer from "@/components/BigCalendarContainer";
import prisma from "@/lib/prisma";
import { auth } from "@clerk/nextjs/server";


const ParentPage = async () => {
  const { userId } = await auth();
  const currentUserId = userId;
  
  const students = await prisma.student.findMany({
    where: {
      parentId: currentUserId!,
    },
  });

  return (
    <div className="flex-1 p-4 flex gap-4 flex-col xl:flex-row">
      {/* Левая панель */}
      <div className="w-full xl:w-2/3">
        {students.map((student) => (
          <div className="" key={student.id}>
            <div className="h-full bg-white p-4 rounded-md">
              <h1 className="text-xl font-semibold">
                Расписание ({student.surname + " " + student.name})
              </h1>
              {<BigCalendarContainer type="classId" id={student.classId} />}
            </div>
          </div>
        ))}
      </div>
      {/* Правая панель */}
      <div className="w-full xl:w-1/3 flex flex-col gap-8">
        <Announcements />
      </div>
    </div>
  );
};

export default ParentPage;