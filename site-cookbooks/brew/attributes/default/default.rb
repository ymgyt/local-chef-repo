# coding: utf-8
default['brew']['packages'] = {
  'coreutils' => {},
  'dep' => {},
  'gawk' => {},
  'git' => {},
  'gnu-sed' => {
    'options' =>  ['--with-default-names']
  },
  'jq' => {},
  'terraform' => {},
  'tree' => {},
  'zsh' => {},
  'zsh-completions' => {}
}

default['brew']['casks'] = [
  # あとたりなもの
  # iterm2
  # google-iem
  # pomotodo
  # sequel
  # postman
#  'alfred',
 # 'docker',
  #'evernote',
#  'karabiner-elements',
  'kindle',
  'slack',
]
       
