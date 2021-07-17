options="Logoff\nRestart\nShutdown"
sel=$(echo "$options" | rofi -dmenu -i)
case $sel in
    Logoff)
        herbstclient quit
        ;;
    Restart)
        shutdown -r now
        ;;
    Shutdown)
        shutdown now
        ;;
esac
