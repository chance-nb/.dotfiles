return {
	"rmagatti/auto-session",
	lazy = false,

	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Downloads", "/" },
		bypass_save_filetypes = { "snacks_dashboard", "snacks_picker_list" },
		close_filetypes_on_save = { "checkhealth", "", "qf" },
		auto_restore_last_session = true,
		purge_after_minutes = 20160,
		show_auto_restore_notif = true,
	},
}
