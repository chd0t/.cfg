-- terminal
terminal = os.getenv("TERMINAL") or "wezterm"
terminal_cmd = terminal .. " -e "
--terminal_cmd = terminal ..
-- editor
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- web browser
web_browser = "firefox" -- Your web browser here, firefox, brave, chromium...

-- file browser
file_browser = "vifm" -- terminal app only, nnn, ranger, vifm...

-- Bellow are arguments to call a <class> and <exec> a program by terminal
-- post an issue if your terminal is not listed or to add new

-- for xst
terminal_args = { " -c ", " -e " }
-- for rxvt
-- terminal_args = { " -T ", " -e " }

-- for kitty
-- terminal_args = { " --class=" , " -e " }

-- {{{ Monitoring
net_device = "enp5s0" -- interface you want track, only one for now

-- Add files system you want to track, the line bellow match with:
-- /home/yagdra, /opt/musics and /opt/torrents, look with the tool 'df'
disks = { "dot", "musics", "torrents" }

-- Number of cpu/core, can be found with the command: ncore
cpu_core = 8
-- }}} End Monitoring

-- {{{ Sound Settings
-- choose alsa or pulseaudio, alsa will use amixer and pulseaudio pactl
sound_system = "pulseaudio" -- "alsa" or "pulseaudio" here.

-- }}} End Sound Setting

-- Lock screen TODO: use PAM
password = "awesome" -- password for the lock s`creen
