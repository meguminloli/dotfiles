{ config, pkgs, home, ... }: {
  programs.mpv = {
    enable = true;
    package = pkgs.mpv;
    config = {
      sub-auto = "fuzzy";
      sub-bold = "yes";
      osc = "no";
      msg-color = "yes";
      msg-module = "yes";
      volume-max = 200;
      profile = "gpu-hq";
      scale = "ewa_lanczossharp";
      cscale = "ewa_lanczossharp";
      tscale = "oversample";
      audio-file-auto = "fuzzy";
      audio-pitch-correction = "yes";
      autofit = "85%x85%";
    };
    profiles = {
      "protocol.file" = {
        network-timeout = 0;
        force-window = "yes";
        cache = "yes";
        demuxer-max-bytes = "2000MiB";
        demuxer-readahead-secs = 300;
        force-seekable = "yes";
      };
      "protocol-network" = {
        network-timeout = 5;
        hls-bitrate = "max";
        cache = "yes";
        demuxer-max-bytes = "2000MiB";
        demuxer-readahead-secs = 300;
      };
      "protocol.http" = {
        profile = "protocol-network";
      };
      "protocol.https" = {
        profile = "protocol-network";
      };
    };
  };
}
