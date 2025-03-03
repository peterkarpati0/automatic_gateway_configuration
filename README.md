# Automatic Gateway Configuration

This repository provides scripts and configurations to automate the setup of network gateways, particularly focusing on MikroTik devices.

Support for FortiGate will be added soon.

## Contents

- **01_mikrotik_modular_configuration_scripts.drawio**: Diagram outlining the modular configuration scripts for MikroTik devices.
- **01_mikrotik_modular_configuration_scripts.drawio.pdf**: PDF version of the above diagram.
- **02_cloudmigrationhu_networking_physical.drawio**: Diagram detailing the physical networking setup for the CloudMigrationHU project.
- **02_cloudmigrationhu_networking_physical.drawio.pdf**: PDF version of the above diagram.
- **routeros-7.18-smips-01_nemver.rsc**: RouterOS script compatible with version 7.18 for SMIPS architecture, tailored for specific configuration needs.
- **routeros-7.18-smips-01_nemver_before.jpg**: Image depicting the router's status before applying the configuration script.
- **routeros-7.18-smips-01_nemver_after.jpg**: Image showing the router's status after applying the configuration script.

## Usage

1. **Review Diagrams**: Familiarize yourself with the network setup and configuration flow by examining the provided diagrams.
2. **Apply Configuration Script**:
   - Access your MikroTik device using WinBox or another preferred method.
   - Open the terminal and import the `routeros-7.18-smips-01_nemver.rsc` script.
   - Reboot the router to ensure all changes take effect.
3. **Verify Configuration**: Compare the router's status before and after applying the script using the provided images to ensure the configuration was successful.

## Testing 

Please ignore cert_export_ files, this is only for testing HTTPS API based Terraform provider.

https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs

https://help.mikrotik.com/docs/spaces/ROS/pages/47579162/REST+API




## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.
