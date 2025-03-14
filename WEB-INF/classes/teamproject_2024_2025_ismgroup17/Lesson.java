package teamproject_2024_2025_ismgroup17;

public class Lesson{
    private String studentid;
    private String tutorid;
    private String date;
    private String time;

    public Lesson(String studentId, String tutorId, String date, String time){
        this.studentid=studentId;
        this.tutorid=tutorId;
        this.date=date;
        this.time=time;
    }

    public String getStudentId() {
        return studentid;
    }

    public String getTutorId() {
        return tutorid;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }
}