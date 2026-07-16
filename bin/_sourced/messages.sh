#!/usr/bin/env bash

# printf with octal \033 instead of `echo -e "\e[..."`: macOS ships bash 3.2,
# whose echo does not interpret \e (added in bash 4.0), so colors printed as
# literal "\e[1m" text.

message_newline() {
	printf '\n'
}

message_debug() {
	printf 'DEBUG: %s\n' "${*}"
}

message_welcome() {
	printf '\033[1m%s\033[0m\n' "${*}"
}

message_warning() {
	printf '\033[33mWARNING\033[0m: %s\n' "${*}"
}

message_error() {
	printf '\033[31mERROR\033[0m: %s\n' "${*}"
}

message_info() {
	printf '\033[37mINFO\033[0m: %s\n' "${*}"
}

message_suggestion() {
	printf '\033[33mSUGGESTION\033[0m: %s\n' "${*}"
}

message_success() {
	printf '\033[32mSUCCESS\033[0m: %s\n' "${*}"
}
