# 🔁 Azure VNet Peering Architecture

This project sets up **two Azure Virtual Networks (VNets)** with individual subnets and Linux VMs, and connects them using **VNet Peering** via Terraform.

---

## 🖼️ Architecture Diagram

![vnet peering drawio](https://github.com/user-attachments/assets/6e67364d-bc14-4ae0-a836-5c827d01cc49)

> 🔄 **peer1to2** and **peer2to1** are the VNet peering connections between `vnet-1` and `vnet-2`.

---

## 📦 Components

- **vnet-1** with `subnet-1` and `vm-1`
- **vnet-2** with `subnet-2` and `vm-2`
- **VNet Peering** in both directions:
  - `peer1to2`: vnet-1 → vnet-2
  - `peer2to1`: vnet-2 → vnet-1

This allows internal communication between the two VMs across VNets.

## 🔐 Azure Bastion – Secure VM Access and Connectivity Testing
In this architecture, we use Azure Bastion to securely connect to virtual machines (VMs) in different VNets without exposing public IP addresses.
---
