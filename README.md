# 📌 Email-Based Keylogger (Educational Project)

> ⚠️ This project is intended for **educational purposes only**. It must not be used to monitor or collect data without informed consent from the user. Unauthorized surveillance is illegal and unethical.

This is a simple Python-based keylogger that captures keyboard input and sends the logs to your email address. The keylogger runs in the foreground and is designed for learning how keystroke logging works in controlled environments.

---

## 🔧 Features

- Logs every keystroke from the keyboard
- Stores logs in a local file (`keylogs.txt`)
- Sends the log via email using SMTP
- Timer-based log sending (every X minutes)
- Runs on Windows (foreground mode)

---

## 🧰 Requirements

- Python 3.x installed  
- Internet connection (for sending emails)
- Email account with SMTP access (Gmail recommended)

---

## 🛠 Installation

### 1. 🔽 Clone the Repository

```bash
git clone https://github.com/shohanur-soikat/keylogger.git
cd keylogger
