get(){
  lvdisplay -a
}

extend_metadata(){
  lvresize -L +500M fedora_localhost-live/pool00_tmeta
}

extend_data(){
  lvresize -L +50G fedora_localhost-live/pool00_tdata
}


check(){
  lvs -a
}
