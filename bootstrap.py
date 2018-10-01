#!/usr/bin/env/python

import logging
import os
import subprocess


def shell_command(arguments):
    """Executes shell command and exits script upon error"""
    if subprocess.call(arguments) != 0:
        command = ' '.join(arguments)
        logging.error("`{}` returned non-zero exit code.".format(command))

def remove_and_symlink(file_name, home, script):
    """Removes an existing file and symlinks the replacement"""
    try:
        os.remove('{}/{}'.format(home, file_name))
    except OSError:
        logging.warning('Not deleting existing `{}`'.format(file_name))
    os.symlink(
        '{}/{}'.format(os.path.dirname(script), file_name),
        '{}/{}'.format(home, file_name))

# Determine script directory and create workspace
script_path = os.path.abspath(__file__)
home_path = os.path.expanduser('~')
workspace = '{}/workspace'.format(home_path)
logging.info('Creating workspace directory: {}'.format(workspace))
try:
    os.mkdir(workspace)
except OSError:
    logging.info('Workspace directory ({}) already exists.'.format(workspace))

# Install maximum-awesome (homebrew, vim, tmux, solaris iterm settings, etc)
logging.info('Installing maximum-awesome (Homebrew/Vim/tmux/iTerm2 support).')
os.chdir('{}'.format(workspace))
shell_command(['git', 'clone', 'https://github.com/square/maximum-awesome'])
os.chdir('{}/maximum-awesome'.format(workspace))
shell_command(['rake'])
os.chdir(workspace)

# Install homebrew
logging.info('Updating HomeBrew')
shell_command(['brew', 'update'])

# Install PostgreSQL, Python, Node, Go, Nginx, redis, tree, vim, mongodb,
# packer, graphviz, wget, kdiff3, htop, and zsh
logging.info(
    'Installing Python, Node, Go, Nginx, redis, tree, vim, '
    'graphviz, kdiff3, wget, htop, rg, jq, and zsh')
shell_command([
    'brew', 'install', 'python3', 'python', 'node', 'go',
    'nginx', 'redis', 'tree', 'vim', 'graphviz', 'wget',  'tmux',
    'zsh', 'htop', 'pyenv', 'nvm', 'Caskroom/cask/kdiff3', 'rg', 'jq'])

# Upgrade PIP
logging.info('Upgrading Pip')
shell_command(['pip', 'install', '-U', 'pip'])

# Install LSI and psutil
logging.info('Installing LSI, psutil, and pylint')
shell_command(['pip', 'install', 'lsi', 'psutil', 'pylint'])

# Install Oh My Zsh
logging.info('Installing Oh My Zsh')
shell_command([
    'wget', '-O', '/tmp/omz.sh',
    'https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh'])
shell_command(['sh', '/tmp/omz.sh'])

# Install Powerline
logging.info('Installing Powerline Fonts')
os.chdir(workspace)
shell_command(['git', 'clone', 'https://github.com/powerline/fonts.git'])
os.chdir('{}/fonts'.format(workspace))
shell_command(['sh', 'install.sh'])

logging.info('Installing Powerline')
shell_command(['pip', 'install', 'powerline-status'])

logging.info('Removing unnecessary local dotfiles and symlink new files.')
remove_and_symlink('.gitconfig', home_path, script_path)
remove_and_symlink('.tmux.conf.local', home_path, script_path)
remove_and_symlink('.vimrc.local', home_path, script_path)
remove_and_symlink('.zshrc', home_path, script_path)
remove_and_symlink('.iterm2_shell_integration.zsh', home_path, script_path)

