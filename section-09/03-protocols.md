# Protocol Fundamentals — Lecture Notes

## 1. What Is a Protocol?

### 📌 One-line Definition

> **A protocol is a set of rules for exchanging data over a network.**

More precisely, a protocol is a **formal specification** that defines:

* How a sender and receiver communicate
* **Data format**
* **Timing**
* **Sequence**
* **Error handling**
* And other communication behaviors

### Examples of Protocols

* HTTP / HTTPS
* FTP
* SSH
* DNS

👉 A client and a server can communicate **only if they both understand the same protocol**.

---

## 2. Protocols and the OSI / TCP-IP Models

* At **Layer 4 (Transport Layer)**, there are only **two core protocols**:

  * **TCP**
  * **UDP**
* All protocols used at **Layers 5, 6, and 7 (Application layer)**
  👉 ultimately run **on top of either TCP or UDP**

---

## 3. What Are TCP and UDP?

### The Key Question

> What is TCP, what is UDP, and why do we need both?

---

## 4. TCP (Transmission Control Protocol)

### 📌 One-line Definition

> **TCP is a reliable protocol.**

### Key Characteristics

* **Connection-oriented**
* Performs a **three-way handshake** before data transfer
* **Guaranteed ordering**
* **Retransmission on failure**
* **Error detection and recovery**
* Slower, but **highly reliable**

### How TCP Works

* “Sent” → “Received” → “Acknowledged”
* If a packet is lost or corrupted, it is **detected and retransmitted**

### Typical Use Cases for TCP

* Web communication (HTTP / HTTPS)
* Email transmission
* File uploads and downloads
* Login, payment, and ordering systems

👉 Used whenever **data accuracy is critical**.

---

## 5. UDP (User Datagram Protocol)

### 📌 One-line Definition

> **UDP is fast but does not guarantee reliability.**

### Key Characteristics

* **Connectionless**
* No three-way handshake
* No ordering guarantee
* No retransmission
* No acknowledgements (ACK)
* Very fast

### How UDP Works

* “Send and forget”
* No confirmation of delivery

### Typical Use Cases for UDP

* DNS
* DHCP
* TFTP
* Streaming and real-time services

👉 Used when **speed matters more than reliability**.

---

## 6. TCP vs UDP Comparison

| Category       | TCP                 | UDP                  |
| -------------- | ------------------- | -------------------- |
| Connection     | Connection-oriented | Connectionless       |
| Reliability    | High                | Low                  |
| Speed          | Slower              | Faster               |
| Retransmission | Yes                 | No                   |
| Typical Usage  | Web, DB, Email      | DNS, DHCP, Streaming |

---

## 7. What Is a Port Number?

### 📌 Core Concept

> **IP address = the computer (host)**
> **Port number = the service running on that computer**

### Why Are Port Numbers Needed?

* A single computer (IP address) can run **multiple services**
* Port numbers identify **which service** should receive the request

---

## 8. Port Number Analogy (Food Court 🍽️)

* **IP address** = food court address
* **Port numbers** = individual food stalls

| Stall        | Port |
| ------------ | ---- |
| Indian food  | 1    |
| Chinese food | 2    |
| Italian food | 3    |
| Thai food    | 4    |

👉 Multiple services (stalls) can coexist on the same IP (food court).

---

## 9. Common Default Port Numbers (Important ⭐)

| Service | Protocol  | Port |
| ------- | --------- | ---- |
| SSH     | TCP       | 22   |
| HTTP    | TCP       | 80   |
| HTTPS   | TCP       | 443  |
| SMTP    | TCP       | 25   |
| DNS     | UDP / TCP | 53   |
| MySQL   | TCP       | 3306 |

👉 Essential knowledge for configuring **firewalls, Security Groups, NACLs, and OS-level firewalls**.

---

## 10. IP Address + Port Number = Exact Destination

### Example

> Tomcat server connecting to a MySQL server

* Destination IP: `10.0.1.25`
* Destination Port: `3306`
* Protocol: `TCP`

👉 **IP + Port + Protocol** must all be correct for communication to work.

---

## 11. OSI Model vs TCP/IP Model

### Layer Mapping

| OSI Model       | TCP/IP Model      |
| --------------- | ----------------- |
| L7 Application  | Application       |
| L6 Presentation | Application       |
| L5 Session      | Application       |
| L4 Transport    | Transport         |
| L3 Network      | Internet          |
| L2 Data Link    | Network Interface |
| L1 Physical     | Network Interface |

### Major TCP/IP Protocols

* Application: HTTP, FTP, SMTP, DNS, DHCP, SSH
* Transport: TCP, UDP
* Internet: IP, ICMP, ARP, RARP

---

## 12. Why This Matters in Real Projects

### Project Example (vprofile)

Multiple services run on **different servers (VMs)**:

| Service   | Port  |
| --------- | ----- |
| Nginx     | 80    |
| Tomcat    | 8080  |
| RabbitMQ  | 5672  |
| Memcached | 11211 |
| MySQL     | 3306  |

👉 Every service has:

* A specific **IP address**
* A specific **port**
* A specific **protocol**

---

## 13. Practical Checklist ✅

Always verify the following in real projects:

1. Which **server (IP)**?
2. Which **service**?
3. Which **port number**?
4. Which **protocol (TCP/UDP)**?
5. Is the **firewall open**?

---

## 🎯 One-Line Summary

> **Protocols define *how* data is sent,
> IP addresses define *where* it goes,
> and ports define *which service* receives it.**