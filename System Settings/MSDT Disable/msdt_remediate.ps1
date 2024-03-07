# This script puts in place a mitigation for CVE-2022-30190
# This CVE relates to using MSDT to launch RCEs and gain full system access
# This is a zero-day exploit
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
reg export HKEY_CLASSES_ROOT\ms-msdt 05312022cve2022-30190
reg delete HKEY_CLASSES_ROOT\ms-msdt /f
