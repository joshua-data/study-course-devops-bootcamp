# Networks & IP Basics — Lecture Notes

## 1. Network Classification (By Distance)

Networks are classified based on the **distance (geographical scope)** between communicating network interfaces.

> 📌 Key Criterion
> **“Physical / geographical distance between network interfaces”**

---

## 1️⃣ LAN (Local Area Network)

### Definition

* **Very short-range network**
* Typically **a room, a floor, or an office**

### Examples

* Multiple PCs in the same room
* Printer + server + PCs
* Home network

### Characteristics

* Connected using switches
* High speed
* Internal communication

---

## 2️⃣ WAN (Wide Area Network)

### Definition

* **Very long-distance network**
* Spans cities, countries, or continents

### 대표 Example

* **The Internet (largest WAN)**

### Example Scenario

* Smartphone accessing a Google server in a European data center

---

## 3️⃣ MAN (Metropolitan Area Network)

### Definition

* **City-scale network**

### Examples

* Municipal / city government networks
* Metro (subway) control systems

---

## 4️⃣ CAN (Campus Area Network)

### Definition

* **Campus-scale network**
* Covers multiple buildings across several acres

### Examples

* Corporate office campuses
* University campuses

> 💡 Often referred to as an **Intranet**

---

## 5️⃣ PAN (Personal Area Network)

### Definition

* **Personal-scale network**

### Examples

* Bluetooth
* Mobile hotspot
* Device-to-device connections

---

## 🧠 Network Scope Overview

```
PAN < LAN < CAN < MAN < WAN
```

---

## 2. Network Devices

## 1️⃣ Switch

### Role

* Connects multiple devices **within the same network (LAN)**

### How It Works

* Uses MAC addresses
* Knows which device is connected to which port

### Examples

* PC A → Switch → PC B
* Wi-Fi routers contain an internal switch

---

## 2️⃣ Router

### Role

* Connects **different networks**
* LAN ↔ LAN
* LAN ↔ Internet

### Examples

* Home network ↔ Internet
* Building A network ↔ Building B network

---

## 3. Understanding the Home Network (Very Important)

> 💡 **If you understand your home network, you can understand any network**

### What Actually Happens at Home

```
Laptop / Phone
   ↓
Switch (Wi-Fi AP)
   ↓
Router (NAT)
   ↓
Modem
   ↓
ISP
   ↓
Internet
```

### Key Points

* Wi-Fi router = **Router + Switch**
* Devices can communicate internally (LAN)
* Router performs **NAT**, enabling Internet access

---

## 4. Actual Data Flow Path

> 💻 When accessing the Internet from a laptop

1. Laptop → Switch
2. Switch → Router
3. Router → Modem
4. Modem → ISP
5. Internet
6. Response returns in reverse order

---

## 5. Every Network Device Has an IP Address

* Laptop
* Smartphone
* Switch
* Router
* ISP devices
* Servers

👉 **Anything connected to a network has an IP address**

---

## 6. Corporate / Data Center Network Structure

### Characteristics

* Multiple switches (high availability)
* Multiple routers
* Multiple ISPs (redundancy)
* Firewalls for security

### Reasons

* Service continuity during failures
* Large-scale traffic handling
* Enhanced security

> Same principles as a home network
> → just **much larger in scale**

---

## 7. Subnet Concept (Light Introduction)

* Smaller networks inside a larger network
* Separated by purpose

### Examples

* DB Subnet
* Web Subnet
* Project-based Subnets

> ⚠️ Concept only for now
> → **Hands-on in AWS VPC later**

---

# 🌍 IP Address Fundamentals

## 1. What Is IPv4?

### Definition

* **32-bit binary address**
* Commonly displayed in **decimal format**

### Example

```
192.168.100.1
```

### Structure

* **4 octets**
* Each octet = 8 bits

```
192 . 168 . 100 . 1
 ↑     ↑     ↑     ↑
1st   2nd   3rd   4th
```

---

## 2. IPv4 Address Range

```
0.0.0.0  ~  255.255.255.255
```

### Why Does It End at 255?

* Maximum 8-bit value = `11111111` (binary)
* Decimal equivalent = **255**

---

## 3. Public IP vs Private IP

## 🌍 Public IP

* Used on the Internet
* Assigned by ISPs / cloud providers
* Acts as an Internet identity
* Usually **dynamic**
* Can be **static** upon request

---

## 🏠 Private IP

* Used for internal networks
* Assigned manually or automatically
* Not directly exposed to the Internet ❌

---

## 4. Private IP Address Ranges (Important ⭐)

### Class C

```
192.168.0.0  ~  192.168.255.255
```

Examples:

* `192.168.10.12`
* `192.168.0.174` (common home PC)

---

### Class B

```
172.16.0.0  ~  172.31.255.255
```

Examples:

* `172.16.12.30`
* `172.20.19.68`

❌ `172.32.x.x` → Public IP

---

### Class A

```
10.0.0.0  ~  10.255.255.255
```

---

## 🧠 Private IP Summary

| Class | Starting Range          |
| ----- | ----------------------- |
| A     | 10.x.x.x                |
| B     | 172.16.x.x ~ 172.31.x.x |
| C     | 192.168.x.x             |

---

## 5. IP Usage by Network Size

* LAN → Mostly Class C
* Large networks → Class B
* Very large networks / Cloud → Class A

---

## 🎯 Key Takeaways From This Section

* Networks are classified by **distance**
* Switch = connects devices in the same network
* Router = connects different networks
* Understanding home networks unlocks all networking concepts
* IPv4 = 32-bit addressing
* Public vs Private IP distinction is essential
* Only **Class A / B / C** are used for private IPs