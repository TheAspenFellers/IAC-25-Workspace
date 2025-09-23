# Struktur og Sammenheng

Prosjektet består av forskjellige moduler en stack og tre enviroments. Strukturen består av følgende hovedkomponenter:

- **Moduler (`modules/`)**: Gjenbrukbare Terraform-moduler som definerer ressurser (f.eks. nettverk, VM, lagring).
- **Stack-mappen (`stacks/`)**: En stack representerer et komplett miljø (f.eks. dev, prod) og refererer til relevante moduler.
- **Miljømapper (`environments/`)**: Inneholder miljøspesifikke variabler og konfigurasjoner.

Mappestruktur:
```
.
├── modules/
│   ├── compute-vm/
│   ├── network/
│   └── resource-group/
├── stacks/
├── environments/
│   ├── dev/
│   ├── prod/
│   └── test/
└── README.md
```

## Tilgjengelige variabler og hensikt

Variabler defineres i `variables.tf` i hver modul og kan overstyres i miljømapper via `<miljønavn>.tfvars`. Eksempler:

| Variabelnavn          | Beskrivelse                               | Eksempelverdi                          |
| --------------------- | ----------------------------------------- | -------------------------------------- |
| `name`                | Basenavn for ressurser                    | `agoodname`                            |
| `location`            | Azure-region der ressurser opprettes      | `westeurope`                           |
| `subscription_id`     | Azure Subscription ID                     | `aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee` |
| `tags`                | Nøkkel/verdi-par for merking av ressurser | `{ environment = "test" }`             |
| `env`                 | Miljø-suffiks brukt i ressursnavn         | `test`                                 |
| `vm_size`             | Maskinstørrelse (SKU) for VM              | `Standard_B1s`                         |
| `ssh_public_key_path` | Filsti til SSH-public key                 | `~/path/`                              |
| `enable_public_ip`    | Angir om VM får en offentlig IP           | `true / false`                         |
| `vnet_cidr`           | CIDR-blokk for Virtual Network            | `10.0.0.0/16`                          |
| `snet_cidr`           | CIDR-blokk for Subnet i vnet              | `10.0.1.0/24`                          |
| `admin_username`      | Brukernavn for VM-administrator           | `dev-admin`                            |



## Outputs og verifikasjon

Outputs defineres i `outputs.tf` i noen av modulene. Disse gir informasjon om opprettede ressurser, f.eks. ressurs-IDer. Outputs brukes til videre bruk i andre moduler, men kan også benyttes til å verifisere at ressurser er korrekt opprettet.

Output brukt i oppgaven:
```hcl
output "subnet_id_output" {
  value = azurerm_subnet.sn_default.id
  description = "the ID of the created subnet"
}

output "rg_default_output" {
  value = azurerm_resource_group.rg-default.name
}
```

## Kommandoer for utrulling og destruksjon

**Forutsetninger:**  
- [Terraform](https://www.terraform.io/downloads.html) installert  
- Azure-konto og innlogget med `az login`

**0. Naviger til riktig mappe:**
```sh
cd enviroments/<miljønavn>
```

**1. Initialiser Terraform:**
```sh
terraform init
```

**2. Utrull (apply):**
```sh
terraform apply -var-file="<miljønavn>.tfvars" -auto-approve
```

**3. Destruer ressursene:**
```sh
terraform destroy -var-file=-var-file="<miljønavn>.tfvars" -auto-approve
```

Gyldige miljønavn: dev, prod, test

**Merk:**  
Kjør kommandoene fra aktuell miljø-mappe (Se steg 0).
