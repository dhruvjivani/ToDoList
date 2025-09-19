<!DOCTYPE html>

<html>
<head>
<style>
body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    line-height: 1.6;
    color: #333;
    background-color: #f6f8fa;
}
h1, h2, h3 {
    color: #1a73e8;
}
code {
    background-color: #eaeaea;
    padding: 2px 5px;
    border-radius: 4px;
}
pre {
    background-color: #eaeaea;
    padding: 10px;
    border-radius: 5px;
    overflow-x: auto;
}
button, a.button {
    background-color: #1a73e8;
    color: white;
    padding: 8px 15px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
}
a.button:hover {
    background-color: #1665c1;
}
ul {
    margin-top: 0;
}
</style>
</head>
<body>

# Travel Journal App – Assignment 2

## Overview

This is a simple **multi-screen Travel Journal app** built with **SwiftUI**. Users can record one trip at a time, view its details, and optionally edit it. The app uses **in-memory storage only**—no Core Data, UserDefaults, or external persistence.

---

## Features

* **Multi-Screen Navigation** using `NavigationStack`

  * **HomeView** – Landing page with options to add or view a trip
  * **AddTripView** – Compact form to input trip details
  * **TripDetailView** – Read-only summary of the trip with optional edit
* **Single In-Memory Trip** – Only one trip is stored at a time
* **Compact Layouts** – No scrolling required; fits common iPhone screens
* **Image Selection** – Choose from predefined asset images (`rome`, `banff`, `tokyo`) with a preview
* **Validation**

  * Title and Location must have ≥2 characters
  * Start date must be ≤ End date
  * Notes ≤ 120 characters
  * Save button disabled until all validations pass
* **Custom Modifiers**

  * `TitleStyle` – Bold and styled titles
  * `CardStyle` – Card-like appearance with padding, corner radius, and shadow
* **Light & Dark Mode Support**

---

## File Structure

```
TravelJournal/
├── Models/
│   └── Trip.swift
├── Styles/
│   └── Modifiers.swift
├── Views/
│   ├── HomeView.swift
│   ├── AddTripView.swift
│   └── TripDetailView.swift
└── TravelJournalApp.swift
```

---

## Usage

1. Open the project in **Xcode 15+**.
2. Run on a **Simulator** or **physical iPhone**.
3. On **HomeView**, choose:

   * `Add New Trip` – Fill in the form and save.
   * `View Trip` – See the saved trip details.
4. Optional: Edit the trip from **TripDetailView**.

---

## Asset Images

* Default images included in `Assets.xcassets`:

  * `rome`
  * `banff`
  * `tokyo`
* Add more images by dragging them into `Assets` and updating the `Picker` in `AddTripView`.

---

## Next Steps / Enhancements

* Multiple trips with persistent storage (Core Data / SQLite)
* Map integration for location visualization
* Full-screen image gallery for trips
* Custom animations and transitions for smoother UX

---

## Author

**Dhruv Rasikbhai Jivani** – INFO1730 Assignment 2
🗓 Date: 18 September 2025

---

## GitHub Repository

[View Project on GitHub](https://github.com/dhruvjivani/ToDoList)

</body>
</html>

