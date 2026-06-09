# Shiny Demo Deployment Example

**QUICKSTART:**

Create a inventory.ini in which you specify the VMs on which you want to deploy this to and run this command:
```
ansible-playbook playbook.yaml -i inventory.ini
```

---
---

This repository contains two main parts:

- an **R Shiny application** located in the `app/` directory
- an **Ansible playbook** used to deploy that application to a virtual machine

The purpose of this repository is to provide a simple example of how an **R Shiny app** can be deployed automatically to a newly created instance.

After a new VM has been created, the included Ansible playbook can be used to:

- install the required software
- clone this repository onto the target machine
- install the `shiny` package in R
- start the Shiny application on port `3838`

This makes it possible to quickly provision a fresh machine and make the example application available with minimal manual setup.

## How it Works

The deployment process is straightforward:
1. Create a new instance in SimpleVM.
2. Connect to your VM with the given ssh command.
3. Run the ansible playbook.
4. Access the Shiny app!

Once deployed, the application can be accessed through the corresponding link provided in **SimpleVM**, for example through the **Research Environment** section.

## Notes

This repository is intended as a minimal demonstration example for automated deployment of a Shiny application in a VM-based environment.

It can be used as a starting point for testing, teaching, or extending similar deployment workflows in SimpleVM.