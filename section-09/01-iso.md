# Computer Networking Fundamentals — Lecture Notes Summary

## 1. Why This Lecture Matters

This lecture covers **networking fundamentals** that are absolutely required **before moving on to Cloud, Docker, Kubernetes, and DevOps**.

### Why Networking Is Important for DevOps

* You must **connect multiple systems**
* You need to **directly troubleshoot communication issues** between cloud resources
* To **automate**, you must first **understand how things work manually**
  → *“Manual first, then automate”*

> 👉 If you don’t understand networking:
>
> * Pod ↔ Pod communication
> * VM ↔ DB connections
> * DNS / IP / firewall issues
>   will all be solved **by guesswork**

---

## 2. What Is a Computer Network?

### 📌 Definition

> **A computer network = communication between two or more network interfaces (NICs)**

### Key Points

* Every network-enabled device has a **network interface**

  * Laptop: Ethernet / Wi-Fi
  * Smartphone: Wi-Fi / Cellular
  * IoT devices: Network Interface
* Each interface is assigned an **IP address**
* A network is the **structure that allows data to be exchanged** between these interfaces

---

## 3. Basic Components of a Network

### Essential Components

* **Two or more devices**

  * Computers, smartphones, servers, IoT, etc.
* **Connection medium**

  * Wired cables / Wireless (Wi-Fi)
* **NIC (Network Interface Card)**
* **Network devices**

  * Switch: connects multiple devices
  * Router: connects multiple networks
* **Operating System (OS)**

  * Interprets received data and presents it to the user

---

## 4. Why Can All Devices Communicate Worldwide?

### The Problem

* Countless operating systems, devices, apps, and vendors
* Yet somehow, **everything communicates the same way**

### The Answer: **Standards**

> Just as humans need a common spoken language,
> computers need a **common communication language**

---

## 5. What Is the OSI Model?

### 📌 Definition

* **OSI (Open Systems Interconnection)**
* A **network communication standard model** created by **ISO (International Organization for Standardization)**
* Established in 1984
* **7-layer architecture**

👉 A global reference so all network devices and operating systems communicate using the **same rules**

---

## 6. OSI 7 Layers at a Glance

```
7. Application
6. Presentation
5. Session
4. Transport
3. Network
2. Data Link
1. Physical
```

> 💡 Top → Bottom: **Sending**
> 💡 Bottom → Top: **Receiving**

---

## 7. Three Core Concepts of the Layered Model

### 1️⃣ Service

* Functionality a layer provides to the **layer above it**

### 2️⃣ Protocol

* **Rules** used for communication between layers
* Examples: TCP, IP, HTTP

### 3️⃣ Interface

* **Boundary between layers**
* “Where my responsibility ends and yours begins”

---

## 8. Understanding the OSI Model Using a Mail Example

| Real World       | Network                |
| ---------------- | ---------------------- |
| Writing a letter | Application            |
| Packing envelope | Presentation / Session |
| Postal handling  | Transport / Network    |
| Delivery         | Data Link / Physical   |

👉 **Senders and receivers** do not need to know
the intermediate processes (routing, delivery, transport)
→ **The core purpose of layering**

---

## 9. OSI 7 Layers — Practical Summary

## 1️⃣ Physical Layer

* Transmits **bits (0s and 1s)**
* Cables, electrical signals, radio waves
* Examples: Ethernet cables, Wi-Fi signals

---

## 2️⃣ Data Link Layer

* **Frame**-level data
* Uses **MAC addresses**
* Communication within the same network
* Primary device: **Switch**

---

## 3️⃣ Network Layer

* **Packet**-level data
* Uses **IP addresses**
* Communication across different networks
* Primary device: **Router**

---

## 4️⃣ Transport Layer

* Guarantees **end-to-end communication**
* Retransmission on data loss
* Order and reliability
* Primary protocols: **TCP / UDP**

---

## 5️⃣ Session Layer

* Session creation, maintenance, termination
* Connection state management

---

## 6️⃣ Presentation Layer

* **Encryption / Decryption**
* Compression and format translation
* Example: HTTPS encryption

---

## 7️⃣ Application Layer

* Layer directly used by users
* Browsers, email clients, mobile apps
* Examples: HTTP, SMTP, FTP

---

## 10. Data Units by OSI Layer

| Layer       | Data Unit |
| ----------- | --------- |
| Physical    | Bits      |
| Data Link   | Frame     |
| Network     | Packet    |
| Transport   | Segment   |
| Application | Data      |

---

## 11. Representative Devices by Layer

| Layer | Devices / Examples  |
| ----- | ------------------- |
| L1    | Hub, Cable          |
| L2    | Switch              |
| L3    | Router, Firewall    |
| L4    | Gateway             |
| L7    | Web Server, Browser |

---

## 12. What You Must Remember From This Lecture

### ✅ Key Checklist

* Names and roles of the **7 OSI layers**
* **Data units** handled at each layer
* Difference between **MAC vs IP**
* Difference between **Switch vs Router**
* Knowing **which layer to suspect when problems occur**

---

## 🎯 One-Line Summary for DevOps / Data Engineers

> **Networking should be understood as a “layered structure,” not by intuition —
> only then do cloud, Kubernetes, and data pipelines make sense.**