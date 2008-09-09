module ShouldRequireLogin
  
  def should_require_login(*actions)
    options = actions.extract_options!
    options.reverse_merge({
      :method => :get,
      :params => {}
    })
    
    actions.each do |action|
      context "for #{options[:method].to_s.upcase} to #{action}" do
        context 'with no user signed in' do
          setup do
            login_as nil
            send(options[:method], action, options[:params])
          end
          
          should_respond_with :redirect
          should_redirect_to  'login_url'
        end
        
        if options[:with_user]
          context "with #{options[:with_user]} signed in" do
            setup do
              login_as options[:with_user]
              send(options[:method], action, options[:params])
            end
          
            should_respond_with :success
          end
        end
      end
    end
  end
  
end
