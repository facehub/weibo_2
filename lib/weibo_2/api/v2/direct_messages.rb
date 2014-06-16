module WeiboOAuth2
  module Api
    module V2
      class DirectMessages < Base
      
        #read interfaces
        def inbox(id, opt={})
          hashie get("direct_messages.json", :params => opt)
        end
        
        def sent(opt={})
          hashie get("direct_messages/sent.json", :params => opt)
        end
        
        #write interfaces
        def create(user_id, message, opt={})
          hashie post("direct_messages/new.json", :body => {:user_id => user_id, :text => message}.merge(opt))
        end
        
        def destroy(id, opt={})
          hashie post("direct_messages/destroy.json", :body => {:id => id}.merge(opt))
        end
        
        def destroy_batch(ids, opt={})
          hashie post("direct_messages/destroy_batch.json", :body => {:ids => ids}.merge(opt))
        end
               
      end
    end
  end
end