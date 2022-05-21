die() {
  echo "$@" >&2
  exit 1
}

SESSION_DIR=$1
SESSION_NAME="$(basename "$SESSION_DIR" | tr . -)"

if [ -z "$SESSION_NAME" ]; then
  die "No session name found"
fi

session_exists() {
  tmux has-session -t "=$SESSION_NAME" &>/dev/null
}

create_detached_session() {
  tmux new-session -Ad -s "$SESSION_NAME" -c "$SESSION_DIR"
}

session_exists || create_detached_session

if [ -z "${TMUX-}" ]; then
  tmux attach -t "$SESSION_NAME"
else
  tmux switch-client -t "$SESSION_NAME"
fi

