[33mcommit 83a9d6bc72f454e6e514198a01abfeaf56edaa2c[m[33m ([m[1;36mHEAD -> [m[1;32mmain[m[33m, [m[1;31morigin/main[m[33m)[m
Author: Miracle <nnabukomiracle@gmail.com>
Date:   Fri Feb 23 16:20:52 2024 +0100

    Updated oracle_projects main.ts

[1mdiff --git a/Terraform/oracle_projects/main.tf b/Terraform/oracle_projects/main.tf[m
[1mindex b750a89..519b0ea 100644[m
[1m--- a/Terraform/oracle_projects/main.tf[m
[1m+++ b/Terraform/oracle_projects/main.tf[m
[36m@@ -1,3 +1,13 @@[m
[32m+[m[32mterraform {[m
[32m+[m[32m  required_providers {[m
[32m+[m[32m    opc = {[m
[32m+[m[32m      source = ""[m
[32m+[m[32m      version = ""[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[32m+[m
[32m+[m
 resource "opc_compute_ip_network" "test" {[m
   name                = "internal-network"[m
   description         = "Terraform Provisioned Internal Network"[m
