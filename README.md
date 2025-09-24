# drb_internship
# 🚚 DRB Internship – Logistics Manager App

A simple Flutter app for managing **drivers, vehicles, and trips**.  
Built as part of the DRB Internship task.

---

## 📱 Features

- **Drivers Management**
  - View all drivers
  - See driver details (license, assigned vehicle, ongoing trip, status)
  - Search/filter drivers by name, license, or status

- **Vehicles Management**
  - View all vehicles
  - See vehicle details (type, status, assigned driver, current trip)
  - Search/filter vehicles by name, type, or status

- **Trips Management**
  - View all trips
  - See trip details (pickup, drop-off, driver, vehicle, status)
  - Update trip status (Pending → In Progress → Completed)
  - Assign new trips to available drivers & vehicles
  - Search/filter trips by driver, vehicle, or status

- **Reusable Widgets**
  - Custom `SearchBarWidget`
  - Custom `TextFormField` & `Button`
  - Card widgets for drivers, vehicles, and trips

---

## 🎯 Bonus Implemented

✅ Search & Filter across **Trips, Drivers, Vehicles**  
✅ Trip History (shows all past and ongoing trips)  

---

## 📂 Project Structure
lib/
│── core/
│ ├── features/
│ │ └── presentation/
│ │ └── views/
│ │ ├── widgets/ # Screens & UI components
│ │ └── data/ # Models (Driver, Vehicle, Trip)
│ ├── utilies/
│ ├── widget/ # Reusable widgets (SearchBar, Buttons, etc.)
│ └── ... # Card widgets
│
│── main.dart # App entry point


---

## ⚙️ Installation & Run

1. Clone the repo:
   ```bash
   git clone https://github.com/Menna2Alaa/drb_internship.git
   cd drb_internship
2.Get dependencies:
flutter pub get

3.Run the app:
flutter run



