service salt-minion stop

if [ "$#" -gt 0 ]; then
    _SALT_ETC_DIR="$1"
else
    _SALT_ETC_DIR="/etc/salt"
fi

# Set master address
mkdir -p "$_SALT_ETC_DIR/minion.d"
cat <<_eof > $_SALT_ETC_DIR/minion.d/99-master-address.conf
master: $SALT_MASTER_ADDRESS
_eof

# Set minion id
echo "$SALT_MINION_ID" > "$_SALT_ETC_DIR/minion_id"

service salt-minion start
