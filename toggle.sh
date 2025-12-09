#!/bin/bash

# Theme switcher for GTK and Qt applications
# Usage: theme-switch [light|dark|toggle]

QT5CT_CONF="$HOME/.config/qt5ct/qt5ct.conf"
QT6CT_CONF="$HOME/.config/qt6ct/qt6ct.conf"
ZSHENV="$HOME/.zshenv"

get_current_theme() {
  if grep -q "GTK_THEME=Adwaita:dark" "$ZSHENV" 2>/dev/null; then
    echo "dark"
  else
    echo "light"
  fi
}

switch_gtk_theme() {
  local theme=$1

  if [ "$theme" = "dark" ]; then
    sed -i 's/^export GTK_THEME=Adwaita.*/export GTK_THEME=Adwaita:dark/' "$ZSHENV"
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' 2>/dev/null
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null
  else
    sed -i 's/^export GTK_THEME=Adwaita.*/export GTK_THEME=Adwaita/' "$ZSHENV"
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' 2>/dev/null
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light' 2>/dev/null
  fi
}

ensure_qt_config() {
  local conf_file=$1
  local conf_dir=$(dirname "$conf_file")

  mkdir -p "$conf_dir"

  if [ ! -f "$conf_file" ]; then
    cat >"$conf_file" <<'EOF'
[Appearance]
color_scheme_path=
custom_palette=false
icon_theme=Adwaita
standard_dialogs=default
style=Adwaita

[Fonts]
fixed=@Variant(\0\0\0@\0\0\0\x12\0M\0o\0n\0o\0s\0p\0\x61\0\x63\0\x65@$\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)
general=@Variant(\0\0\0@\0\0\0\x12\0S\0\x61\0n\0s\0 \0S\0\x65\0r\0i\0\x66@$\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)

[Interface]
activate_item_on_single_click=1
buttonbox_layout=0
cursor_flash_time=1000
dialog_buttons_have_icons=1
double_click_interval=400
gui_effects=@Invalid()
keyboard_scheme=2
menus_have_icons=true
show_shortcuts_in_context_menus=true
stylesheets=@Invalid()
toolbutton_style=4
underline_shortcut=1
wheel_scroll_lines=3
EOF
  fi
}

switch_qt_theme() {
  local theme=$1

  ensure_qt_config "$QT5CT_CONF"
  ensure_qt_config "$QT6CT_CONF"

  if [ "$theme" = "dark" ]; then
    # Set dark style
    sed -i 's/^style=.*/style=Adwaita-Dark/' "$QT5CT_CONF"
    sed -i 's/^style=.*/style=Adwaita-Dark/' "$QT6CT_CONF"
  else
    # Set light style
    sed -i 's/^style=.*/style=Adwaita/' "$QT5CT_CONF"
    sed -i 's/^style=.*/style=Adwaita/' "$QT6CT_CONF"
  fi
}

switch_app_theme() {
  local theme=$1

  if [ "$theme" = "dark" ]; then
    sed -i 's/latte/mocha/' ~/.config/ghostty/config
    sed -i 's/latte/mocha/' ~/.tmux.conf
    sed -i 's/latte/mocha/' ~/.config/nvim/lua/plugins/colorscheme.lua
    pkill -SIGUSR2 ghostty 2>/dev/null || true
  else
    sed -i 's/mocha/latte/' ~/.config/ghostty/config
    sed -i 's/mocha/latte/' ~/.tmux.conf
    sed -i 's/mocha/latte/' ~/.config/nvim/lua/plugins/colorscheme.lua
    pkill -SIGUSR2 ghostty 2>/dev/null || true
  fi
}

switch_waybar_theme() {
  local theme=$1
  local waybar_config="$HOME/.config/waybar"
  local waybar_style_conf="$HOME/dotfiles/arch-wayland/waybar"

  if [ -f "$waybar_style_conf/style-$theme.css" ]; then
    ln -sf "$waybar_style_conf/style-$theme.css" "$waybar_config/style.css"
    # Reload waybar
    pkill -SIGUSR2 waybar 2>/dev/null || true
  fi
}

switch_swaylock_theme() {
  local theme=$1
  local swaylock_config="$HOME/.config/swaylock"
  local swaylock_conf_loc="$HOME/dotfiles/arch-wayland/swaylock/"

  if [ -f "$swaylock_conf_loc/config-$theme" ]; then
    ln -sf "$swaylock_conf_loc/config-$theme" "$swaylock_config/config"
    pkill swaylock 2>/dev/null || true
  fi
}

switch_fuzzel_theme() {
  local theme=$1
  local fuzzel_config="$HOME/.config/fuzzel"
  local fuzzel_conf_loc="$HOME/dotfiles/arch-wayland/fuzzel/"

  if [ -f "$fuzzel_conf_loc/fuzzel-$theme.ini" ]; then
    ln -sf "$fuzzel_conf_loc/fuzzel-$theme.ini" "$fuzzel_config/fuzzel.ini"
    # Restart fuzzel to apply new theme
    pkill fuzzel 2>/dev/null || true
  fi
}

switch_wleave_theme() {
  local theme=$1
  local wleave_config="$HOME/.config/wleave"
  local wleave_config_loc="$HOME/dotfiles/arch-wayland/wleave"

  if [ -f "$wleave_config_loc/style-$theme.css" ]; then
    ln -sf "$wleave_config_loc/style-$theme.css" "$wleave_config/style.css"
  fi
}

switch_dunst_theme() {
  local theme=$1
  local dunst_config="$HOME/.config/dunst"
  local dunst_config_loc="$HOME/dotfiles/arch-wayland/dunst"

  if [ -f "$dunst_config_loc/dunstrc-$theme" ]; then
    ln -sf "$dunst_config_loc/dunstrc-$theme" "$dunst_config/dunstrc"
    pkill dunst 2>/dev/null || true
  fi
}

apply_theme() {
  local theme=$1

  echo "Switching to $theme theme..."

  switch_gtk_theme "$theme"
  switch_qt_theme "$theme"
  switch_app_theme "$theme"
  switch_waybar_theme "$theme"
  switch_swaylock_theme "$theme"
  switch_fuzzel_theme "$theme"
  switch_wleave_theme "$theme"
  switch_dunst_theme "$theme"

  # Source the updated environment
  export GTK_THEME=$(grep "^export GTK_THEME=" "$ZSHENV" | cut -d'=' -f2)
  tmux kill-server

  echo "✓ Theme switched to $theme mode."
  echo "✓ GTK apps should update automatically"
  echo "! Qt apps (VLC, etc.) need to be restarted"
}

# Main logic
case "$1" in
light)
  apply_theme "light"
  ;;
dark)
  apply_theme "dark"
  ;;
toggle)
  current=$(get_current_theme)
  if [ "$current" = "dark" ]; then
    apply_theme "light"
  else
    apply_theme "dark"
  fi
  ;;
*)
  current=$(get_current_theme)
  echo "Current theme: $current"
  echo "Usage: $0 [light|dark|toggle]"
  exit 1
  ;;
esac
