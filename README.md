# dayz-windows-auto-restart-service
Windows-based DayZ server automation using Task Scheduler and a crash-restart batch loop. Runs the server in a service-like background mode, allowing it to continue operating after user logout. Supports automatic recovery on crash and graceful shutdowns via messages.xml for planned restarts and maintenance cycles.
# DayZ Auto Restart Service

Automatically restarts a DayZ server using a batch loop and Windows Task Scheduler. Supports graceful shutdown via `messages.xml` and ensures continuous server uptime.

This setup runs the server like a **service**, meaning it continues running in the background even if you log out of Windows. This helps save system resources and is ideal for dedicated server machines.

---

## 📁 Files

- **start.bat** → Crash/restart loop that keeps the server running  
- **dayz.xml** → Windows Task Scheduler task configuration  
- **messages.xml** → Handles scheduled restart warnings and clean shutdowns  

---

## ⚙️ How It Works

- Task Scheduler starts `start.bat`
- `start.bat` launches the DayZ server
- If the server stops or crashes → it automatically restarts
- If `messages.xml` triggers a shutdown → server shuts down cleanly → then restarts

Because it runs through Task Scheduler + background batch execution, the server behaves like a **Windows service-style process**.

---

## 🧠 Service-Style Behavior (Important)

- Server runs in the background after startup  
- You can **log out of Windows user session**  
- Server keeps running without interruption  
- Saves system resources compared to keeping a full desktop session active  
- Ideal for dedicated hosting machines or VPS setups  

---

## 📘 Setup Tutorial

### 1️⃣ Download / Clone the Repository  
Place the files on your Windows server.

Example:
C:\DayZ-Auto-Restart\

---

### 2️⃣ Configure `start.bat`  
Edit the server path inside `start.bat`:

cd "C:\1SteamCMD\steamapps\common\DayZ Server Exp"

Make sure this matches your actual DayZ server folder.

---

### 3️⃣ Import Task Scheduler File  

1. Open **Task Scheduler**
2. Click **Import Task**
3. Select `dayz.xml`
4. Confirm and save
5. Enter admin password if required

---

### 4️⃣ Verify Task Settings  

Make sure:

- Runs with highest privileges  
- Task is enabled  
- Path points to `start.bat` correctly  

---

### 5️⃣ Configure Restart Messages

Open `messages.xml`:

⚠️ IMPORTANT: All time values are in **MINUTES**

- `<deadline>` = total time in minutes until the server shuts down  
- `#tmin` = remaining minutes shown in messages  
- `<shutdown>1</shutdown>` = enables the server shutdown when countdown reaches zero  

### Example behavior:
- If `<deadline>360</deadline>` → the server will shut down in **360 minutes (6 hours)**
- The server will automatically send countdown warnings as it gets closer to zero (90, 60, 45, 30, 20, 15, 10, 5, 2, 1 minute remaining depending on configuration)

---

## 🔄 Behavior Overview

- Server runs continuously via loop  
- Crashes trigger automatic restart  
- Planned restarts are handled safely via `messages.xml`  
- Task Scheduler ensures startup on boot  
- Runs independently of active Windows user sessions  

---

## ⚠️ Important Notes

- Do NOT run multiple Task Scheduler instances  
- Always use `messages.xml` for planned restarts  
- Ensure all file paths are correct  
- Avoid manually killing the server unless necessary  
- `<deadline>` is measured in **minutes (not seconds)**  

---

## 🧠 Result

Once installed:

- Server stays online automatically  
- Crashes are recovered instantly  
- Restarts are clean and controlled  
- Runs like a service in the background  
- You can log out of Windows while server continues running  
- Minimal maintenance required

Visit our [website](https://www.dayzvanillaplus.com) if you have any questions.
