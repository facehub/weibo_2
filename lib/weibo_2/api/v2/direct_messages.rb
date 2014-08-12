module WeiboOAuth2
  module Api
    module V2
      class DirectMessages < Base
      
        #read interfaces
        def receive(opt={})
          hashie get("direct_messages/fans_service/receive.json", :params => opt)
        end

        def conversation(uid, opt={})
          hashie get("direct_messages/fans_service/conversation.json", params: {uid: uid}.merge(opt))
        end
               
      end
    end
  end
end