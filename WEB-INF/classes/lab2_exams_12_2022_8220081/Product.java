package lab2_exams_12_2022_8220081;

public class Product {

        private String code;
        private String name;
        private String company;
        private double price;
        private int isAvailable;

        /**
         * Full constuctor
         * 
         * @param code
         * @param name
         * @param company
         * @param price
         * @param isAvailable
         */
        public Product(String code, String name, String company, double price, int isAvailable) {
                this.code = code;
                this.name = name;
                this.company = company;
                this.price = price;
                this.isAvailable = isAvailable;
        }

        public String getCode() {
                return this.code;
        }

        public String getName() {
                return this.name;
        }

        public String getCompany() {
                return this.company;
        }

        public double getPrice() {
                return this.price;
        }

        public int isAvailable() {
                return this.isAvailable;
        }

        public void setCode(String code) {
                this.code = code;
        }

        public void setName(String name) {
                this.name = name;
        }

        public void setCompany(String company) {
                this.company = company;
        }

        public void setPrice(double price) {
                this.price = price;
        }

        public void setIsAvailable(int isAvailable) {
                this.isAvailable = isAvailable;
        }
}
