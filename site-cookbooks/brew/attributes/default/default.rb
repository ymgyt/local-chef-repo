default['brew']['packages'] = {
  'coreutils' => {},
  'gawk' => {},
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
       
