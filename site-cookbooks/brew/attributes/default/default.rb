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
  # cask外でinstallしているとerrorになる.かといってforceで既存こわしたくない.悩ましい
  # 'alfred',
  # 'evernote',
  # 'google-chrome',
  'kindle',
  'slack',
]
       
