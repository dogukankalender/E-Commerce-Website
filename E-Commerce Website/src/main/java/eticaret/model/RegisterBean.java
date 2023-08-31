package eticaret.model;
 
public class RegisterBean {
 
 private String name;
 private String email;
 private String password;
 

 public String getPassword() {
 return password;
 }
 public void setPassword(String password) {
 this.password = password;
 }
 public void setName(String name) {
 this.name = name;
 }
 public String getName() {
 return name;
 }
 public void setEmail(String email) {
 this.email = email;
 }
 public String getEmail() {
 return email;
 }
}