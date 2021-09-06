local uv = vim.loop
local terms = {
  kitty     = {ext="conf"},
}

-- Format each entry in a table, and concatenate them into a single string
local function concat_format(t)
  return table.concat(vim.tbl_map(function(x) return string.format(unpack(x)) end, t), "\n")
end

-- Get the directory where the melange plugin is located
local function get_dir()
  return debug.getinfo(1).source:match("@?(.*/)"):gsub("crumbling/lua/lush_theme/$", "")
end

-- Write the contents of a buffer to a file
local function write_file(file, buf)
  local fd = assert(uv.fs_open(get_dir() .. file, 'w', 420))
  uv.fs_write(fd, buf, -1)
  uv.fs_write(fd, '\n', -1)
  assert(uv.fs_close(fd))
end

function terms.kitty.build(colors)
  return concat_format {
    {"background %s", colors.bg};
    {"foreground %s", colors.fg2};
    {"cursor     %s", colors.fg2};
    {"url_color  %s", colors.n.blue};

    {"selection_background    %s", colors.bg_blue};
    {"selection_foreground    %s", colors.fg2};

    -- normal
    {"color0  %s",  colors.bg};
    {"color1  %s",  colors.n.red};
    {"color2  %s",  colors.n.green};
    {"color3  %s",  colors.n.yellow};
    {"color4  %s",  colors.n.blue};
    {"color5  %s",  colors.n.magenta};
    {"color6  %s",  colors.fg6};
    {"color7  %s",  colors.fg4};
    -- bright
    {"color8  %s", colors.bg5};
    {"color9  %s", colors.b.red};
    {"color10 %s", colors.fg2};
    {"color11 %s", colors.b.yellow};
    {"color12 %s", colors.n.blue};
    {"color13 %s", colors.n.magenta};
    {"color14 %s", colors.fg6};
    {"color15 %s", colors.fg4};
  }
end

local function build(colors)
  for k, v in pairs(terms) do
    write_file(
        string.format("/term/%s/crumbling.%s", k, v.ext),
        v.build(colors)
    )
  end
end

return { build = build }
