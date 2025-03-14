package lab_exams_12_2022_8220081;

public class Employee {

        private String afm;
        private String firstname;
        private String lastname;
        private double salary;
        private int isExternal;

        /**
         * Full constuctor
         * 
         * @param afm
         * @param firstname
         * @param lastname
         * @param salary
         * @param isExternal
         */
        public Employee(String afm, String firstname, String lastname, double salary,
                        int isExternal) {
                this.afm = afm;
                this.firstname = firstname;
                this.lastname = lastname;
                this.salary = salary;
                this.isExternal = isExternal;
        }

        public String getAfm() {
                return this.afm;
        }

        public String getFirstname() {
                return this.firstname;
        }

        public String getLastname() {
                return this.lastname;
        }

        public double getSalary() {
                return this.salary;
        }

        public int getisExternal() {
                return this.isExternal;
        }

        public void setAfm(String afm) {
                this.afm = afm;
        }

        public void setFirstname(String firstname) {
                this.firstname = firstname;
        }

        public void setLastname(String lastname) {
                this.lastname = lastname;
        }

        public void setSalary(double salary) {
                this.salary = salary;
        }

        public void setisExternal(int isExternal) {
                this.isExternal = isExternal;
        }
}
