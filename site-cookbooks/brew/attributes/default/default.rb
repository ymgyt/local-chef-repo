default['brew']['packages'] = {
  'coreutils' => {},
  'gawk' => {},
  'git' => {},
  'gnu-sed' => {
    'options' =>  ['--with-default-names']
  },
  'jq' => {},
  'tree' => {}
}

default['brew']['casks'] = [
  'kindle',
  'slack'
]
       
