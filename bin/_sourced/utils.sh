#!/usr/bin/env bash
set -e

working_dir="$(dirname ${0})"
source "${working_dir}/_sourced/messages.sh"

check_file_exists() {
	declare desc="Check if file exists"
	local file_path="${1}"

	if [ ! -f "${file_path}" ]; then
		message_error "File not found: ${file_path}"
		exit 1
	fi
}

check_file_not_empty() {
	declare desc="Check if file is empty"
	local file_path="${1}"

	if [ ! -s "${file_path}" ]; then
		message_error "File is empty: ${file_path}"
		exit 1
	fi
}