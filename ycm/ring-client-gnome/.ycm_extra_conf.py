import imp
import os

os.environ['YCM_COMPILATION_DATABASE_FOLDER'] = '/home/reazem/git/dotfiles/ycm/ring-lrc'
main_config_path = os.path.expanduser('~/.ycm_extra_conf.py')

imp.load_source('main_config', main_config_path)
from main_config import *
