# Automatic Gateway Configuration

This repository provides modular scripts and configurations to automate the setup of MikroTik RouterOS devices. It includes a comprehensive collection of configuration scripts for base network setup, WAN connectivity options, wireless configuration, and site-to-site VPN connections using WireGuard.

The project also includes Terraform configurations for infrastructure-as-code management of MikroTik devices using the official RouterOS Terraform provider.

## Features

- **Modular Configuration System**: Parameterized scripts that can be customized for different network environments
- **Multiple WAN Options**: Support for PPPoE, DHCP, and static WAN configurations
- **Wireless Networking**: Both legacy wireless and modern WiFi 6 configurations
- **Site-to-Site VPN**: WireGuard VPN configurations for secure inter-site connectivity
- **Terraform Integration**: Infrastructure-as-code approach using the RouterOS Terraform provider
- **Certificate Management**: SSL/TLS certificate generation for secure API access

## Repository Structure

### Base Configuration
- **`01-routeros-7.18-base.rsc`**: Core base configuration script with parameterized settings for router identity, bridge setup, DHCP, firewall, and NAT
- **`01-routeros-7.18-base.tf`**: Terraform version of the base configuration (commented template)
- **`01-routeros-7.18-base-before.jpg`** & **`01-routeros-7.18-base-after.jpg`**: Before/after configuration screenshots

### WAN Connectivity Options
- **`02A-routeros-7.18-pppoe-client.rsc/.tf`**: PPPoE client configuration for ADSL/fiber connections
- **`02B-routeros-7.18-wan-dhcp.rsc`**: DHCP client configuration for cable/4G/5G modems
- **`02B-routeros-7.18-wan-dhcp.jpg`**: DHCP WAN configuration screenshot

### Wireless Configuration
- **`03-routeros-7.18-wifi.rsc`**: Modern WiFi configuration (RouterOS v7+) with dual-band support
- **`03-routeros-7.18-wireless.rsc`**: Legacy wireless configuration for older devices

### Site-to-Site VPN (WireGuard)
- **`04-routeros-7.18-wireguard-*-*.rsc`**: Complete WireGuard site-to-site configurations for multiple locations:
  - `attilahome-peterhome`: Connection between Attila's and Peter's locations
  - `gptoffice-nemverhome`: Connection between GPT Office and Nemver home
  - `nemverhome-gptoffice`: Reverse configuration for the above
  - `peterhome-attilahome`: Reverse configuration for the first pair

### Terraform & API Configuration
- **`00-test-tf-routeros-routeros_system_identity.tf`**: Terraform test configuration for RouterOS provider
- **`00-test-tf-routeros-routeros_system_identity.jpg`**: Terraform test screenshot
- **`00-routeros-api-create-certificates-for-terraform.rsc/.jpg`**: Certificate generation for secure API access

### Documentation & Diagrams
- **`mikrotik_modular_configuration_scripts.drawio/.pdf`**: Flowchart of the modular configuration approach
- **`mikrotik_site2site_wireguard_configuration_steps.drawio/.pdf`**: WireGuard site-to-site setup workflow
- **`cloudmigrationhu_networking_physical.drawio/.pdf`**: Physical network topology diagram

### Certificate Files (Testing)
- **`cert_export_*.crt/.key`**: SSL certificates for secure API testing (development use only)

## Usage

### Quick Start with Base Configuration

1. **Customize Parameters**: Edit the global variables in `01-routeros-7.18-base.rsc`:
   ```routeros
   :global routerName "your-router-name"
   :global bridgeIP "192.168.1.1"
   :global subnet 24
   :global dhcpStart "192.168.1.100"
   :global dhcpEnd "192.168.1.200"
   ```

2. **Apply Base Configuration**:
   - Access your MikroTik device via WinBox, SSH, or web interface
   - Copy and paste the script content or import the `.rsc` file
   - The script will automatically configure interfaces, bridge, DHCP, firewall, and NAT

3. **Add WAN Connectivity**:
   - For PPPoE: Apply `02A-routeros-7.18-pppoe-client.rsc`
   - For DHCP: Apply `02B-routeros-7.18-wan-dhcp.rsc`

4. **Configure Wireless** (optional):
   - For RouterOS v7+: Use `03-routeros-7.18-wifi.rsc`
   - For older versions: Use `03-routeros-7.18-wireless.rsc`

### Site-to-Site VPN Setup

1. **Choose Configuration Pair**: Select the appropriate WireGuard configuration files for your sites
2. **Update Parameters**: Modify IP addresses, endpoints, and public keys in both configuration files
3. **Apply on Both Routers**: Import the respective configuration on each site's router
4. **Verify Connectivity**: Check WireGuard interface status and test inter-site communication

### Terraform Management

1. **Set Environment Variables**:
   ```powershell
   $env:ROS_HOSTURL="http://your-router-ip"
   $env:ROS_USERNAME="admin"
   $env:ROS_PASSWORD="your-password"
   ```

2. **Initialize and Apply**:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Configuration Details

### Base Configuration Features
- **Parameterized Setup**: Easily customizable IP ranges and router identity
- **Interface Management**: Automatic interface detection and naming (ether1-wan1, ether2-wan2, ether3-lan1)
- **Bridge Configuration**: Automatic bridge creation with RSTP protocol
- **DHCP Server**: Configurable IP pool and lease management
- **Firewall Rules**: Comprehensive security rules following MikroTik best practices
- **NAT Configuration**: Source NAT for internet connectivity

### WireGuard VPN Features
- **Multiple Site Support**: Pre-configured for 4 different sites
- **Secure Tunneling**: Point-to-point encrypted connections
- **Routing Integration**: Automatic route configuration for remote networks
- **Firewall Integration**: Proper firewall rules for VPN traffic

### Wireless Configuration
- **Dual-Band Support**: Both 2.4GHz and 5GHz configurations
- **Modern Security**: WPA2/WPA3-PSK authentication
- **Country-Specific**: Configured for Hungary regulatory domain
- **Optimized Settings**: Indoor installation with appropriate power settings

## Testing & Development

The repository includes test certificates and Terraform configurations for development purposes. These files (`cert_export_*`) should **not** be used in production environments.

**Important Security Notes**:
- Change default passwords in all configuration files
- Generate your own certificates for production API access
- Use secure credential storage (environment variables) for Terraform
- Review and customize firewall rules for your specific requirements

## References

- [RouterOS Terraform Provider Documentation](https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs)
- [MikroTik REST API Documentation](https://help.mikrotik.com/docs/spaces/ROS/pages/47579162/REST+API)
- [MikroTik WiFi Configuration Guide](https://help.mikrotik.com/docs/spaces/ROS/pages/224559120/WiFi)
- [MikroTik WireGuard Documentation](https://help.mikrotik.com/docs/display/ROS/WireGuard)
- [Certificate Management Guide](https://wiki.mikrotik.com/Manual:Create_Certificates)

## Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.
