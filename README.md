# dvbt_hauppage_dualhd_tools

This repository contains simple tools for viewing and recording live TV, using the [Hauppage WinTV-dualHD](https://www.hauppauge.com/pages/products/data_dualhd.html) USB tuner.

# record.sh

- First run will generate the `atsc.conf` file necessary for tuning.
- After, run `./record.sh <channel-name> [output-file.mkv]`.

# watchlive.sh

- `./watchlive.sh`

# Requirements

- w_scan_cpp
- dvbv5-scan
- dvbv5-zap
- ffmpeg (if recording)
- vlc (if streaming)
