

# 🏏 CrickTrack

### Cricket Team & Match Management System

CrickTrack is a full-stack web application designed to digitally manage cricket teams, players, and matches. It provides structured database storage, secure authentication, and complete CRUD functionality with user-level data isolation.

---

## 📌 Project Overview

Many small cricket clubs and tournament organizers manage records manually or through scattered spreadsheets. This leads to:

* Data inconsistency
* Difficulty tracking historical records
* Lack of centralized and secure access
* Time-consuming updates

**CrickTrack solves this problem** by providing a centralized, role-based web application where each user manages their own teams, players, and matches securely.

---

## 🚀 Features

### 🔐 Authentication

* User Registration
* User Login
* Session-based authentication
* Protected routes (login required)

### 🏏 Team Management

* Create teams
* View teams
* Edit teams
* Delete teams
* Unique team name per user

### 👤 Player Management

* Add players to teams
* Edit players
* Delete players
* Role selection:

  * Batsman
  * Bowler
  * All Rounder
  * Wicket Keeper

### 📅 Match Management

* Create matches
* Edit matches
* Delete matches
* Match status:

  * Upcoming
  * Completed
* Prevent same team on both sides of a match

### 📊 Dashboard

* Total teams count
* Total players count
* Total matches count
* Completed matches count
* Recent matches list

### ✅ Validation & Security

* Client-side form validation
* Server-side API validation
* Ownership checks (multi-user isolation)
* Proper HTTP status codes
* JSON error responses

---

## 🛠 Technology Stack

### Frontend

* HTML5
* CSS3
* Vanilla JavaScript

### Backend

* Node.js
* Express.js

### Database

* MySQL (Relational Database)
* mysql2/promise (connection pool)

### Version Control

* Git
* GitHub

---

## 📂 Project Structure

```
crictrack/
│
├── backend/
│   ├── server.js
│   ├── db.js
│   ├── schema.sql
│   ├── migrate_multitenant.sql
│   ├── create.js
│   ├── .env
│   └── package.json
│
├── frontend/
│   ├── home.html
│   ├── login.html
│   ├── dashboard.html
│   ├── teams.html
│   ├── style.css
│   └── script.js
│
├── .gitignore
├── package.json
└── README.md
```

---

## 🗄 Database Design

### Tables

1. `users`
2. `teams`
3. `players`
4. `matches`

### Relationships

* One user → Many teams
* One team → Many players
* One user → Many matches
* Each match references two teams (`team1_id`, `team2_id`)

### Constraints

* Primary keys on all tables
* Foreign key relationships
* Unique team name per user
* Check constraint to prevent same team in both sides of a match

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/hamzakazmi26/crictrack.git
cd crictrack
```

---

### 2️⃣ Setup MySQL Database

Create a database:

```sql
CREATE DATABASE crictrack;
USE crictrack;
```

Run the schema:

```bash
mysql -u root -p crictrack < backend/schema.sql
```

---

### 3️⃣ Configure Environment Variables

Create a `.env` file inside the `backend` folder:

```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=crictrack
PORT=4000
SESSION_SECRET=your_secret_key
```

---

### 4️⃣ Install Backend Dependencies

```bash
cd backend
npm install
```

---

### 5️⃣ Start the Server

```bash
node server.js
```

Server will run on:

```
http://localhost:4000
```

---

### 6️⃣ Open Frontend

Open `home.html` in your browser
OR serve frontend using a local server.

---

## 📡 API Routes

### Authentication

* `POST /api/auth/register`
* `POST /api/auth/login`

### Teams

* `GET /api/teams`
* `POST /api/teams`
* `PUT /api/teams/:id`
* `DELETE /api/teams/:id`

### Players

* `GET /api/teams/:id/players`
* `POST /api/teams/:id/players`
* `PUT /api/players/:id`
* `DELETE /api/players/:id`

### Matches

* `GET /api/matches`
* `POST /api/matches`
* `PUT /api/matches/:id`
* `DELETE /api/matches/:id`

### Dashboard

* `GET /api/dashboard/summary`

---

## 🎯 Project Objectives Achieved

* Full-stack architecture
* RESTful API design
* Relational database integration
* Multi-user data isolation
* Complete CRUD functionality
* Structured validation

---

## 🔮 Future Enhancements

* Stronger form validation
* Search & filter functionality
* Sort match history by date
* Improved mobile responsiveness
* Forgot password feature
* Change password feature
* Enhanced dashboard analytics

---

## 👨‍💻 Authors

* Syed Hamza Ali Kazmi
* Ibrahim Ahmed Fayyaz
* Momin Bhatti

Department of Software Engineering
Mirpur University of Science and Technology
Session 2023–2027

---

## 📄 License

This project is developed for academic purposes (Web Engineering Course Project).

---

