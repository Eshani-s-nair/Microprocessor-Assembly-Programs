
# 🧠 Assembly Programming in MASM

This repository contains a collection of **MASM (Microsoft Macro Assembler)** programs organized by functionality.  
It is designed to help understand and practice **8086 Assembly Language Programming** through categorized examples and well-documented code.

---

## 📂 Folder Structure

| Folder | Description |
|:--------|:-------------|
| **1bop/** | Programs demonstrating **1-byte operations** such as arithmetic, logical, and data transfer instructions. |
| **2bop/** | Programs using **2-byte operations**, involving word-level data manipulation and arithmetic. |
| **int/** | **Interrupt-based programs**, including DOS interrupt routines for input/output and system-level operations. |
| **strop/** | **String operation programs**, demonstrating instructions like `MOVSB`, `CMPS`, `SCAS`, and other string handling mechanisms. |

---

## 📝 Code Documentation

Each program includes **the description of the question or problem statement as comments** at the beginning of the code file.  
This helps in understanding the **purpose, logic, and flow** of each program easily without needing external references.

---

## ⚙️ Tools & Setup

- **Assembler:** MASM (Microsoft Macro Assembler)  
- **Emulator:** DOSBox  
- **Processor Architecture:** 8086 Microprocessor  

---

## 🚀 How to Run (in DOSBox)

1. Open **DOSBox**.  
2. Mount the directory containing MASM and your programs:
   ```bash
   mount c path_to_your_folder
   c:

3. Assemble the program:

   ```bash
   masm filename.asm
   ```
4. Link the object file:

   ```bash
   link filename.obj
   ```
5. Run the executable:

   ```bash
   filename.exe
   ```

---

## 🧩 Topics Covered

* Data transfer and arithmetic operations
* Logical and comparison instructions
* Control flow using loops and jumps
* Interrupt-driven input/output operations
* String processing and manipulation

---

## 💡 Purpose

This repository serves as a **reference and learning resource** for students and enthusiasts exploring **8086 Assembly Language**.
Each folder focuses on a specific topic, with cleanly structured code and explanations provided as in-line comments.

---


> *"Understanding how machines think helps you code smarter."*
