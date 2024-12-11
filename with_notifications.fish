function pomodoro --description 'set notifications off/on when running a task, and back to the original afterwards'
  set banners (gsettings get org.gnome.desktop.notifications show-banners)
  gsettings set org.gnome.desktop.notifications show-banners false
  $arv
  gsettings set org.gnome.desktop.notifications show-banners "$banners"
end
