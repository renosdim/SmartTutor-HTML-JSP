package teamproject_2024_2025_ismgroup17;

public class Tutor {
    private String first_name;
    private String last_name;
    private String phone;
    private String email;
    private String username;
    private String password;
    private String subject;
	private String course_level;
	private String gender;
	private String date_of_birth;
    private int min_price;
    private int max_price;
    private String teaching_language;
    private String biography;
   

    public Tutor(String username,String first_name,String last_name, String email, String password, String phone, String subject, String course_level, String gender, String date_of_birth, int min_price, int max_price,String teaching_language, String biography){
       this.username = username;
       this.first_name= first_name;
       this.last_name= last_name;
       this.phone= phone;
       this.email= email;
       this.email= email;
       this.password = password;
       this.subject= subject;
       this.course_level= course_level;
       this.gender= gender;
       this.date_of_birth=date_of_birth;
       this.min_price=min_price;
       this.max_price=max_price;
       this.teaching_language= teaching_language;
       this.biography=biography;

       
    }


    public String getSubject() {
        return subject;
    }

    public String getCourseLevel() {
        return course_level;
    }

    public String getPhone(){
        return phone;
    }

    public String getPassword(){
        return password;
    }

    public String getGender() {
        return gender;
    }

    public String getDateOfBirth() {
        return date_of_birth;
    }

    public int getMinPrice() {
        return min_price;
    }

    public int getMaxPrice() {
        return max_price;
    }

    public String getTeachingLanguage() {
        return teaching_language;
    }

    public String getBiography() {
        return biography;
    }

    public String getFirstName(){
        return first_name;
    }

    public String getLastName(){
        return last_name;
    }

    public String getEmail(){
        return email;
    }

    public String getUsername(){
        return username;
    }
}
    

