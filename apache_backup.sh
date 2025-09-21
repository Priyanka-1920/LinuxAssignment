
#!/bin/bash

# --- Variables ---
DATE=$(date +%F)
BACKUP_DIR="/backups"
BACKUP_FILE="$BACKUP_DIR/apache_backup_$DATE.tar.gz"
LOG_FILE="$BACKUP_DIR/apache_backup_$DATE.log"

# --- Create Backup Directory if Needed ---
mkdir -p "$BACKUP_DIR"

# --- Create the Backup ---
tar -czf "$BACKUP_FILE" /etc/httpd/ /var/www/html/

# --- Verify the Backup ---
echo "Apache Backup Verification Log - $DATE" > "$LOG_FILE"
echo "Backup File: $BACKUP_FILE" >> "$LOG_FILE"
echo "Contents:" >> "$LOG_FILE"
tar -tzf "$BACKUP_FILE" >> "$LOG_FILE"

# --- Done ---
exit 0

