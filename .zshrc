export PATH="$HOME/.npm-global/bin:$PATH"

# setfanspeed function
setfanspeed() {
  if [[ -z $1 ]]; then
    echo "usage: setfanspeed <0-100>"
    return 1
  fi

  if ! [[ $1 =~ ^[0-9]+$ ]] || (( $1 < 0 || $1 > 100 )); then
    echo "fan speed must be an integer between 0 and 100"
    return 1
  fi

  echo "etting GPU fan speed to $1%"

  sudo DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY nvidia-settings -a GPUFanControlState=1 -a GPUTargetFanSpeed=$1
}

# syncnix
syncbux() {
sudo nixos-rebuild "$@"
/etc/nixos/sync-nixos.sh
}

export PATH=$PATH:/home/sidharthify/.spicetify
