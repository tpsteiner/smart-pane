--- @since 25.4.8
--- @sync entry
--- Thanks to https://github.com/yazi-rs/plugins/blob/main/toggle-pane.yazi/main.lua for MIT license

local function entry(self, job)
	if #job.args ~= 1 or (job.args[1] ~= "enter" and job.args[1] ~= "leave") then
		return
	end

	local h = cx.active.current.hovered
	local default = rt.mgr.ratio
	local is_dir = h and h.cha.is_dir

	self.parent = self.parent or default.parent
	self.current = self.current or default.current
	self.preview = self.preview or default.preview

	local parent_is_hidden = 0 == self.parent
	local current_is_hidden = 0 == self.current

	if job.args[1] == "leave" then
		if parent_is_hidden and current_is_hidden then
			self.current = default.current
		elseif parent_is_hidden then
			self.parent = default.parent
		else
			ya.mgr_emit("leave", {})
		end
	else
		if is_dir then
			ya.mgr_emit("enter", {})
		elseif not parent_is_hidden then
			self.parent = 0
		elseif not current_is_hidden then
			self.current = 0
		end
	end

	Tab.layout = function(tab_self)
		local all = self.parent + self.current + self.preview

		tab_self._chunks = ui.Layout()
			:direction(ui.Layout.HORIZONTAL)
			:constraints({
				ui.Constraint.Ratio(self.parent, all),
				ui.Constraint.Ratio(self.current, all),
				ui.Constraint.Ratio(self.preview, all),
			})
			:split(tab_self._area)
	end

	if ya.emit then
		ya.emit("app:resize", {})
	else
		ya.app_emit("resize", {})
	end
end

return { entry = entry }
