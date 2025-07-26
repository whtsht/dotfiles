{ pkgs, config, ... }:

{
  sops.secrets.ntfy_admin_token = {
    sopsFile = ../../secrets/ntfy.yml;
    path = "%r/secrets/ntfy_admin_token";
  };

  home.packages = with pkgs; [
    (writeShellScriptBin "ntfy-send" ''
      if [ $# -lt 2 ]; then
        echo "Usage: ntfy-send <topic> <message> [title]"
        echo "Example: ntfy-send alerts 'Hello World' 'My Title'"
        exit 1
      fi

      TOPIC="$1"
      MESSAGE="$2"
      TITLE="$3"

      TOKEN=$(cat /run/user/$(id -u)/secrets/ntfy_admin_token)

      if [ -n "$TITLE" ]; then
        ${curl}/bin/curl -H "Authorization: Bearer $TOKEN" \
                         -H "Title: $TITLE" \
                         -d "$MESSAGE" \
                         https://desktop.tail74e0bd.ts.net/"$TOPIC"
      else
        ${curl}/bin/curl -H "Authorization: Bearer $TOKEN" \
                         -d "$MESSAGE" \
                         https://desktop.tail74e0bd.ts.net/"$TOPIC"
      fi
    '')
  ];
}
