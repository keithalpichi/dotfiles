# Dotfiles
> A collection of my custom dotfile configuration.

![dotfiles](https://user-images.githubusercontent.com/14797743/29226204-fd480fc2-7e85-11e7-83c9-5909788081bf.jpg)


# About
These dotfiles are collected and adapted from many other's to allow me to be as efficient and minimal as I can but still fit my coding style. I've avoided using large popular plugins that slowed bootup time.

<img width="366" alt="vim color scheme" src="https://user-images.githubusercontent.com/14797743/29227172-ac175460-7e89-11e7-8288-d42211906e61.png">

<img width="495" alt="bash prompt" src="https://user-images.githubusercontent.com/14797743/46518600-e706d880-c829-11e8-8fd6-a0320f0dac9c.png">

# What is included
- Vim configuration-
  - `.vimrc` contains all my core plugins, keymappings, snippets, and more
  - `.vim/` contains all configuration including the color customizations you see above
- Contrasting colors in terminal
  - `.bash_prompt`- configures all colors in the terminal
  - `.gitconfig`- configures git colors 
- Aliases- for commonly used commands. For example instead of typing `cd ..` to move the cwd up one level you can do `..` and `...` moves up two.

# Usage
I don't expect anyone to copy every dotfile and place it into their machine but I do encourage others to pick and choose the configuration they like. I've tried my best to document what each configuration does.

Go through each file, try a snippet of configuration, and see if you like it. If not remove it otherwise keep it.

# Terminal Setup
- iTerm2
- [`atom`](https://github.com/mbadolato/iTerm2-Color-Schemes#atom) color scheme
  - custom background color- #292C33
- [bash prompt config](https://github.com/keithalpichi/dotfiles/blob/master/.bash_prompt)
- [Hack 12pt font](https://sourcefoundry.org/hack/)
- "One" vim color scheme from "rakr/vim-one"


# Other Resources
- The [Hack font](https://sourcefoundry.org/hack/)
- To version control your collection of dotfiles (like this repo) follow the instructions in this [article](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)  - I placed this bare .git directory in my $HOME path under `.dotconfig`
  - I aliased the git command to `.conf` ("dot conf for short")
