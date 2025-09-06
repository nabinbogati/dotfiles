# enable dark theme system wide
gsettings set org.gnome.desktop.interface color-scheme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# enable dark theme for qt6 applications
# install qt6ct & set "Adwaita-dark" as theme settings
# export this in ~/.zshrc and ~/.profile
export GTK_THEME=Adwaita-dark
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland
export QT_QPA_ICON_THEME=Adwaita
export GTK_ICON_THEME=Adwaita
export XDG_CURRENT_DESKTOP=GNOME
export GTK_APPLICATION_PREFER_DARK_THEME=1
