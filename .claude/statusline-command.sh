#!/usr/bin/env bash
# Claude Code status line. Reads JSON from stdin, prints one line.

input=$(cat)

model_raw=$(echo "$input" | jq -r '.model.display_name // "?"')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // empty')
ctx_used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
quota_5h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
quota_7d=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# Effort level — not in the JSON; read from settings.json (configured value, may be stale mid-session)
effort=$(jq -r '.effortLevel // empty' "$HOME/.claude/settings.json" 2>/dev/null)

dir="${cwd:-$(pwd)}"

# ANSI colors
R=$'\033[0m'; B=$'\033[1m'; D=$'\033[2m'
CYAN=$'\033[36m'; GREEN=$'\033[32m'; YELLOW=$'\033[33m'; RED=$'\033[31m'

# --- Path: collapse $HOME to ~, truncate to last 2 components if long
short=${dir/#$HOME/\~}
if [ ${#short} -gt 25 ]; then
  short="…/$(basename "$(dirname "$dir")")/$(basename "$dir")"
fi
path_part="${B}${CYAN}${short}${R}"

# --- Git: branch + dirty indicators
git_part=""
branch=$(git -C "$dir" --no-optional-locks branch --show-current 2>/dev/null)
if [ -n "$branch" ]; then
  porcelain=$(git -C "$dir" --no-optional-locks status --porcelain 2>/dev/null)
  flags=""
  echo "$porcelain" | grep -qE '^.[MD]'   && flags+="*"
  echo "$porcelain" | grep -qE '^[MADRC]' && flags+="+"
  echo "$porcelain" | grep -qE '^\?\?'    && flags+="?"
  if [ -n "$flags" ]; then
    git_part=" ${YELLOW}(${branch} ${flags})${R}"
  else
    git_part=" ${GREEN}(${branch})${R}"
  fi
fi

# --- Model: strip " (…)" suffix, lowercase, spaces→dashes
model=$(echo "$model_raw" | sed -E 's/ *\(.*\)//' | tr '[:upper:] ' '[:lower:]-')
model_part="${D}${model}${R}"

sep="${D}│${R}"

# --- Context % (used): color by threshold (high used = bad)
ctx_part=""
if [ -n "$ctx_used" ]; then
  pct=$(printf '%.0f' "$ctx_used")
  if   [ "$pct" -ge 80 ]; then c=$RED
  elif [ "$pct" -ge 50 ]; then c=$YELLOW
  else                         c=$GREEN
  fi
  ctx_part=" ${sep} ${D}ctx${R} ${c}${pct}%${R}"
fi

# --- Quota remaining: 100 - used; color by how much is left (low left = bad)
quota_color() {
  local left=$1
  if   [ "$left" -le 20 ]; then echo "$RED"
  elif [ "$left" -le 50 ]; then echo "$YELLOW"
  else                          echo "$GREEN"
  fi
}
quota_part=""
if [ -n "$quota_5h" ]; then
  left=$(printf '%.0f' "$(echo "100 - $quota_5h" | bc -l)")
  c=$(quota_color "$left")
  quota_part+=" ${sep} ${D}5h${R} ${c}${left}%${R}"
fi
if [ -n "$quota_7d" ]; then
  left=$(printf '%.0f' "$(echo "100 - $quota_7d" | bc -l)")
  c=$(quota_color "$left")
  quota_part+=" ${sep} ${D}7d${R} ${c}${left}%${R}"
fi

effort_part=""
[ -n "$effort" ] && effort_part=" ${sep} ${D}effort ${effort} (configured)${R}"

echo "${path_part}${git_part} ${sep} ${model_part}${ctx_part}${quota_part}${effort_part}"
