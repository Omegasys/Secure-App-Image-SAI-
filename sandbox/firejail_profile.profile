# SAI Firejail Profile (alternative backend)

# Disable all system access by default
private
private-dev

# Network disabled unless explicitly overridden
net none

# No user system integration
noroot

# Restrict filesystem visibility
blacklist /etc
blacklist /var
blacklist /boot
blacklist /sys
blacklist /proc

# Allow only application directory
whitelist /app

# Temporary runtime space
tmpfs /tmp
tmpfs /run

# No DBus by default
nodbus

# Disable GPU unless explicitly allowed
nogroups
