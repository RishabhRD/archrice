name=$(echo "" | dmenu -p "Enter name: ")
if [ -z $name ]; then
  echo "Playlist name empty"
else
  touch ~/.config/mpd/playlists/$name.m3u
  echo $HOME/Music/$name >> ~/.local/share/music/directories
  mkdir -p "~/Music/$name"
fi
