# Proactive-Remediation-Scripts

This repository contains a collection of PowerShell scripts designed for proactive remediation in Microsoft Intune. These scripts are used to identify and fix configuration errors in Intune-managed devices.

## What are Proactive Remediation Scripts?

Proactive remediation scripts are automation scripts that help maintain the desired state of devices managed by Intune. They are used to detect and resolve configuration issues before they cause any significant problems. These scripts can be scheduled to run periodically or triggered based on specific events or conditions.

## Purpose of this Repository

The purpose of this repository is to provide a centralized location for sharing pre-built proactive remediation scripts for Microsoft Intune. By sharing these scripts, we aim to help IT administrators and Intune users save time and effort in creating their own scripts from scratch. You can find a variety of scripts in this repository that address common configuration errors and provide solutions for them.

## How to Use the Scripts

To use the scripts in this repository, follow these steps:

1. Clone or download the repository to your local machine.
2. Open the Intune management portal.
3. Navigate to the "Scripts" section.
4. Create a new script and copy the content of the desired script from this repository.
5. Customize the script if necessary, based on your specific requirements.
6. Save the script and assign it to the appropriate devices or groups in Intune.

Please note that for each remediation script, a corresponding detection script is necessary in Intune. The detection script is used to identify whether the configuration issue exists on the device before applying the remediation script. Make sure to create and assign both the detection and remediation scripts to the appropriate devices or groups in Intune.

These scripts are provided as-is and may require modification to fit your specific environment or requirements. Make sure to test the scripts in a non-production environment before deploying them to your production devices.

## Contributing

We welcome contributions to this repository! If you have created a proactive remediation script for Intune that you would like to share, please feel free to submit a pull request. Make sure to follow the contribution guidelines outlined in the repository.

## License

This repository is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the scripts in this repository as per the terms of the license.

## Disclaimer

The scripts in this repository are provided as-is, without any warranty or support. We are not responsible for any damages or issues caused by the use of these scripts. Use them at your own risk.
