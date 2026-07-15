# Setting up a fresh macOS machine

Run the bootstrap first (see [`README.md`](README.md) — three lines). Once it finishes, work through the checklist below.

## 1. Manual installations
- [ ] [Proton Pass Firefox extension](https://addons.mozilla.org/en-US/firefox/addon/proton-pass/)
- [ ] [GlobalProtect](https://vpn.york.ac.uk)

## 2. Changing operating system defaults
### macOS
- [ ] Set Zen as the default browser via **System Settings → Desktop & Dock → Default web browser**
- [ ] Open SensibleSideButtons, Rectangle and Scroll Reverser for the first time and grant them Accessibility permissions
- [ ] Add SensibleSideButtons, Rectangle, Scroll Reverser and Stats to Login items

### CachyOS
- [ ] Set Zen as the default browser via the app
- [ ] Enable "Use autoscrolling" in Zen settings (enables middle mouse click scrolling)

## 3. Authentication
### SSH
The stowed `~/.ssh/config` already lists your hosts. Generate fresh key material and register it:
- [ ] Generate keys per host and **revoke old keys**. Store them like `~/.ssh/keys/github/id_ed25519`
	- [ ] GitHub (Settings → SSH and GPG keys)
	- [ ] BitBucket (Personal settings → SSH keys)
	- [ ] ARCHER2 SAFE
- [ ] `gh auth login` to authenticate the GitHub CLI (recreates `~/.config/gh/hosts.yml`)

### Accounts
- [ ] Sign in to internet accounts for Mail and Calendar
	- [ ] Personal
	- [ ] PhD / work
	- [ ] Tutoring
- [ ] Configure Zen Spaces (Personal, PhD/Work, Tutoring), pinned tabs and Essentials; sign in to associated accounts in each space
- [ ] Sign in to Obsidian Sync (then restore vault)
- [ ] Sign in to Zoom
- [ ] Sign in to WhatsApp
- [ ] Sign in to Claude and Claude Code
- [ ] Sign in to Zotero (cloud sync)

## 4. Configuring Obsidian
Install the following community plugins
- [ ] Better Export PDF
- [ ] Dataview
- [ ] Hide Folders
	- Add "Archive" and "templates" to list of folders to hide
- [ ] Iconize
- [ ] Syle Settings
	- Appearance -> CSS snippets -> Enable `extended-colorschemes.css` and `nord-export-to-PDF`
	- AnuPpuccin Themes Extended -> Toggle extended dark theme
