$ErrorActionPreference = 'Stop'

$SCRIPT_DIR = (Resolve-Path ".").Path
$COMMIT_HASH = $args[0]

Push-Location $SCRIPT_DIR
  # リポジトリの下に置きたいが、GitHub Actions の D:\ の容量が少なくてビルド出来ない問題があるので
  # このパスにソースを配置する。
  # また、WebRTC のビルドしたファイルは同じドライブに無いといけないっぽいのでこちらも設定する。
  python3 run.py build windows_x86_64 --debug --source-dir 'C:\webrtc' --build-dir 'C:\webrtc-build' --commit $COMMIT_HASH
  python3 run.py package windows_x86_64 --debug --source-dir 'C:\webrtc' --build-dir 'C:\webrtc-build'
Pop-Location
