local M = {}

M.extract_vis_text = function()
    local current_mode = vim.fn.mode()

    local start_info = vim.fn.getpos("v")
    local end_info = vim.fn.getpos(".")

    vim.print(current_mode)
    -- if its the whole line, always get from beginning
    if current_mode == "V" then
        if (start_info[2] == end_info[2]) then
            return vim.fn.getline(start_info[2])
        else
            return table.concat(vim.fn.getline(start_info[2], end_info[2]), "\n")
        end
    elseif current_mode == "v" then
        return table.concat(vim.fn.getregion(start_info, end_info), "\n")
    else
        vim.print("Failure to select in visual mode")
    end
end


M.jasmine_escape = function(str)
    --find .  -type f | xargs sed -i 's/\#include "ast\/ast.h"/haha/g'
    local escaped = vim.fn.escape(str, "/#")
    return escaped
end

function string:contains(sub)
    return self:find(sub, 1, true) ~= nil
end

return M
