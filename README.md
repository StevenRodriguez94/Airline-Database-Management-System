# ✈️ Airline Database Management System

A full-stack web application designed to streamline the airline booking process. Built with Java, JSP, JDBC, and MySQL, this system enables role-based access for customers, administrators, and customer representatives to manage flights, bookings, cancellations, and more.

---

## 📌 Features

- 🔐 **Role-Based Access Control**  
  Different dashboards and privileges for:
  - **Admins**: Manage flights and users  
  - **Customer Representatives**: Assist with bookings and modifications  
  - **Customers**: Search, book, and cancel flights

- 📄 **Flight Booking & Management**  
  - Search available flights  
  - Book and cancel tickets  
  - View reservation history

- 🧮 **Database Integration**  
  - Efficient MySQL schema for scalable data handling  
  - Real-time updates using JDBC

- 🖥️ **Responsive UI**  
  - Built with HTML, CSS, and JSP  
  - User-friendly interface for all user types

---

## 🛠️ Tech Stack

| Layer        | Technologies                             |
|--------------|------------------------------------------|
| **Frontend** | HTML, CSS, JSP                           |
| **Backend**  | Java, JDBC                                |
| **Database** | MySQL                                     |
| **Server**   | Apache Tomcat                             |
| **Tools**    | Maven, Git                                |

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

- Java 8+
- MySQL
- Apache Tomcat 9+
- Maven

### Database Setup

1. Create the database and tables using the provided SQL scripts in `/sql/airline_schema.sql`.
2. Update your database credentials in the project config files (e.g., `db.properties` or inside JDBC connection strings).
