MyFirstJavaWebApp - ready for NetBeans + Tomcat

Author: Rimsha (230000) - Section A
Lab: 04

How to run:
1. Import the project into NetBeans: File -> Open Project -> select the folder /MyFirstJavaWebApp
2. Ensure you have Tomcat registered in NetBeans (Services -> Servers -> Add Server).
3. Create database and user in MySQL (phpMyAdmin):
   - Run the SQL provided in lab instructions to create 'my_first_webapp' and 'users' table.
   - Make sure the DB user is 'webuser' with password 'web1234' or update dispatcher-servlet.xml datasource.
4. Right-click project -> Run. Access: http://localhost:8080/MyFirstJavaWebApp/

Notes:
- Java package: com.example.myfirstjavawebapp
- JSPs are under WEB-INF/views so they are only accessible via controller.
- If you want filenames changed to match exact roll number/section, replace the author/headers in Java files.
