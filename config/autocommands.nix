{
	autoCmd = [
		# Vertically center document when entering insert mode
		{
			event = "InsertEnter";
			command = "norm zz";
		}

		# Open help in a vertical split
		{
			event = "FileType";
			pattern = "help";
			command = "wincmd L";
		}

		# Enable spellcheck for some filetypes
		{
			event = "FileType";
			pattern = [
				"markdown"
				"neorg"
			];
			command = "setlocal spell spelllang=en | set conceallevel=2 | set et | set linebreak | set textwidth=120 | set nowrap";
		}

		{
			event = "FileType";
			pattern = [ "nix" ];
			command = "set ts=4 | set sw=4 | set noet";
		}

		{
			event = "FileType";
			pattern = [ "cpp" "hpp" ];
			command = "set ts=4 | set sw=4 | set noet";
		}

		{
			event = "FileType";
			pattern = [ "c" "h"];
			command = "set tags=./tags,tags,/opt/toolchains/zephyr/tags,/home/wired/esp/esp-idf/tags;";
		}

		{
			event = "TermOpen";
			pattern = "*";
			command = "setlocal nospell";
		}

		{
			event = [
				"BufNewFile"
			];
			pattern = [
				"*.h"
			];
			callback = { __raw =  ''
				function()
				local filename = vim.fn.expand("%:t:r"):upper()
				local include_guard = "__" .. filename .. "_H__"
				local boilerplate = string.format(
				[[
/**
  * @file
  * @brief
  */
/* vim: set noet tw=8 sw=8: */
#if !defined(%s)
#define %s 1

#ifdef __cplusplus
extern "C" {
#endif
/**********************************************************
* Include files
**********************************************************/

/**********************************************************
* Macro definitions
**********************************************************/

/**********************************************************
* Type definitions
**********************************************************/

/**********************************************************
* Variable declarations
**********************************************************/

/**********************************************************
* Function Prototypes
**********************************************************/

/**********************************************************
* Functions
**********************************************************/

#ifdef __cplusplus
}
#endif

#endif /* %s */
]], include_guard, include_guard, include_guard)
				vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(boilerplate, "\n"))
				end
				'';
			};
		}
		{
			event = [
				"BufNewFile"
			];
			pattern = [
				"*.c"
			];
			callback = {__raw = ''
				function()
				local boilerplate = [[
/**
  * @file
  * @brief
  */
/* vim: set noet tw=8 sw=8: */
/**********************************************************
* Include files
**********************************************************/

/**********************************************************
* Macro definitions
**********************************************************/

/**********************************************************
* Type definitions
**********************************************************/

/**********************************************************
* Variable declarations
**********************************************************/

/**********************************************************
* Function Prototypes
**********************************************************/

/**********************************************************
* Functions
**********************************************************/
]]
				vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(boilerplate, "\n"))
				end
			'';
			};
		}
		{
			event = [
				"BufNewFile"
			];
			pattern = [
				"*.rs"
			];
			callback = {__raw = ''
				function()
					local boilerplate = [[ /* vim: set noet tw=8 sw=8: */ ]]
					vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(boilerplate, "\n"))
				end
			'';
			};
		}
		{
			event = [ "BufNewFile" ];
			pattern = [ "*.hpp" "*.cpp" ];
			callback = { __raw = ''
	function()
		local function infer_namespace()
			local filepath = vim.fn.expand("%:h")
			local parts = vim.split(filepath, "/", { trimempty = true })
			local ns_parts = {}
			for _, p in ipairs(parts) do
				if p ~= "src" and p ~= "." and p ~= "include" then
					table.insert(ns_parts, p)
				end
			end
			return table.concat(ns_parts, "::")
		end

		local function cpp_boilerplate(kind)
			local filename = vim.fn.expand("%:t:r")
			local namespace_name = infer_namespace()
			if namespace_name == "" then
				namespace_name = filename
			end
			local namespace_open = "namespace " .. namespace_name .. " {"
			local namespace_close = "} /* namespace " .. namespace_name .. "*/"

			if kind == "hpp" then
				return string.format([[
/**
  * @file
  * @brief
  */
/* vim: set noet tw=8 sw=8: */
#pragma once /* %s */

#ifdef USE_PCH

#else

#endif

%s

%s
]], filename, namespace_open, namespace_close)
			elseif kind == "cpp" then
				local include_line = ""
				if filename ~= "main" then
					include_line = string.format('#include "%s.hpp"\n', filename)
				else
					namespace_open = ""
					namespace_close = ""
				end
				return string.format([[
/**
  * @file
  * @brief
  */
/* vim: set noet tw=8 sw=8: */
#ifdef USE_PCH

#else

#endif
%s

%s

%s
]], include_line, namespace_open, namespace_close)
			end
		end

		local ext = vim.fn.expand("%:e")
		local text = cpp_boilerplate(ext)
		vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(text, "\n"))
	end
	'';
			};
		}
	];
}
