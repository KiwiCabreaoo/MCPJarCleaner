# 🛠️ JAR Signature Cleaner

![Version](https://img.shields.io/badge/version-1.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey.svg)

A lightweight and automated tool to remove the `META-INF` folder from Java Archive (.jar) files. Essential for Minecraft modding (MCP) to prevent JNI errors and signature verification failures.

---

## ✨ Features

* **Drag & Drop Support:** Simply drop your `.jar` file onto the script icon.
* **Automatic Backup:** Creates a `_unmodified.jar` safety copy before processing.
* **Smart Detection:** Supports both **7-Zip** and **WinRAR** (automatically detects installation paths).
* **Integrity Check:** Skips the process if the JAR is already clean to save time.
* **Safety Lock Check:** Detects if the file is currently being used by another program.

---

## 🚀 Requirements

To run this script, you must have one of these tools installed in their default directory:
* [7-Zip](https://www.7-zip.org/) (Recommended)
* [WinRAR](https://www.rarlab.com/)

---

## 📖 How to Use

1.  Download the `CleanJar.bat` file.
2.  **Option A (Recommended):** Drag your `.jar` file and drop it directly onto `CleanJar.bat`.
3.  **Option B:** Run the script manually and type the filename when prompted.
4.  Wait for the `PROCESS COMPLETED SUCCESSFULLY` message.

---

## 🛠️ Troubleshooting

| Error | Cause | Solution |
| :--- | :--- | :--- |
| **File not found** | Incorrect path or filename. | Ensure the file exists and has a `.jar` extension. |
| **File is locked** | The JAR is open in another app. | Close Minecraft, Eclipse, or IntelliJ before running. |
| **Tool not found** | No 7-Zip or WinRAR detected. | Install either one in the standard `Program Files` folder. |

---

## 📝 Technical Notes

The script uses **Delayed Expansion** to safely handle paths with spaces and special characters, ensuring compatibility across all modern Windows versions.

---

> **Note:** This is a generic development tool. Feel free to include it in your modding projects or distributions.
