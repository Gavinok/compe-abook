local compe = require("compe")
local Job = require("plenary.job")
local Source = {}
Source.new = function()
  local self = setmetatable({}, {__index = Source})
  return self
end
Source.get_metadata = function(self)
  return {dup = 0, menu = "[abook]", priority = 100}
end
Source.determine = function(self, context)
  return compe.helper.determine(context)
end
Source.complete = function(self, context)
  return self:collect((context.context.line):match("%a+$"), context.callback)
end
Source.collect = function(self, partofname, callback)
  local results = {}
  do
    local job
    local function _0_(job0, _return)
      for _, line in ipairs(job0:result()) do
        local _let_0_ = vim.split(line, "\9", true)
        local email = _let_0_[1]
        local name = _let_0_[2]
        table.insert(results, {filter_text = name, kind = name, word = email})
        callback({incomplete = true, items = results})
      end
      return nil
    end
    job = Job:new({args = {"--mutt-query", partofname}, command = "abook", on_exit = _0_})
    job:start()
  end
  return results
end
return compe.register_source("abook", Source)
