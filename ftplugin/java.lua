-- ftplugin/java.lua
local jdtls = require("jdtls")
local mason = vim.fn.stdpath("data") .. "/mason"

-- 1) Tomar el archivo actual (no el cwd)
local fname = vim.api.nvim_buf_get_name(0)

-- 2) Encontrar la raíz hacia arriba desde el archivo
local root_markers = { ".git", "mvnw", "gradlew", ".project", ".classpath" }
local function find_root()
  local path = fname
  local uv = vim.uv or vim.loop
  local function is_dir(p) return uv.fs_stat(p) and uv.fs_stat(p).type == "directory" end
  local dir = vim.fs.dirname(path)
  while dir and dir ~= "" do
    for _, m in ipairs(root_markers) do
      local candidate = dir .. "/" .. m
      if (m == ".git" and is_dir(candidate)) or (vim.fn.filereadable(candidate) == 1) then
        return dir
      end
    end
    local parent = vim.fs.dirname(dir)
    if parent == dir then break end
    dir = parent
  end
  return vim.fn.getcwd()
end

local root_dir = find_root()

-- 3) Workspace único por proyecto/raíz
local workspace_dir = (vim.loop.os_homedir() or os.getenv("HOME")) ..
  "/.local/share/eclipse/" .. vim.fs.basename(root_dir)

-- 4) Comando: usa el wrapper de Mason (no hardcodees el .jar)
local cmd = { mason .. "/bin/jdtls", "-data", workspace_dir }

-- 5) Arrancar o adjuntar por buffer
local config = {
  cmd = cmd,
  root_dir = root_dir,
  settings = { java = {} },
  capabilities = (function()
    local ok, cmp = pcall(require, "cmp_nvim_lsp")
    return ok and cmp.default_capabilities() or nil
  end)(),
  init_options = { bundles = {} },
}

jdtls.start_or_attach(config)
