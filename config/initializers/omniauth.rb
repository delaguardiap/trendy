Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '186685168339513', '6746ae4ff521af949c44ace6ea2f50dc',
  :scope => 'email', :display => 'popup'
  provider :twitter, 'GXfiqA4pGA7fHlZ4twqBVhN3o', '02xTfcuxRlJzw6y03jPi7A6ex809CaoQfn8DjpFy36GI68qMaa'
end
